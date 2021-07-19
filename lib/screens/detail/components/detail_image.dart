import 'dart:io';
import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final File image;

  const DetailImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'result-image',
        child: Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: FileImage(image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
