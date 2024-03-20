import  'package:flutter/material.dart';

class Expenses extends StatefulWidget {
const Expenses({super.key});
  @override
State <Expenses> createState(){ ///! Write createState 's c in small and S in capital 
  return _ExpensesState();

} 
  
}

class _ExpensesState extends State <Expenses> {
  @override
  Widget build(BuildContext context){  ///! write build's b in small letter and inside write BuildContext's B in capital letters 
    return Scaffold(body:Column(children: [Text("I LOVE YOU ")],));
  }
}