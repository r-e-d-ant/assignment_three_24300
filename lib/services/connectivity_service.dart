import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class ConnectivityService {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  void startMonitoring() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      String message = (result == ConnectivityResult.none) 
          ? "Disconnected from Internet" 
          : "Connected to Internet";
      Fluttertoast.showToast(msg: message);
    });
  }

  void stopMonitoring() {
    _connectivitySubscription.cancel();
  }
}
