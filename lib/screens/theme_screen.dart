import 'package:flutter/material.dart';
import '../utils/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme Settings')),
      body: Center(
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return SwitchListTile(
              title: Text('Dark Mode'),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            );
          },
        ),
      ),
    );
  }
}
