import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search_outlined),
            SizedBox(width: size.width * 0.02),
            Text('Búsca un bolet...')
          ],
        ),
      ),
    );
  }
}
