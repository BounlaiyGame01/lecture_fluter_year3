// ======================================================
// FILE: message_page.dart
// RENAMED FROM: Pagemessage.dart
// PURPOSE: Placeholder for the Messages section.
//          Content to be implemented later.
// ======================================================

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
        // TODO: add message list / chat UI here
      ),
    );
  }
}
