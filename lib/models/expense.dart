//* Here  we have created a model class called Expense which will have the following properties
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';  //? We have to import uuid package to generate unique id
import 'package:intl/intl.dart';
final uuid=Uuid(); //? We have to create object of Uuid class to generate unique id
enum Category {  //? Write enum name in capital letter  , we use enum to define a fixed set of constants
  food,
  travel,
  leisure,
  work,
}
final formatter=DateFormat.yMd(); //? We have to create object of DateFormat class to format the date in the form of year month and date using intl package
const Category_Icons= { //! Make sure to write = after defining Icons Category and write the categories inside {}
  Category.food:Icons.lunch_dining,
  Category.leisure:Icons.movie,
  Category.travel:Icons.flight_takeoff,
  Category.work:Icons.work
};
class Expense { //? Make sure to write class name Expense in capital letter because it'll interfare if you create any list called as expense later in this course inside expense_item.dart
Expense({
  required this.title,  
  required this.amount,
  required this.date,
  required this.category}):id=uuid.v4() ; //? We are using initializer list to initialize the id with unique id generated by uuid package


  final String id;
  final String title;
  final double amount ;
  final DateTime date;
  final Category category;
  
String get formatteddate{
  return formatter.format(date); //? Here we are using formatter object to format the date in the form of year month and date

}


}

class ExpenseBucket { //# This a a Additional Class to Organise Individual expense in Bukets to Help The Chart Widgets access individual expenses 
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)  //# Additional Constructor function to Sort Expenses 
      : expenses = allExpenses
            .where((expense) => expense.category == category) 
            .toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {  //# This for loop adds all the expenses and return the sum of all expenses 
      sum = sum + expense.amount;
    }
    return sum;
  }
}
