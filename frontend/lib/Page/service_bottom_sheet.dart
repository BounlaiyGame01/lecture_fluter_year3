// ======================================================
// FILE: service_bottom_sheet.dart
// RENAMED FROM: showMyModalButtonSheet.dart
// PURPOSE: Shows a modal bottom sheet when the user taps
//          "Service" in the BottomNavigationBar.
//          Offers two menu options: general advice and
//          branch-specific advice.
// ======================================================

import 'package:flutter/material.dart';

/// Opens a modal sheet from the bottom of the screen.
/// Call this with the current [context] from any widget.
void showMyModalButtonSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return Container(
        // Sheet takes 80% of screen width and 50% of screen height
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ── Drag handle indicator at the top ──────────
            Container(width: 45, height: 5, color: Colors.grey),
            SizedBox(height: 20),

            // ── Sheet title ───────────────────────────────
            Text(
              "ເລືອກລາຍການ", // "Select Item"
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.blue, thickness: 2),

            // ── Option 1: General advice ──────────────────
            ListTile(
              leading: Icon(Icons.groups_3_outlined, size: 30, color: Colors.grey),
              title: Text(
                "ຄຳແນະນຳ", // "Advice"
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop(); // close the bottom sheet
                // TODO: navigate to general advice page
              },
            ),
            Divider(),

            // ── Option 2: Branch-specific advice ──────────
            ListTile(
              leading: Icon(Icons.groups_3_outlined, size: 30, color: Colors.grey),
              title: Text(
                "ຄຳແນະນຳແຕ່ລະສາຂາ", // "Advice by Branch"
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop(); // close the bottom sheet
                // TODO: navigate to branch advice page
              },
            ),
          ],
        ),
      );
    },
  );
}
