import 'package:expansetracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

///? In this file we are creating a new widget called expenses_list that will display the list of expenses on the screen
import 'package:expansetracker/models/expense.dart';

///* This file contains code for expenses_list , It defines how the list will displayed , It mainly takes care of the list view
class expenses_list extends StatelessWidget {
  const expenses_list(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;

  final void Function(Expense expense)
      onRemoveExpense; //! We have created this function to remove the expense from the list because onDismissed function of Dismissible widget requires a function that takes an argument of type Expense
    //! Not creating this function will give an error because Dismissible widget requires a function that takes an argument of type Expense
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //?  we are using ListView.builder to create a list of expenses that will be displayed on the screen ,
        ///? it's speciality is that it only renders the items that are visible on the screen
        itemCount: expenses
            .length, //? itemCount is the number of items that we want to display in the list
        itemBuilder: ((context, index) => Dismissible(  //# Dismissible is a widget that allows us to swipe the item to delete it
            key: ValueKey(expenses[
                index]), //# ValueKey is a special key that takes the value of the item that we want to delete , expenses[index] is the item that we want to delete
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);//! write expenses[index] inside onRemoveExpense function do not write expense[index] or any other name because it'll give error
            },
            child: expense_item(expenses[
                index])))); //* Here we are using expense_item class that we created inside expense_item file to display the list in the form of a card style instead of simple text

    ///? Here we are using expense_item class
    ///?that we created inside expense_item file to display the list in the form of a card style instead of simple text
  } //? itemBuilder is a function that takes two arguments context and index and returns a widget that will be displayed at that index
}
