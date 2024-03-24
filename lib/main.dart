import 'package:expansetracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

//* This file is the main file from where everything runs 
//* it's the entry point of the app
void main(){
  runApp( MaterialApp(theme: ThemeData().copyWith( useMaterial3: true,scaffoldBackgroundColor:Color.fromARGB(255, 220, 189, 252),),home: Expenses(),)); //? Adding Themedata then using Material 3= true will change appbar from blue to White 

}  //