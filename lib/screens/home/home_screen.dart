import 'package:flutter/material.dart';
import 'package:futter_project_tfg/colors.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_background.dart';
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
          color: BoletifyColors.green900,
          child: Stack(
            children: [
              DetailBackground(),
              Align(
                alignment: FractionalOffset(0.5, 0.07),
                child: HomeTitle(),
              ),
              Align(
                alignment: FractionalOffset(0.5, 0.29),
                child: HomeSearchButton(),
              ),
              Align(
                alignment: FractionalOffset(0.5, 0.49),
                child: HomeIconsList(),
              ),
              Align(
                alignment: FractionalOffset(0.5, 0.8),
                child: SecurityDisclaimer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/////// HOME SCREEN V1
//
//class HomeScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        body: Container(
//          height: double.infinity,
//          width: double.infinity,
//          decoration: BoxDecoration(gradient: buildHomeGradient()),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              HomeTitle(),
//              HomeSearchButton(),
//              HomeIconsList(),
//              HomeSecurityDisclaimer(),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//LinearGradient buildHomeGradient() {
//  return LinearGradient(
//    begin: Alignment.centerRight,
//    end: Alignment.topLeft,
//    colors: [Colors.greenAccent.withOpacity(0.1), Colors.transparent],
//    stops: [0.2, 0.8],
//  );
//}

