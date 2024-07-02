import 'package:flutter/material.dart';
import 'theme_screen.dart';
import 'auth_screen.dart';
import '../services/connectivity_service.dart';
import '../services/battery_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ConnectivityService _connectivityService = ConnectivityService();
  final BatteryService _batteryService = BatteryService();

  @override
  void initState() {
    super.initState();
    _connectivityService.startMonitoring();
    _batteryService.startMonitoring();
  }

  @override
  void dispose() {
    _connectivityService.stopMonitoring();
    _batteryService.stopMonitoring();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ThemeScreen())),
              child: Text('Theme Settings'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen())),
              child: Text('Authentication'),
            ),
          ],
        ),
      ),
    );
  }
}
