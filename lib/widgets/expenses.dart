import 'package:expansetracker/models/expense.dart';
import 'package:expansetracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expansetracker/widgets/expenses_list/expenses_list.dart';

//* This file contains the dummy data for expenses to test the app
//* and it also contains the code to change the state of the app and contains code for home screen of app like Scaffold and appbar
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
    ///* Here we are creating a list of expenses called _registeredexpenses using expense model from expense.dart
    Expense(
        //?The structure for Expense list is defined in expense.dart inside modals folder
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

  void _openAddExpenseOverlay() {
    //? This function will execute when appbar add  button will be pressed
    showModalBottomSheet(
        context: context,
        builder: (ctx) => New_Expense(
            onAddexpense:
                _addexpense)); //* New expense is a class thet we have made in new_expenses.dart file
    //* onAdd expense is also defined in new_expense file but _addexpense is defined here
  } //? This function will open a modal bottom sheet where we can enter our expenses to add  ,
//? the context and ctx are same paremeters that congtains various metadata about widget , it's positon in ui etc etc .
//? the => symbol represents return keyword

  void _addexpense(Expense expense) {
    //? This function _addexpense is pusing the expense value entered by the user to the list of _registeredexpenses
    setState(() {
      _registeredexpenses.add(expense);
    });
  }

  void _deleteexpense(Expense expense) {
    //? This function _deleteexpense is deleting the expense value entered by the user from the list of _registeredexpenses   it'll be used in expenses_list.dart file
    final expenseindex = _registeredexpenses.indexOf(expense); //? Here we are using indexOf function to get the index of the expense that we want to delete , it is to assist the snackbar to  restore the deleted expense
    setState(() {
      _registeredexpenses.remove(expense);
    });
 
    ScaffoldMessenger.of(context).showSnackBar( //# ScaffoldMessenger is a special widget that allows us to show snackbar , it's a smallpopup that appears at the bottom of the screen
      SnackBar(
        duration: const Duration(seconds: 3), //* This Snackbar  is responsible for showing the message that the expense has been deleted 
        //* and it also has a action button that will allow us to undo the delete operation
        content: const Text("Expense Deleted "),
        action: SnackBarAction(
            label: 'UNDO',  //! Very Important -- Do not Take Text Widget Inside label or else error will happen
            onPressed: () {
              setState(() {

                _registeredexpenses.insert(expenseindex, expense); //? Expenseindex defined at line 57 here in this code keeps track of the index of expense deleted 
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ///! write build's b in small letter and inside write BuildContext's B in capital letters

    Widget maincontent = const Center(
      child: Text("No Expenses Found, Please Enter Some!"),
    );
    if (_registeredexpenses.isNotEmpty) {
      //* Here we are checking if there are no expenses entered by the user and if we found that there are no expenses
      //* entered by the user then using the variable maincontent we are Displaying an error Mesasage
      maincontent = expenses_list(
        expenses: _registeredexpenses, onRemoveExpense: _deleteexpense, //
      ); //?onremoveexpense  is used to remove the expense from the list defined inside new_expense,
      //# _registeredexpenses is showing the all the registered expenses in the form of a list , that's why we have added the new expenses in this at line 34 using _addexpense function defined here at line 40
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Expense Tracker "),
          actions: [
            IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
          ],
        ), //? This is how you'll add  a addbutton along with appbar inside scaffold   , Icon Button is a special button type that we are using inside actions paremeter
        body: Column(
          //todo: Do not forget to add Appbar function after appbar: argument inside scaffold then define a i\IconButton inside actions parameter of Appbar function
          //todo:then also remember to use function Icon() then write Icons.add inside the Icon function  , don't just write Icons.add without function definition
          children: [
            Text("I LOVE YOU "),
            Expanded(child: maincontent)
          ], //? Here we are displaying the list of expenses using expenses_list widget , _registered is defined at line 18
        ));
  }
}
