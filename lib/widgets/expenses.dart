import 'package:expansetracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expansetracker/widgets/expenses_list/expenses_list.dart';
//* This file contains the dummy data for expenses to test the app 
//* and it also contains the code to change the state of the app
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
  List<Expense> _registeredexpenses = [
    ///? Here we are creating a list of expenses called _registeredexpenses using expense model from expense.dart
    Expense(
        title: 'Flutter Course ',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.99,
        date: DateTime.now(),

        ///? Datetime.now is a function that returns the current date and time
        category: Category.leisure)
  ];
  @override
  Widget build(BuildContext context) {
    ///! write build's b in small letter and inside write BuildContext's B in capital letters
  return Scaffold(appBar: AppBar(actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add))],),  //! This is how you'll add  a addbutton along with appbar inside scaffold 
        body: Column(  //todo: Do not forget to add Appbar function after appbar: argument inside scaffold  
        //todo:then also remember to use function Icon() then write Icons.add inside the function , don't just write Icons.add without function definition 
      children: [
        Text("I LOVE YOU "),Expanded(child:  expenses_list(  ///? Here we are displaying the list of expenses using expenses_list widget that we created in expenses_list.dart file
          expenses: _registeredexpenses, ///? We are wrapping expenses_list widget in Expanded widget so that it takes the remaining space on the screen
        ))

      ], //? Here we are displaying the list of expenses using expenses_list widget , _registered is defined at line 15
    ));
  }
}
