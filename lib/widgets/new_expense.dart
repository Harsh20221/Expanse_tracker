import 'package:flutter/material.dart';
//* This file contains code for the Dialog box called modalbottomsheet that appears when user clicks on + button in appbar to add a new expense 
class New_Expense extends StatefulWidget {
  const New_Expense({super.key});
  @override
  State<New_Expense> createState() {
    return _NewExpenseState(); //! Return this in the form of a function with ()
  }
}
var _enteredtitle='';
class _NewExpenseState extends State<New_Expense> {
  void save_titleinput(String inputvalue){
   _enteredtitle=inputvalue;
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(  
        children: [
          TextField( //? We have created a dialog box for title paprameter to be entered by user using Textfield 
            onChanged: ,maxLength: 50,
            decoration: InputDecoration(label: Text("Title")), //? This line gives the name to the textfield dialog box to Title 
          )
        ],
      ),
    );
  }
}
