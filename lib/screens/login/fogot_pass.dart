import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/widgets/app_text.dart';

import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DInput.dart';
import '../../widgets/app_base_page.dart';
import '../../widgets/app_header.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController _emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.blue1.withOpacity(0.03),
      bottomNavigationBar: Container(
        color: AppColors.blue1.withOpacity(0.03),
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 17.sp),
        child: DButton(
            text: 'Tiếp theo'.tr,
            onClick: this.onClickTiepTheo
        ),
      ),
      child: Column(
        children: [
          AppHeader(title: 'Quên mật khẩu'.tr),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 20.sp),
            child: Column(
              children: [
                AppText(
                  'Vui lòng nhập email đăng ký để chúng tôi xác \n nhận thông tin tài khoản của bạn.',
                  textAlign: TextAlign.center,
                  style: AppStyle.DEFAULT_16,
                ),
                SizedBox(height: 15.sp,),
                DInput(
                    hintText: 'Email của bạn'.tr,
                    controller: _emailController
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onClickTiepTheo() {
    AppNavigator.navigateResetPass();
  }
}
