import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:futter_project_tfg/app/app_theme.dart';
import 'package:futter_project_tfg/app/loaded_app.dart';
import 'package:futter_project_tfg/screens/offline/offline_screen.dart';
import 'package:futter_project_tfg/screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return OfflineScreen();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Boletus AI',
              theme: buildThemeData(),
              home: LoadedApp(),
            );
          }
          return SplashScreen();
        });
  }
}
