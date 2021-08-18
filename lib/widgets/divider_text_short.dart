import 'package:flutter/cupertino.dart';

class DividerTextShort extends StatelessWidget {
  final double top;
  final double bottom;

  const DividerTextShort({Key? key, this.top = 8, this.bottom = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 2.0,
      color: const Color(0xFF00C6FF),
      margin: EdgeInsets.only(top: top, bottom: bottom),
    );
  }
}
