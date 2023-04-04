import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprint/res/res.dart';
import 'package:sprint/widgets/app_text.dart';

class TaiKhoanModel {
  TaiKhoanModel(
      {required this.icon, required this.title, this.rightText, this.press});
  String icon, title;
  String? rightText;
  void Function()? press;
}

class TaiKhoanItem extends StatelessWidget {
  const TaiKhoanItem({super.key, required this.taiKhoanModel});
  final TaiKhoanModel taiKhoanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: taiKhoanModel.press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        margin: EdgeInsets.symmetric(horizontal: 16.sp),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFEBEBEB)))),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.sp),
              child: SvgPicture.asset(
                taiKhoanModel.icon,
                width: 24.sp,
                height: 24.sp,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
                child: AppText(
              taiKhoanModel.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.DEFAULT_18
                  .copyWith(fontWeight: FontWeight.w500, height: 1.2),
            )),
            if (taiKhoanModel.rightText != null)
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 8.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: const Color(0xFFFF0000)),
                child: AppText(
                  taiKhoanModel.rightText!,
                  style: AppStyle.DEFAULT_18.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.WHITE,
                      height: 1),
                ),
              )
          ],
        ),
      ),
    );
  }
}
