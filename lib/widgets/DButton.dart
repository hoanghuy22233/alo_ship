import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_text.dart';

class DButton extends StatelessWidget {
  DButton({Key? key,required this.text,required this.onClick,this.textColor,this.bgColor}) : super(key: key);
  String text;
  Function onClick;
  Color? textColor;
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 20.sp),
        width: Get.width,
        decoration: BoxDecoration(
          color:bgColor?? AppColors.primary,
          borderRadius: BorderRadius.circular(5.sp),
          border: Border.all(width: 1,color: AppColors.primary)
        ),
        child: AppText(
          text,
          textAlign: TextAlign.center,
          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,color:textColor?? AppColors.WHITE,height: 1.3),
        ),
      ),
    );
  }
}
