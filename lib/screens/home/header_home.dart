import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sprint/generated/assets.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/app_text.dart';
import 'package:sprint/widgets/widget_handle.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {

  bool value=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top+10.sp,
        left: 20.sp,
        right: 20.sp,
        bottom: 17.sp
      ),
      decoration: BoxDecoration(
        color: AppColors.WHITE
      ),
      child: Row(
        children: [
          WidgetContainerImage(
            image: Assets.imagesAvatar,
            width: 46.sp,
            height: 46.sp,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(46.sp),
          ),
          Spacer(),
          AppText(
            'Trực tuyến',
            style: AppStyle.DEFAULT_16,
          ),
          SizedBox(width: 10.sp,),
          FlutterSwitch(
            width: 44.sp,
            height: 24.sp,
            toggleSize: 20.sp,
            value: value,
            borderRadius: 27.sp,
            padding: 2.sp,
            activeColor: AppColors.WHITE,
            activeToggleColor: AppColors.green,
            activeSwitchBorder: Border.all(width: 1,color: AppColors.colorBorder),
            inactiveSwitchBorder: Border.all(width: 1,color: AppColors.colorBorder),
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                value = val;
              });
            },
          ),
          SizedBox(width: 10.sp,),
          SvgPicture.asset(
            Assets.iconsIcMenu,
            width: 24.sp,
            height: 24.sp,
          )
        ],
      ),
    );
  }
}
