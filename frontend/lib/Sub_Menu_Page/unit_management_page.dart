// ======================================================
// FILE: unit_management_page.dart
// RENAMED FROM: Unitpage.dart
// PURPOSE: Placeholder page for "ຈັດການຂໍ້ມູນຫົວໜວຍ"
//          (Unit Data Management). Currently shows only
//          an AppBar — content to be added later.
// ======================================================

import 'package:flutter/material.dart';

class Unitpage extends StatefulWidget {
  const Unitpage({super.key});

  @override
  State<Unitpage> createState() => _UnitpageState();
}

class _UnitpageState extends State<Unitpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ຈັດການຂໍ້ມູນຫົວໜວຍ"), // "Unit Data Management"
      ),
      // TODO: add unit list, add/edit/delete functionality
    );
  }
}
