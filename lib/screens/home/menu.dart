import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sprint/screens/home/tai_khoan_item.dart';
import 'package:sprint/screens/thong_bao/controllers/notification_controller.dart';

import '../../common/routes/app_pages.dart';
import '../../common/routes/navigator.dart';
import '../../res/app_pref.dart';
import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_dialog.dart';
import '../loading/splash.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({Key? key}) : super(key: key);

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  final NotificationController _notificationController = Get.find<
      NotificationController>();
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

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      _notificationController.getNotification();
      if(fake==true)
        arr.add(TaiKhoanModel(
          icon: 'assets/icons/icDoiMatKhau.svg',
          title: 'Xóa tài khoản'.tr,
          press: () {
            Get.back();
            NotificationDialog.createSimpleDialog(
                context: context,
                titleButton1: 'OK',
                type: 2,
                content: 'Tài khoản của bạn sẽ được xem xét xóa bởi quản trị viên.',
                numberButton: 1
            );
          },
        ),);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery
        .of(context)
        .viewPadding;
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
              child: Obx(() {
                if (_notificationController.numberNotification.value != 0) {
                  arr[1] = TaiKhoanModel(
                      icon: 'assets/icons/icThongBao.svg',
                      title: 'Thông báo'.tr,
                      rightText: '${_notificationController.numberNotification
                          .value > 9 ? '9+' : _notificationController
                          .numberNotification.value}',
                      press: () {
                        Get.back();
                        AppNavigator.navigateNotification();
                      });
                }
                else {
                  arr[1] = TaiKhoanModel(
                      icon: 'assets/icons/icThongBao.svg',
                      title: 'Thông báo'.tr,
                      press: () {
                        Get.back();
                        AppNavigator.navigateNotification();
                      });
                }
                return Column(
                    children: List.generate(arr.length, (index) {
                      return TaiKhoanItem(taiKhoanModel: arr[index]);
                    }));
              }),
            )),
        InkWell(
          onTap: () async {
            NotificationDialog.createSimpleDialog(
                context: context,
                titleButton1: 'OK',
                titleButton2: "Hủy",
                onTap1: () async {
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
  }
}
