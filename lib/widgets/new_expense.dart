import 'package:flutter/material.dart';
//* This file contains code for the Dialog box called modalbottomsheet that appears when user clicks on + button in appbar to add a new expense 
class New_Expense extends StatefulWidget {
  const New_Expense({super.key});
  @override
  State<New_Expense> createState() {
    return _NewExpenseState(); //! Return this in the form of a function with ()
  }
}

class _NewExpenseState extends State<New_Expense> {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          )
        ],
      ),
    );
  }
}
