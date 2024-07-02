import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/theme_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
