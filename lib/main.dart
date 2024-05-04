import 'package:expansetracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
var kcolorscheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(247, 143, 7, 216),
); //? Creating a color scheme for the app
//* This file is the main file from where everything runs
//* it's the entry point of the app
var kdarkcolorscheme=ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125,),brightness: Brightness.dark); //? We added this variable to store theme color  for dark mode 
void main() { WidgetsFlutterBinding.ensureInitialized(); //?We have created this Ensure initialised to run app after ui is set to portrait only 
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]).then((fn){runApp(  //#This System Chrome and set preffered orientation locks device orientation to portait only 
    MaterialApp(darkTheme: ThemeData.dark().copyWith(useMaterial3: true,colorScheme: kdarkcolorscheme), //# There's a special parameter for dark theme in flutter 
        theme: ThemeData().copyWith(
            //# Using this Themedata We are providing basic theme for vairous elements in our app
            //# We are using this function so that we don't have to manually change the styling of every widget , Rather we can choose from a default theme
            useMaterial3: true,
            scaffoldBackgroundColor: Color.fromARGB(255, 239, 214, 234),
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
                    fontSize: 14))),themeMode: ThemeMode.system,//? Here we set the theme to be default as system theme either dark or light as selected by user 
        home: const Expenses()),
  ); //? Adding Themedata then using Material 3= true will change appbar from blue to White});
 });} //
