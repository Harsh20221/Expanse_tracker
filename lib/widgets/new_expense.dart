import 'package:flutter/material.dart';

//* This file contains code for the Dialog box called modalbottomsheet that appears when user clicks on + button in appbar to add a new expense
class New_Expense extends StatefulWidget {
  const New_Expense({super.key});
  @override
  State<New_Expense> createState() {
    return _NewExpenseState(); //! Return this in the form of a function with () not just usual
  }
}

class _NewExpenseState extends State<New_Expense> {
  final _titlecontroller =
      TextEditingController(); //#TextEditingController is a build in controller that is used to control the textfield ,
  //#It is used to automatically store the text input without assigning variables for every field
  final _amountcontroller = TextEditingController();
  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            //? We have created a dialog box for title paprameter to be entered by user using Textfield
            controller:
                _titlecontroller, //?controller is used to control the textfield using the build in controller function in flutter that we defined in line 15
            maxLength:
                50, //? savetitleinput is defined at line 12 , This function keeps track of saved user input
            decoration: InputDecoration(
                label: Text(
                    "Title")), //? This line gives the name to the textfield dialog box to Title
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _amountcontroller,
            decoration: InputDecoration(prefixText: "\$" ,label: Text("Amount")), 
            //! Write prefixtext like this "\$" do not miss forward backslash else it'll give error 
          ),
          Row(
            children: [
              TextButton(onPressed: () {Navigator.pop(context);}, child: Text("Cancel")),
              ElevatedButton( //# Navigator function is a special function that helps in the navigation across the App , using .pop will close the dialog box 
                  //? We have created a button called Save Expense to save the entered title
                  onPressed: () {
                    print(_titlecontroller
                        .text); //? We are using _titlecontroller to save the entered title
                    print(_amountcontroller.text);
                  },
                  child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
