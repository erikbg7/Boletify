import 'package:flutter/material.dart';
import 'package:futter_project_tfg/colors.dart';

class BottomNavigationBarBoletify extends StatelessWidget {
  final Function onTapBarItem;
  final int currentIndex;
  final FloatingActionButton floatingActionButton;
  const BottomNavigationBarBoletify({
    Key? key,
    required this.onTapBarItem,
    required this.currentIndex,
    required this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.11,
      width: size.width,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, size.height * 0.12),
            painter: BNBCustomPainter(),
          ),
          Center(heightFactor: 0.7, child: floatingActionButton),
          Container(
            width: size.width,
            height: size.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.home,
                      color: currentIndex == 0
                          ? Colors.white
                          : Colors.grey.shade400,
                    ),
                    onPressed: () => onTapBarItem(0)),
                Container(width: size.width * 0.30),
                IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: currentIndex == 1
                          ? Colors.white
                          : Colors.grey.shade400,
                    ),
                    onPressed: () => onTapBarItem(1)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = BoletifyColors.bottomNavBar
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
