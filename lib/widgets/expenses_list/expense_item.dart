import 'package:expansetracker/models/expense.dart';
import 'package:flutter/material.dart';

//* This file contains the code for expense_item , how each expense will be displayed on the screen , It contains the style for every expense item , The style for icons and text is defined here
class expense_item extends StatelessWidget {
  const expense_item(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Text(expense.title),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.alarm),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expense.date.toString())
                ],
              )
            ],
          )
        ],

        ///? We are using Card widget to display the list of expenses in the form of a card style , //? We are isplaying amount in form of a dollar sign and date in form of a clock icon and we are using two dollar signs to display dollar sign next to amount
      ),
    )

        ///! Make sure to enclose the expense.title inside Text widget
        );

    ///! Make sure Padding is Inside the Card Widget
  }
}
