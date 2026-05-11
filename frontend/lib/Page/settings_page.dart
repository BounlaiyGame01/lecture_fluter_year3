// ======================================================
// FILE: settings_page.dart
// RENAMED FROM: PageSetting.dart
// PURPOSE: Placeholder for the Settings section.
//          Content to be implemented later.
// ======================================================

import 'package:flutter/material.dart';

class PageSetting extends StatefulWidget {
  const PageSetting({super.key});

  @override
  State<PageSetting> createState() => _PageSettingState();
}

class _PageSettingState extends State<PageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is the Settings Page"),
        // TODO: add settings options (theme, language, account, etc.)
      ),
    );
  }
}
