import 'package:flutter/material.dart';

class DetailInformation extends StatelessWidget {
  final List<Widget> children;

  const DetailInformation({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF112523),
      margin: EdgeInsets.only(top: 200),
      child: Column(children: children),
    );
  }
}
