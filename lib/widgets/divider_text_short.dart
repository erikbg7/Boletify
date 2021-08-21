import 'package:flutter/cupertino.dart';
import 'package:futter_project_tfg/colors.dart';

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
      color: BoletifyColors.textSplitter,
      margin: EdgeInsets.only(top: top, bottom: bottom),
    );
  }
}
