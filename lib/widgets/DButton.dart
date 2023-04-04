import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_text.dart';

class DButton extends StatelessWidget {
  DButton({Key? key,required this.text,required this.onClick}) : super(key: key);
  String text;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.sp,horizontal: 20.sp),
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5.sp)
        ),
        child: AppText(
          text,
          textAlign: TextAlign.center,
          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,color: AppColors.WHITE,height: 1.3),
        ),
      ),
    );
  }
}
