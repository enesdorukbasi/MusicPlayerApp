import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityChangeNotifier extends ChangeNotifier {
  ConnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  ConnectivityResult get connectivity => _connectivityResult;

  resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    if (result == ConnectivityResult.none) {
    } else if (result == ConnectivityResult.mobile) {
    } else if (result == ConnectivityResult.wifi) {}
    notifyListeners();
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    resultHandler(connectivityResult);
  }
}
