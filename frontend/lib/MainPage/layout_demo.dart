// ======================================================
// FILE: layout_demo.dart
// RENAMED FROM: lecture03-11.dart
// PURPOSE: Lecture/practice file demonstrating basic
//          Flutter layout — Column with Spacer and
//          colored Container boxes. Not part of the
//          main app flow; used for learning purposes.
// ======================================================

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          "ລະບົບສັ່ງຈອງສິນຄ້າ", // "Product Order System"
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),

      // ── Body: amber background with 4 colored boxes ───
      body: Container(
        margin: EdgeInsets.all(12),
        color: Colors.amber,
        child: Center(
          child: Column(
            children: [
              // Box 1 – green
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter', // "Text displayed in Flutter"
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Spacer(), // evenly distributes vertical space between boxes

              // Box 2 – blue
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Spacer(),

              // Box 3 – deep orange
              Container(
                width: 100,
                height: 100,
                color: Colors.deepOrange,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Spacer(),

              // Box 4 – black
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
                child: Text(
                  'ສະແດງຂໍ້ຄວາມທີ່ໃຊ້ໃນ Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
