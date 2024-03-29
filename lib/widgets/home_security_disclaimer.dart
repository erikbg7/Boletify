import 'package:flutter/material.dart';

class HomeSecurityDisclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_rounded, size: 22),
                  SizedBox(width: 4),
                  Text(
                    'Atenció',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(width: 4),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Center(
                child: Text(
                  "Boletify es una aplicació experimental. Utilitza les teves fonts d'informació habituals per saber si el bolet es comestible o tòxic,  recorda que alguns bolets poden ser mortals i és facil confondre'ls.",
                  softWrap: true,
                  style: TextStyle(
                      height: 1.5,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
