import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/common/routes/app_pages.dart';
import 'package:sprint/generated/assets.dart';
import 'package:sprint/res/app_pref.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/home/menu.dart';
import 'package:sprint/screens/home/tai_khoan_item.dart';
import 'package:sprint/screens/thong_tin_ca_nhan/controllers/thong_tin_ca_nhan_controller.dart';
import 'package:sprint/widgets/app_text.dart';
import 'package:sprint/widgets/widget_dialog.dart';
import 'package:sprint/widgets/widget_handle.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  bool value = true;
  ProfileController _profileController=Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10.sp,
          left: 20.sp,
          right: 20.sp,
          bottom: 17.sp),
      decoration: BoxDecoration(color: AppColors.WHITE),
      child: Row(
        children: [
          Obx(() => InkWell(
            onTap: (){
              Get.toNamed(Routes.thongTinCaNhan);
            },
            child: WidgetNetworkImage(
              image: _profileController.avatar.value??'',
              width: 46.sp,
              height: 46.sp,
              fit: BoxFit.cover,
              borderRadius: 46.sp,
            ),
          )),
          Spacer(),
          AppText(
            'Trực tuyến',
            style: AppStyle.DEFAULT_16,
          ),
          SizedBox(
            width: 10.sp,
          ),
          FlutterSwitch(
            width: 44.sp,
            height: 24.sp,
            toggleSize: 20.sp,
            value: value,
            borderRadius: 27.sp,
            padding: 2.sp,
            activeColor: AppColors.WHITE,
            activeToggleColor: AppColors.green,
            activeSwitchBorder:
                Border.all(width: 1, color: AppColors.colorBorder),
            inactiveSwitchBorder:
                Border.all(width: 1, color: AppColors.colorBorder),
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                value = val;
              });
            },
          ),
          SizedBox(
            width: 10.sp,
          ),
          InkWell(
            onTap: menuPress,
            child: SvgPicture.asset(
              Assets.iconsIcMenu,
              width: 24.sp,
              height: 24.sp,
            ),
          )
        ],
      ),
    );
  }

  menuPress() {
    showModalBottomSheet(
      backgroundColor: AppColors.WHITE,
      context: context,
      builder: (context) {
        return const MenuHome();
      },
    );
  }
}
