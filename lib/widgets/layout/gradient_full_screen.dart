import 'package:flutter/material.dart';

class GradientFullScreen extends StatelessWidget {
  final Color gradientColor;

  const GradientFullScreen({Key? key, required this.gradientColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: buildFullScreenBackground(gradientColor),
      ),
    );
  }
}

LinearGradient buildFullScreenBackground(Color gradientColor) {
  return LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.topLeft,
    colors: [gradientColor.withOpacity(0.1), Colors.transparent],
    stops: [0.2, 0.8],
  );
}
