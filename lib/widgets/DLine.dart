import 'package:flutter/material.dart';
import 'package:sprint/res/colors.dart';

class DLine extends StatelessWidget {
  const DLine({Key? key,this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
        color:color?? AppColors.greyF2,
    );
  }
}
