import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sprint/generated/assets.dart';

import '../res/app_styles.dart';
import '../res/colors.dart';
import 'app_text.dart';

class AppHeader extends StatelessWidget {
  AppHeader({Key? key,required this.title,this.right}) : super(key: key);
  String title;
  Widget? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+30.sp,bottom: 20.sp),

      decoration: BoxDecoration(
          color: AppColors.WHITE,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
            color: AppColors.BLACK.withOpacity(0.05)
          )
        ]
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              padding: EdgeInsets.only(left: 15.sp,right: 5.sp,top: 5.sp,bottom: 5.sp),
              color: AppColors.WHITE,
              child: SvgPicture.asset(
                Assets.iconsIcBack,
                width: 15.sp,
                height: 15.sp,
                fit: BoxFit.contain,
                color: AppColors.BLACK,
              ),
            ),
          ),
          Expanded(child: AppText(title,maxLines: 1,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,height: 1.05),)),
          right!=null?
              right!
              : SizedBox(
            width: 20.sp,
            height: 20.sp,
          )
        ],
      ),
    );
  }
}
