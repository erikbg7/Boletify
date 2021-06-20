import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://github.com/erikbg7/Flutter-Project';

void launchUrl(url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

MaterialPageRoute buildSettingsRoute({String appBarTitle, Widget body}) {
  return MaterialPageRoute<void>(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(appBarTitle)),
        body: body,
      );
    },
  );
}
