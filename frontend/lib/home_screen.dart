// ======================================================
// FILE: home_screen.dart
// RENAMED FROM: Home.dart
// PURPOSE: Main screen after login. Contains:
//            - AppBar with popup menu (Wi-Fi, Settings, etc.)
//            - TabBar with 6 tabs (ຈັດການຂໍ້ມູນ, ຂາຍ, ...)
//            - Side drawer (sidebar_drawer.dart)
//            - BottomNavigationBar with 4 items
// ======================================================

import 'package:flutter/material.dart';
import 'package:myapp/MenuPage/sidebar_drawer.dart';   // sidebar_drawer.dart
import 'package:myapp/Page/base_menu_grid.dart';       // base_menu_grid.dart
import 'package:myapp/Page/service_bottom_sheet.dart'; // service_bottom_sheet.dart

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Tracks which bottom navigation tab is currently selected
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // DefaultTabController manages the 6 tabs in the AppBar
    return DefaultTabController(
      length: 6,
      child: Scaffold(

        // ── Top AppBar ─────────────────────────────────────
        appBar: AppBar(
          actions: [
            // Popup menu in the top-right corner
            PopupMenuButton(
              itemBuilder: (context) => [
                // Each PopupMenuItem is a Card with a ListTile inside

                _buildPopupItem(Icons.wifi,           Colors.cyan,   "Wi-Fi"),
                _buildPopupItem(Icons.settings,       Colors.blue,   "Settings"),
                _buildPopupItem(Icons.account_circle, Colors.green,  "Account"),
                _buildPopupItem(Icons.notifications,  Colors.orange, "Notifications"),
                _buildPopupItem(Icons.language,       Colors.purple, "Language"),
                _buildPopupItem(Icons.help,           Colors.teal,   "Help & Support"),
                _buildPopupItem(Icons.logout,         Colors.red,    "Logout"),
              ],
            ),
          ],
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Home Page",
            style: TextStyle(color: Colors.white),
          ),

          // ── Tab bar shown at the bottom of the AppBar ──
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: TabBar(
                isScrollable: true, // allows horizontal scrolling if tabs overflow
                tabs: [
                  Tab(icon: Icon(Icons.folder,        color: Colors.blueAccent), text: "ຈັດການຂໍ້ມູນພື້ນຖານ"),
                  Tab(icon: Icon(Icons.shopping_bag,  color: Colors.blueAccent), text: "ຂາຍ"),
                  Tab(icon: Icon(Icons.import_export, color: Colors.blueAccent), text: "ນຳເຂົ້າ"),
                  Tab(icon: Icon(Icons.search,        color: Colors.blueAccent), text: "ຄົ້ນຫາ"),
                  Tab(icon: Icon(Icons.edit_document, color: Colors.blueAccent), text: "ລາຍງານ"),
                  Tab(icon: Icon(Icons.info,          color: Colors.blueAccent), text: "About"),
                ],
              ),
            ),
          ),
        ),

        // ── Side drawer (slides in from the left) ──────────
        drawer: Drawwerpage(), // see sidebar_drawer.dart

        backgroundColor: Colors.grey.shade300,

        // ── Tab content area ───────────────────────────────
        body: TabBarView(
          children: [
            MenuBasePage(),     // Tab 0: full menu grid (see base_menu_grid.dart)
            Text("ຂາຍ"),        // Tab 1: Sales (placeholder)
            Text("ນຳເຂົ້າ"),    // Tab 2: Import (placeholder)
            Text("ຄົ້ນຫາ"),    // Tab 3: Search (placeholder)
            Text("ລາຍງານ"),    // Tab 4: Reports (placeholder)
            Text("About"),      // Tab 5: About (placeholder)
          ],
        ),

        // ── Bottom navigation bar ──────────────────────────
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: Colors.transparent, // inherits blue from parent Container
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
              // Tapping "Service" (index 2) opens a modal bottom sheet
              if (index == 2) {
                showMyModalButtonSheet(context); // see service_bottom_sheet.dart
              }
            },
            selectedItemColor: Colors.white,
            selectedFontSize: 14,
            type: BottomNavigationBarType.fixed, // all items always visible
            elevation: 10,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home,                size: 30), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.settings,            size: 30), label: "Setting"),
              BottomNavigationBarItem(icon: Icon(Icons.home_repair_service, size: 30), label: "Service"),
              BottomNavigationBarItem(icon: Icon(Icons.person,              size: 30), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helper: builds one popup menu item (icon + label) ──
  PopupMenuItem _buildPopupItem(IconData icon, Color color, String label) {
    return PopupMenuItem(
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(icon, size: 30, color: color),
          ),
          title: Text(label),
          onTap: () {
            Navigator.pop(context); // close the popup menu
            // TODO: add functionality for "$label"
          },
        ),
      ),
    );
  }
}
