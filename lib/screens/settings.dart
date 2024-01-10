import 'package:flutter/material.dart';
import 'package:anilist/theme/theme_manager.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

ThemeManager _themeManager = ThemeManager();

class _SettingsState extends State<Settings> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        setState(() {
          isDark = !isDark;
          _themeManager.toggleTheme(isDark);
        });
      },
      child: Text('ElevatedButton'),
    ));
  }
}
