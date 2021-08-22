import 'package:flutter/material.dart';

class DetailInformation extends StatelessWidget {
  final List<Widget> children;

  const DetailInformation({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height*0.24),
      child: Column(children: children),
    );
  }
}
