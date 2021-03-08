import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  const SearchButton({Key key, this.icon, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide: BorderSide(color: Colors.white, width: 1.8),
      onPressed: onPressed,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 35),
          Container(
              width: 85,
              alignment: Alignment.center,
              child: Text(text, style: Theme.of(context).textTheme.headline3))
        ],
      ),
    );
  }
}
