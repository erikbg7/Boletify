import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/home/components/home_icons_list.dart';
import 'package:futter_project_tfg/screens/home/components/home_search_button.dart';
import 'package:futter_project_tfg/screens/home/components/home_title.dart';
import 'package:futter_project_tfg/widgets/security_disclaimer.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: buildHomeGradient()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeTitle(),
              HomeSearchButton(),
              HomeIconsList(),
              SecurityDisclaimer(),
            ],
          ),
        ),
      ),
    );
  }
}

LinearGradient buildHomeGradient() {
  return LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Colors.greenAccent.withOpacity(0.05), Colors.transparent],
    stops: [0.3, 0.8],
  );
}
