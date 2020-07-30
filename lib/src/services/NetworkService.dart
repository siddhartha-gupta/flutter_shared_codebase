import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

class NetworkService {
  static final Connectivity _connectivity = new Connectivity();
  static bool _networkAvailable = true;

  static void networkListner() {
    if (kIsWeb) {
      return;
    }

    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result.toString()) {
        case "ConnectivityResult.mobile":
        case "ConnectivityResult.wifi":
          _networkAvailable = true;
          break;

        case "ConnectivityResult.none":
          _networkAvailable = false;
          break;

        default:
          break;
      }
    });
  }

  static bool isNetworkDisconnected() {
    if (_networkAvailable) {
      return false;
    } else {
      return true;
    }
  }
}
