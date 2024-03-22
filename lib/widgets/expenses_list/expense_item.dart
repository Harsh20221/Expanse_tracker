import 'package:expansetracker/models/expense.dart';
import 'package:flutter/material.dart';

class expense_item extends StatelessWidget{
  const expense_item ( this.expense,{super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
      child: Card(
        child: Text(expense.title), ///! Make sure to enclose the expense.title inside Text widget 
      ),
    );
  }
}