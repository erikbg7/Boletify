import 'package:flutter/material.dart';

class HomeSecurityDisclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Icon(Icons.warning_rounded,
                  size: 175, color: Colors.redAccent.withOpacity(0.5)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  'Atenció',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Boletify es una aplicació experimental. Utilitza les teves fonts d'informació habituals per saber si el bolet es comestible o tòxic,  recorda que alguns bolets poden ser mortals i és facil confondre'ls.",
                  softWrap: true,
                  style: TextStyle(
                      height: 1.5,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//class HomeSecurityDisclaimer extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Expanded(
//      child: Container(
//        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//        color: Colors.white,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: [
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Text(
//                  'Atenció',
//                  style: TextStyle(
//                      color: Colors.black,
//                      fontSize: 25,
//                      fontWeight: FontWeight.w500),
//                ),
//                Icon(Icons.warning_rounded,
//                    size: 50, color: Colors.greenAccent),
//              ],
//            ),
//            SizedBox(width: 10),
//            Center(
//              child: Text(
//                "Boletify es una aplicació experimental. Utilitza les teves fonts d'informació habituals per saber si el bolet es comestible o tòxic,  recorda que alguns bolets poden ser mortals i és facil confondre'ls.",
//                softWrap: true,
//                style: TextStyle(
//                    height: 1.5,
//                    color: Colors.black,
//                    fontWeight: FontWeight.w500),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
