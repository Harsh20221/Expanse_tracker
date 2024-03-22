import 'package:expansetracker/models/expense.dart';
import 'package:flutter/material.dart';

class expense_item extends StatelessWidget{
  const expense_item ( this.expense,{super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context){
    return  Card(   
        child:Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),child: Column(
          children: [
            Text(expense.title), const SizedBox(height: 4,)
          ],
        ),) ///! Make sure to enclose the expense.title inside Text widget
    ); ///! Make sure Padding is Inside the Card Widget 
  }
}