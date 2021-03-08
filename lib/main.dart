import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:futter_project_tfg/app/loaded_app.dart';

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
            print('----------');
            print(snapshot.hasError);
            print(snapshot.error);
            print(snapshot.toString());
            return Container(
                color: Colors.blue,
                height: double.infinity,
                width: double.infinity
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Boletus AI',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: LoadedApp(),
            );
          }

          return Container(
              color: Colors.red,
              height: double.infinity,
              width: double.infinity
          );
        });
  }
}
