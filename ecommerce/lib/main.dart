// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.indigoAccent),
          textTheme: TextTheme(
            subtitle1: TextStyle(color: Colors.black), //<-- SEE HERE
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
        home: const LoginScreen());
  }
}