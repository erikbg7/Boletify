import 'package:flutter/material.dart';

class BlackWhiteFilter extends StatelessWidget {
  final bool isFilterActive;
  final Widget child;

  const BlackWhiteFilter(
      {Key? key, required this.isFilterActive, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: isFilterActive
          ? ColorFilter.mode(
              Colors.transparent,
              BlendMode.multiply,
            )
          : ColorFilter.matrix(<double>[
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0.2126, 0.7152, 0.0722, 0, 0,
        0, 0, 0, 1, 0,
      ]),
      child: child,
    );
  }
}
