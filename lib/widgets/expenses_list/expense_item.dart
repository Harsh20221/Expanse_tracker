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
            Text(expense.title), const SizedBox(height: 4),Row(children: [Text('\$${expense.amount.toStringAsFixed(2)}'),Spacer(),Row(children: [Icon(Icons.alarm),const SizedBox(width: 8,),Text(expense.date.toString())],)],)
          ],
        ),) ///! Make sure to enclose the expense.title inside Text widget
    ); ///! Make sure Padding is Inside the Card Widget 
  }
}