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
import 'package:sprint/screens/home/tai_khoan_item.dart';
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
    List<TaiKhoanModel> arr = [
      TaiKhoanModel(
        icon: 'assets/icons/icThongTinCaNhan.svg',
        title: 'Thông tin cá nhân'.tr,
        press: () {
          Get.back();
          Get.toNamed(Routes.thongTinCaNhan);
        },
      ),
      TaiKhoanModel(
          icon: 'assets/icons/icThongBao.svg',
          title: 'Thông báo'.tr,
          rightText: '5+',
          press: () {
            Get.back();
            AppNavigator.navigateNotification();
          }),
      TaiKhoanModel(
          icon: 'assets/icons/icLichSu.svg',
          title: 'Lịch sử vận chuyển'.tr,
          press: () {
            Get.back();
            AppNavigator.navigateHistoryTransfer();
          }),
      TaiKhoanModel(
        icon: 'assets/icons/icDieuKhoan.svg',
        title: 'Điều khoản chính sách'.tr,
        press: () {
          Get.back();
          Get.toNamed(Routes.dieuKhoanChinhSach);
        },
      ),
      TaiKhoanModel(
        icon: 'assets/icons/icDoiMatKhau.svg',
        title: 'Đổi mật khẩu'.tr,
        press: () {
          Get.back();
          Get.toNamed(Routes.doiMatKhau);
        },
      ),
    ];
    showModalBottomSheet(
      backgroundColor: AppColors.WHITE,
      context: context,
      builder: (context) {
        final viewPadding = MediaQuery.of(context).viewPadding;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
              decoration: BoxDecoration(color: AppColors.WHITE, boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: AppColors.BLACK.withOpacity(0.05),
                    offset: const Offset(0, 4),
                    spreadRadius: 0)
              ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 24.sp,
                    height: 24.sp,
                  ),
                  Expanded(
                      child: AppText(
                    'Tài khoản'.tr,
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAULT_16
                        .copyWith(fontWeight: FontWeight.w500),
                  )),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/icClose.svg',
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: List.generate(arr.length, (index) {
                  return TaiKhoanItem(taiKhoanModel: arr[index]);
                }),
              ),
            )),
            InkWell(
              onTap: ()async{
                NotificationDialog.createSimpleDialog(
                    context: context,
                    titleButton1: 'OK',
                    titleButton2: "Hủy",
                    onTap1: ()async{
                      Get.back();
                      await AppPref().removeString('TOKEN');
                      AppNavigator.navigateLogin();
                    },
                    content: "Bạn có chắc chắn muốn đăng xuất không?",
                    numberButton: 2
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.red1),
                    borderRadius: BorderRadius.circular(5.sp)),
                margin: EdgeInsets.only(
                    bottom: viewPadding.bottom + 8.sp, left: 16.sp, right: 16.sp),
                padding: EdgeInsets.symmetric(vertical: 12.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icDangXuat.svg',
                      width: 16.sp,
                      height: 16.sp,
                    ),
                    SizedBox(
                      width: 12.sp,
                    ),
                    AppText(
                      'Đăng xuất'.tr,
                      style: AppStyle.DEFAULT_18
                          .copyWith(fontWeight: FontWeight.w500, height: 1.2),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
