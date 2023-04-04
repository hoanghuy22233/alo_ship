import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/generated/assets.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_text.dart';
import 'package:sprint/widgets/widget_handle.dart';

import '../../res/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.blue1.withOpacity(0.03),
      bottomNavigationBar:  Container(
        color: AppColors.blue1.withOpacity(0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            'Alo ship',
            style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
          ),
          AppText(
            'Version: 1.0.0',
            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 24.sp,)
        ],
      ),
    ),
      child: SizedBox(
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              WidgetContainerImage(
                image: Assets.imagesBgLogin,
                width: Get.width,
                height: Get.height*(300/896),
                fit: BoxFit.cover,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.sp)),
              ),
              SizedBox(height: 35.sp,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    AppText(
                      'Vui lòng nhập số điện thoại đã đăng ký \n để sử dụng dịch vụ',
                      textAlign: TextAlign.center,
                      style: AppStyle.DEFAULT_16,
                    ),
                    SizedBox(height: 20.sp,),
                    DInput(
                      hintText: 'Email của bạn'.tr,
                      controller: _emailController,
                    ),
                    SizedBox(height: 15.sp,),
                    DInput(
                      hintText: 'Nhập mật khẩu'.tr,
                      controller: _passController,
                      isPass: true,
                    ),
                    SizedBox(height: 20.sp,),
                    InkWell(
                      onTap: this.onClickQuenPass,
                      child: AppText(
                        'Quên mật khẩu'.tr,
                        style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w600,color: AppColors.blue1),
                      ),
                    ),
                    SizedBox(height: 20.sp,),
                    DButton(
                      text: 'Đăng nhập'.tr,
                      onClick: this.onClickDangNhap,
                    ),
                    SizedBox(height: 24.sp,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          'Chưa có tài khoản?'.tr,
                          style: AppStyle.DEFAULT_16,
                        ),
                        InkWell(
                          onTap: this.onClickDangKy,
                          child: AppText(
                            ' Đăng ký'.tr,
                            style: AppStyle.DEFAULT_16.copyWith(color: AppColors.blue1,fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  onClickDangNhap() {
    AppNavigator.navigateHome();
  }

  void onClickDangKy() {
    AppNavigator.navigateRegister();
  }

  void onClickQuenPass() {
    AppNavigator.navigateForgotPass();
  }
}
