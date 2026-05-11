// ======================================================
// FILE: base_menu_grid.dart
// RENAMED FROM: MenuBasePage.dart
// PURPOSE: Displays a 3-column grid of menu cards for
//          the "ຈັດການຂໍ້ມູນພື້ນຖານ" (Base Data Management)
//          tab. Each card navigates to its own page.
// ======================================================

import 'package:flutter/material.dart';
import 'package:myapp/Sub_Menu_Page/unit_management_page.dart'; // unit_management_page.dart
import 'package:myapp/BookInfo/book_management_page.dart';           // book_management_page.dart

// ── Shared style constants ─────────────────────────────
double size_icon = 100;           // icon size inside each card
List color = [Colors.blue];       // icon color list (index 0 = blue)
String font = 'NotoSansLao';      // font family for Lao text labels
double font_size = 20;            // font size for card labels

// ── Icons for each menu card (order matches `data` list) ──
List icon = [
  Icon(Icons.ac_unit,                  size: size_icon, color: color[0]), // ຫົວໜວຍ
  Icon(Icons.category,                 size: size_icon, color: color[0]), // ປະເພດສິນຄ້າ
  Icon(Icons.folder_outlined,          size: size_icon, color: color[0]), // ສິນຄ້າ
  Icon(Icons.account_balance,          size: size_icon, color: color[0]), // ຜູ້ສະໜອງສິນຄ້າ
  Icon(Icons.delivery_dining_outlined, size: size_icon, color: color[0]), // ພະນັກງານ
  Icon(Icons.currency_exchange,        size: size_icon, color: color[0]), // ອັດຕາແລກປ່ຽນ
  Icon(Icons.book,                     size: size_icon, color: color[0]), // ຈັດການຂໍ້ມູນປື້ມ
];

// ── Labels for each menu card ──────────────────────────
List data = [
  "ຫົວໜວຍ",           // Unit
  "ປະເພດສິນຄ້າ",      // Product Category
  "ສິນຄ້າ",           // Product
  "ຜູ້ສະໜອງສິນຄ້າ",  // Supplier
  "ພະນັກງານ",         // Employee
  "ອັດຕາແລກປ່ຽນ",    // Exchange Rate
  "ຈັດການຂໍ້ມູນປື້ມ", // Book Management
];

class MenuBasePage extends StatefulWidget {
  const MenuBasePage({super.key});

  @override
  State<MenuBasePage> createState() => _MenuBasePageState();
}

class _MenuBasePageState extends State<MenuBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: data.length, // number of menu cards = 7
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,   // 3 cards per row
            mainAxisSpacing: 8,  // vertical gap between rows
            crossAxisSpacing: 8, // horizontal gap between columns
          ),
          itemBuilder: (context, idx) {
            return InkWell(
              onTap: () {
                // Decide which page to open based on the card label
                Widget page;
                if (data[idx] == "ຈັດການຂໍ້ມູນປື້ມ") {
                  page = Bookpage();   // → book_management_page.dart
                } else {
                  page = Unitpage();   // → unit_management_page.dart (placeholder for others)
                }
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => page),
                );
              },
              child: Card(
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    icon[idx], // large icon at the top of the card
                    Spacer(),  // pushes the label to the bottom
                    Text(
                      data[idx],
                      style: TextStyle(
                        fontSize: font_size,
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
