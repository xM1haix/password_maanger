import "package:flutter/material.dart";
import "package:password_manager_client/password_manager_client.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";

void main() {
  client = Client("http://$localhost:8080/")
    ..connectivityMonitor = FlutterConnectivityMonitor();
  runApp(const App());
}

/// Serverpod Client
late final Client client;

///Base App skelethon
class App extends StatelessWidget {
  ///
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark());
  }
}
