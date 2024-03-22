import 'package:expansetracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expansetracker/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    ///! Write createState 's c in small and S in capital
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  ///? Here we are creating a stateful widget called Expenses and a state called _ExpensesState
  List<expense> _registeredexpenses = [
    ///? Here we are creating a list of expenses called _registeredexpenses using expense model from expense.dart
    expense(
        title: 'Flutter Course ',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    expense(
        title: 'Cinema',
        amount: 15.99,
        date: DateTime.now(),

        ///? Datetime.now is a function that returns the current date and time
        category: Category.leisure)
  ];
  @override
  Widget build(BuildContext context) {
    ///! write build's b in small letter and inside write BuildContext's B in capital letters
    return Scaffold(
        body: Column(
      children: [
        Text("I LOVE YOU "),Expanded(child:  expenses_list(  ///? Here we are displaying the list of expenses using expenses_list widget that we created in expenses_list.dart file
          expenses: _registeredexpenses, ///? We are wrapping expenses_list widget in Expanded widget so that it takes the remaining space on the screen
        ))

      ], //? Here we are displaying the list of expenses using expenses_list widget , _registered is defined at line 15
    ));
  }
}
