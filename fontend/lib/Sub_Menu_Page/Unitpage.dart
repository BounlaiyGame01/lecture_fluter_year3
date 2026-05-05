import 'package:flutter/material.dart';

class Unitpage extends StatefulWidget {
  const Unitpage({super.key});

  @override
  State<Unitpage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Unitpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຈັດການຂໍ້ມູນຫົວໜວຍ"),
      ),
    );
  }
}