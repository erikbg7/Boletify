import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://github.com/erikbg7/Flutter-Project';

void launchUrl(url) async {
  await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

void redirectTo({context: BuildContext, screen: Widget}) {
  final route = MaterialPageRoute<void>(
    builder: (BuildContext context) => screen,
  );
  Navigator.push(context, route);
}
