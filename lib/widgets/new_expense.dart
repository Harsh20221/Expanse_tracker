import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expansetracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
//* This file contains code for the Dialog box called modalbottomsheet that appears when user clicks on + button in appbar to add a new expense
//* it also contains the ui for every element of the dialog box like title , amount , date etc , it also contains the logic to save the entered data
class New_Expense extends StatefulWidget {
  const New_Expense({super.key, required this.onAddexpense});

  final void Function(Expense expense)  //? The structure for Expense list is defined inside expense.dart file inside models folder
      onAddexpense; //* This is creating a special method for a function type , It is helping in adding new expenses to the list by user , it is used in line 85 here to add new Expense 
  @override
  State<New_Expense> createState() {
    return _NewExpenseState(); //! Return this in the form of a function with () not just usual
  }
}

class _NewExpenseState extends State<New_Expense> {
  final formatter = DateFormat
      .yMd(); //? We have to create object of DateFormat class to format the date in the form of year month and date using intl package

  final _titlecontroller = //* This is a controller for dialog box is defined at line 55 , it is used to store user input
      TextEditingController(); //#TextEditingController is a build in controller that is used to control the textfield ,
  //#It is used to automatically store the text input without assigning variables for every field

  final _amountcontroller =
      TextEditingController(); //* This dialog box is defined at line 69 , used to store user input

  Category _selectedcategory = Category
      .leisure; //* Here we have created a variable called _selectedcategory to store the default category of the expense to be used in the dropdown menu at line 110

  DateTime?
      _selecteddate; //? Here we have created a variable called _selecteddate to store the selected date , the ? takes care of null input
//! Please make sure to use ? after DateTime to avoid null safety errors  and also make sure to not write = after DateTime?

  void _presentdatepicker() async {
    //? async is a special keyword that is used to make a function asynchronous , it is used to make the function wait for the user input
    final now = DateTime
        .now(); //? This is a  function that is used to get the current date and time
    final _firstdate = DateTime(now.year - 1, now.month,
        now.day); //? Here we have assigned variables to be put in the parameters of showDatePicker
    final picked_date = await showDatePicker(
        //# ShowDatePicker is a special function that is used to Add a datepicker widget
        //# await is a special keyword that is used to make the function wait for the user input
        context: context,
        initialDate: now,
        firstDate: _firstdate,
        lastDate: now);
    setState(() {
      _selecteddate = picked_date;
    });
  }

  void submit_expensedata() {
    //* This void function is checking for incorrect user inputs for amount , title and date
    final enteredamount = double.tryParse(_amountcontroller
        .text); //? This is a final variable entered amount to use tryparse and convert the string to float and if conversion is not successfull then null is returned
    final incorrectamount = enteredamount == null ||
        enteredamount <= 0; //? This checks for null value of  incorrect amt
    if (_titlecontroller.text.trim().isEmpty || //? This checks for empty title
        incorrectamount || //? This checks for incorrect amount
        _selecteddate == null) {
      //? This checks for null date
      //? This function returns error msg for incorrect amt , title and date
     
      void _showDialog()
      { if(Platform.isIOS){ showCupertinoDialog(context: context, builder: (ctx)=>CupertinoAlertDialog( title: const Text("Invlid Input"),
                content:
                    const Text("Please Input Correct Name , Amount and Date "),
                actions: [
                  //?Here we are using actions to display the button in the dialog box to close it
                  TextButton(
                      onPressed: () {
                        Navigator.pop(
                            context); //# Navigator.pop is a special function that is used to close the dialog box
                      },
                      child: const Text("Close"))
                ],));}
       else {showDialog(
          //# showDialog is a special function that is used to display a dialog box
          context: context,
          builder: (ctx) => AlertDialog(
                //# AlertDialog is a special function that is used to display a dialog box with title and content
                title: const Text("Invlid Input"),
                content:
                    const Text("Please Input Correct Name , Amount and Date "),
                actions: [
                  //?Here we are using actions to display the button in the dialog box to close it
                  TextButton(
                      onPressed: () {
                        Navigator.pop(
                            context); //# Navigator.pop is a special function that is used to close the dialog box
                      },
                      child: const Text("Close"))
                ],
              ));}
      

      }
      
      return _showDialog();
    }
    widget.onAddexpense(Expense(//# This is a special Widget function to add the expenses entered by the user
        title: _titlecontroller.text,
        amount: enteredamount,
        date: _selecteddate!,
        category:
            _selectedcategory)); 
    //? It is written inside submit_expense data after return because if the input entered by user is correct then this function will execute
  }

  @override
  void dispose() {
    //# Dispose is a special function that is used to clean up the resources that are used by the controller
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final keyboardspace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16,keyboardspace+16),
          child: Column(
            children: [
              TextField(
                //* This is a textfield dialog box for title parameter to be entered by user
                //? We have created a dialog box for title paprameter to be entered by user using Textfield
                controller:
                    _titlecontroller, //#controller is used to control the textfield using the build in controller function in flutter that we defined in line 15
                maxLength:
                    50, //? savetitleinput is defined at line 12 , This function keeps track of saved user input
                decoration: InputDecoration(
                    label: Text(
                        "Title")), //? This line gives the name to the textfield dialog box to Title
              ),
              Row(
                children: [
                  Expanded(
                    //! Make sure to wrap Amount Controller with expanded too as we are using expanded for Iconbutton for Time in line 53, not using it will create errors
                    child: TextField(
                      //*This is a textfield dialog box for amount parameter to be entered by user
                      keyboardType: TextInputType.number,
                      controller:
                          _amountcontroller, //? We are using _amountcontroller to save the entered amount
                      decoration:
                          InputDecoration(prefixText: "\$", label: Text("Amount")),
                      //! Write prefixtext like this "\$" do not miss forward backslash else it'll give error
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selecteddate == null
                          ? 'No Selected Date '
                          : formatter.format(
                              _selecteddate!)), //# Here We are Using A terinary operator to show the  user Of the Expense date that was picked by the user
                      //# We have also assigned null case using terinary operator if there was no input from user , the !after _selecteddate ensures there is no null error
      
                      IconButton(
                          //* This is a button called To select date , It is represented by a calendar icon in app
                          onPressed: () {
                            _presentdatepicker(); //? _presentdatepicker is defined at line 27
                          },
                          icon: Icon(Icons.calendar_month))
                    ],
                  ))
                ], //! Here Make sure that this button To select date is inside the row widget of Amount Textfield else it'll be placed below that
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  DropdownButton(
                      //* This is a dropdown button called Category to select the category of the expense
                      value:
                          _selectedcategory, //!!! Here the value is uded to show the current selected category of the expense chosen by the user
                      items: Category.values
                          .map((category) => DropdownMenuItem(
                              value:
                                  category, //!! Here value is the numeric value that will be stored in the database , it'll not be displayed and  will be used for backend purposes
                              //# map is a function that is used to convert the items into a list , by using => we are using a function that will return a widget
                              child: Text(category.name.toUpperCase())))
                          .toList(), //? .tolist is a function that is used to convert the items into a list not using it will create errors
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedcategory =
                              value; //? Here we are using setState to change the state of the dropout button when the category is selected
                        });
                      }),
      
                  const Spacer(), //# Spacer is a widget that takes all the available space between the two widgets
      
                  TextButton(
                      //* This is a button called Cancel to cancel the dialog box
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                      //* This is a button called Save Expense to save the entered expense
                      //# Navigator function is a special function that helps in the navigation across the App , using .pop will close the dialog box
                      //? We have created a button called Save Expense to save the entered title
                      onPressed: () {
                        submit_expensedata(); //?This is defined here at line 53 , tHis checks if the user has input correct expense data then adds new expense
                      },
                      child: const Text("Save Expense"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
