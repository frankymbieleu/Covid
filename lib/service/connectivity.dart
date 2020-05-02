import 'package:connectivity/connectivity.dart';

_checkConnexionInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    print("No connection");
  } else if (connectivityResult == ConnectivityResult.mobile) {
    print("Connected to Mobile Network");
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("Connected to WiFi");
  } else {
    print("Unable to connect. Please Check Internet Connection");
  }
}
