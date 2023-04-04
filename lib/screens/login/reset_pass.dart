import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DInput.dart';
import '../../widgets/app_base_page.dart';
import '../../widgets/app_header.dart';
import '../../widgets/app_text.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  TextEditingController _passController=TextEditingController();
  TextEditingController _otpController=TextEditingController();
  TextEditingController _rePassController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.blue1.withOpacity(0.03),
      bottomNavigationBar: Container(
        color: AppColors.blue1.withOpacity(0.03),
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 17.sp),
        child: DButton(
            text: 'Hoàn tất'.tr,
            onClick: this.onClickEnd
        ),
      ),
      child: Column(
        children: [
          AppHeader(title: 'Đổi mật khẩu'.tr),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 20.sp),
            child: Column(
              children: [
                AppText(
                  'Nhập mật khẩu mới để thay đổi thông tin \n đăng nhập tài khoản.',
                  textAlign: TextAlign.center,
                  style: AppStyle.DEFAULT_16,
                ),
                SizedBox(height: 15.sp,),
                DInput(
                    hintText: 'OTP'.tr,
                    controller: _otpController
                ),
                SizedBox(height: 15.sp,),
                DInput(
                    hintText: 'Nhập mật khẩu'.tr,
                    controller: _passController,
                  isPass: true,
                ),
                SizedBox(height: 15.sp,),
                DInput(
                    hintText: 'Nhập lại mật khẩu'.tr,
                    controller: _rePassController,
                  isPass: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onClickEnd() {
  }
}
