import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boletus AI"),
      ),
      body: Container(
        color: Colors.blue,
        height: double.infinity,
        width: double.infinity,
        child: Text("Gallery", style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}
