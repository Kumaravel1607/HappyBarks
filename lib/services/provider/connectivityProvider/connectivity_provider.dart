// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityProvider with ChangeNotifier {
  Connectivity connectivity =  Connectivity();

  ConnectivityProvider() {
    startMonitoring();
  }
  
  bool _isOnline = false;
 bool get isOnline => _isOnline;
bool isSet=true;
  startMonitoring() async {
    await initConnectivity();
    connectivity.onConnectivityChanged.listen((result) async {
      if (result == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          _isOnline = isConnected;
          notifyListeners();
        });
        _isOnline = true;
        notifyListeners();
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await connectivity.checkConnectivity();
      if (status == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        _isOnline = true;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      print('PlatformException' + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus() async {
    late bool isConnected;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }
 
 
 
  
}
