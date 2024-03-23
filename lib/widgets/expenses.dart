import 'package:expansetracker/models/expense.dart';
import 'package:expansetracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expansetracker/widgets/expenses_list/expenses_list.dart';
//* This file contains the dummy data for expenses to test the app 
//* and it also contains the code to change the state of the app and contains code for home screen of app like Scaffold and appbar 
class Expenses extends StatefulWidget {
  const Expenses({super.key }); 
  @override
  State<Expenses> createState() {
    ///! Write createState 's c in small and S in capital
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  ///? Here we are creating a stateful widget called Expenses and a state called _ExpensesState
  List<Expense> _registeredexpenses = [ ///* Here we are creating a list of expenses called _registeredexpenses using expense model from expense.dart
    Expense(   //?The structure for Expense list is defined in expense.dart inside modals folder 
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

void _openAddExpenseOverlay(){  //? This function will execute when appbar add  button will be pressed 
  showModalBottomSheet(context: context, builder: (ctx)=>New_Expense(onAddexpense:_addexpense )); //* New expense is a class thet we have made in new_expenses.dart file  
  //* onAdd expense is also defined in new_expense file but _addexpense is defined here 
} //? This function will open a modal bottom sheet where we can enter our expenses to add  ,
//? the context and ctx are same paremeters that congtains various metadata about widget , it's positon in ui etc etc .
//? the => symbol represents return keyword 

void _addexpense(Expense expense ){ //? This function _addexpense is pusing the expense value entered by the user to the list of _registeredexpenses 
  setState(() {
    _registeredexpenses.add(expense);  
  });
}

void _deleteexpense(Expense expense ){ //? This function _deleteexpense is deleting the expense value entered by the user from the list of _registeredexpenses   it'll be used in expenses_list.dart file
  setState(() {
    _registeredexpenses.remove(expense);
  });
}



  @override
  Widget build(BuildContext context) {
    ///! write build's b in small letter and inside write BuildContext's B in capital letters
  return Scaffold(appBar: AppBar(title: Text("Flutter Expense Tracker "),actions: [IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))],), //? This is how you'll add  a addbutton along with appbar inside scaffold   , Icon Button is a special button type that we are using inside actions paremeter 
        body: Column(  //todo: Do not forget to add Appbar function after appbar: argument inside scaffold then define a i\IconButton inside actions parameter of Appbar function 
        //todo:then also remember to use function Icon() then write Icons.add inside the Icon function  , don't just write Icons.add without function definition 
      children: [
        Text("I LOVE YOU "),Expanded(child:  expenses_list(  ///? Here we are displaying the list of expenses using expenses_list widget that we created in expenses_list.dart file
          expenses: _registeredexpenses,onRemoveExpense: _deleteexpense, ///? We are wrapping expenses_list widget in Expanded widget so that it takes the remaining space on the screen
        ))//!!onremoveexpense  is used to remove the expense from the list defined inside expense_list.dart
//# _registeredexpenses is showing the all the registered expenses in the form of a list , that's why we have added the new expenses in this at line 34 using _addexpense function defined here at line 40
      ], //? Here we are displaying the list of expenses using expenses_list widget , _registered is defined at line 18
    ));
  }
}
