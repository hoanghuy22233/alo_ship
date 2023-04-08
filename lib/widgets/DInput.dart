import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';

class DInput extends StatelessWidget {
  DInput(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.isPass = false,
      this.rightPadding})
      : super(key: key);

  String hintText;
  TextEditingController controller;
  bool isPass;
  double? rightPadding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.sp),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.WHITE,
            // borderRadius: BorderRadius.circular(5.sp),
            border:
                Border(bottom: BorderSide(width: 1, color: AppColors.greyC4)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: AppColors.BLACK.withOpacity(0.05))
            ]),
        child: TextField(
          controller: controller,
          obscureText: isPass,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  top: 14.sp,
                  bottom: 14.sp,
                  right: rightPadding ?? 20.sp,
                  left: 20.sp),
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: AppStyle.DEFAULT_16.copyWith(color: AppColors.grey7)),
          style: AppStyle.DEFAULT_16,
        ),
      ),
    );
  }
}
