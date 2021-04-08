import 'dart:io';
import 'package:flutter/material.dart';

class SearchImage extends StatelessWidget {
  final File image;

  const SearchImage({Key key, this.image}) : super(key: key);

//  Hero tag for this item?
//  Would have a nice transition to details screen, would look cool
//  https://www.youtube.com/watch?v=Be9UH1kXFDw&ab_channel=GoogleDevelopers
//  Create new PR
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateTo(context),
      child: Hero(
        tag: 'result-image',
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            borderRadius: BorderRadius.all(Radius.circular(300.0)),
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          child: CircleAvatar(backgroundImage: FileImage(image)),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Center(
          child: Hero(
            tag: 'result-image',
            child: Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                color: Color(0xff7c94b6),
                image: DecorationImage(
                  image: FileImage(image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
