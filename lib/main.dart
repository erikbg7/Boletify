import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:futter_project_tfg/app/app_theme.dart';
import 'package:futter_project_tfg/app/loaded_app.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/repositories/mushrooms_repository.dart';
import 'package:futter_project_tfg/screens/offline/offline_screen.dart';
import 'package:futter_project_tfg/screens/splash/splash_screen.dart';


//https://www.devopsschool.com/blog/flutter-core-no-app-no-firebase-app-default-has-been-created-call-firebase-initializeapp/
//WidgetsFlutterBinding.ensureInitialized();
//await Firebase.initializeApp();
//runApp(MyApp());

void main() {
  runApp(MyApp());
}

Future<void> fetchAllMushrooms() async {
  final List<Mushroom> mushroomsList =
      await MushroomsRepository().getMushroomsList();
  mushroomsList.forEach((element) => print(element.name));
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
            // if has connection, fetch mushrooms list
            fetchAllMushrooms();
            return MaterialApp(
              title: 'Boletify',
              theme: buildThemeData(),
              home: LoadedApp(),
            );
          }
          return SplashScreen();
        });
  }
}
