import 'package:battery_plus/battery_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class BatteryService {
  final Battery _battery = Battery();
  late StreamSubscription<BatteryState> _batteryStateSubscription;

  void startMonitoring() {
    _batteryStateSubscription = _battery.onBatteryStateChanged.listen((state) async {
      if (state == BatteryState.charging) {
        int level = await _battery.batteryLevel;
        if (level >= 90) {
          Fluttertoast.showToast(msg: 'Battery reached 90% while charging');
          // Optionally, you can add code to play a sound here
        }
      }
    });
  }

  void stopMonitoring() {
    _batteryStateSubscription.cancel();
  }
}
