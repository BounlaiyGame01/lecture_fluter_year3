// ======================================================
// FILE: sidebar_drawer.dart
// RENAMED FROM: DrawwerPage.dart
// PURPOSE: Left-side navigation drawer shown when the
//          user swipes right or taps the menu icon.
//          Contains user info header and main menu links.
// ======================================================

import 'package:flutter/material.dart';

class Drawwerpage extends StatelessWidget {
  const Drawwerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Rounded corners on the right side of the drawer
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero, // removes default top padding
          children: [

            // ── User info header at the top of the drawer ──
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade300),
              accountName: Text(
                "Script Store",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("Bounlaiyhi14@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("Image/icon.png"), // app logo
                backgroundColor: Colors.white,
              ),
            ),

            // ── Navigation items (each closes the drawer on tap) ──

            _buildDrawerItem(context, Icons.folder,      "ຈັດການຂໍ້ມູນພື້ນຖານ"), // Base data management
            _buildDrawerItem(context, Icons.shopping_bag, "ຂາຍ"),                // Sales
            _buildDrawerItem(context, Icons.arrow_forward, "ສັ່ງຊື້"),           // Orders
            _buildDrawerItem(context, Icons.download,    "ນຳເຂົ້າ"),             // Import
            _buildDrawerItem(context, Icons.search,      "ຄົ້ນຫາ"),             // Search
            _buildDrawerItem(context, Icons.description, "ລາຍງານ"),             // Reports
          ],
        ),
      ),
    );
  }

  // ── Helper: builds a single drawer menu row ────────────
  ListTile _buildDrawerItem(BuildContext context, IconData icon, String label) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 0, 204, 255)),
      title: Text(label, style: TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context); // close the drawer
        // TODO: navigate to the corresponding page for "$label"
      },
    );
  }
}
