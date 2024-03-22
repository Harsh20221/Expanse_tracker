import 'package:flutter/material.dart';
import 'package:expansetracker/models/expense.dart';

class expenses_list extends StatelessWidget {
  const expenses_list({super.key, required this.expenses});
  final List<expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) => Text(expenses[index].title)));
  }
}
