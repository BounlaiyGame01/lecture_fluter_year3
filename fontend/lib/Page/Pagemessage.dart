import 'package:flutter/material.dart';

class Pagemessage extends StatefulWidget {
  const Pagemessage({super.key});

  @override
  State<Pagemessage> createState() => _PagemessageState();
}

class _PagemessageState extends State<Pagemessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the Message Page"),
      ),
    );
  }
}