import 'package:flutter/material.dart';
import 'lecture10-11.dart';

void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarThemeData(
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
          iconTheme: IconThemeData(
            size: 30,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      home: Login(),
    )
  );
}
