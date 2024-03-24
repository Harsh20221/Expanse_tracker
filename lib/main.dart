import 'package:expansetracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kcolorscheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
); //? Creating a color scheme for the app
//* This file is the main file from where everything runs
//* it's the entry point of the app

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData().copyWith(
            //# Using this Themedata We are providing basic theme for vairous elements in our app
            //# We are using this function so that we don't have to manually change the styling of every widget , Rather we can choose from a default theme
            useMaterial3: true,
            scaffoldBackgroundColor: Color.fromARGB(255, 220, 189, 252),
            colorScheme: kcolorscheme,
            appBarTheme: AppBarTheme().copyWith(  //? AppBar Theme 
                //? To change AppBar Theme
                backgroundColor: kcolorscheme.primary,
                foregroundColor: kcolorscheme.primaryContainer),
            cardTheme: CardTheme().copyWith( //? Theme of Card Widget Responsible for displaying of Expense List 
                color: kcolorscheme.secondaryContainer,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(  //? Theme of Eleveted Button 
                    backgroundColor: kcolorscheme.primaryContainer)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: kcolorscheme.onSecondaryContainer,
                    fontSize: 14))),
        home: const Expenses()),
  ); //? Adding Themedata then using Material 3= true will change appbar from blue to White
} //
