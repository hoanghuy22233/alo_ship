import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprint/generated/assets.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/app_text.dart';
import 'package:sprint/widgets/widget_handle.dart';

class ItemThongBao extends StatefulWidget {
  const ItemThongBao({Key? key}) : super(key: key);

  @override
  State<ItemThongBao> createState() => _ItemThongBaoState();
}

class _ItemThongBaoState extends State<ItemThongBao> {

  bool seen=false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          seen=!seen;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.sp,horizontal: 16.sp),
        margin: EdgeInsets.only(bottom: 15.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.sp),
          color:seen? AppColors.red1.withOpacity(0.1) : AppColors.WHITE,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 4),
              color: AppColors.BLACK.withOpacity(0.05)
            )
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetContainerImage(
              image: Assets.imagesImgCar,
              width: 24.sp,
              height: 24.sp,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10.sp,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Giao đơn hàng thành công',
                    style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,height: 1.3),
                  ),
                  SizedBox(height: 10.sp,),
                  AppText(
                    'Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.',
                    style: AppStyle.DEFAULT_16,
                  ),
                  SizedBox(height: 10.sp,),
                  AppText(
                    '1 giờ trước',
                    style: AppStyle.DEFAULT_14.copyWith(color: AppColors.grey3),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              Assets.iconsIcNext,
              width: 16.sp,
              height: 16.sp,
              fit: BoxFit.contain,
            ),

          ],
        ),
      ),
    );
  }
}
