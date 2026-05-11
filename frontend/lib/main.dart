// ======================================================
// FILE: main.dart
// PURPOSE: Entry point of the app. Sets up global theme
//          and launches the Login screen.
// ======================================================

import 'package:flutter/material.dart';
import 'MainPage/login_screen.dart'; // renamed from: lecture10-11.dart

void main() {
  return runApp(
    MaterialApp(
      // Global theme applied to all screens in the app
      theme: ThemeData(
        appBarTheme: AppBarThemeData(
          // Rounded bottom corners for all AppBars
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            side: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          // Default icon style for AppBar icons
          iconTheme: IconThemeData(
            size: 30,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          // Default text style for AppBar titles
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      // First screen shown when the app starts
      home: Login(),
    ),
  );
}
