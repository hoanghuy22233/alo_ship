import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passController=TextEditingController();
  TextEditingController _rePassController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.blue1.withOpacity(0.03),
      child: Column(
        children: [
          AppHeader(title: 'Đăng ký'.tr),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 20.sp),
            child: Column(
              children: [
                DInput(
                    hintText: 'Tên của bạn'.tr,
                    controller: _nameController
                ),
                SizedBox(height: 15.sp,),
                DInput(
                    hintText: 'Email của bạn'.tr,
                    controller: _emailController
                ),
                SizedBox(height: 15.sp,),
                DInput(
                    hintText: 'Mật khẩu'.tr,
                    controller: _passController
                ),
                SizedBox(height: 15.sp,),
                DInput(
                    hintText: 'Nhập lại mật khẩu'.tr,
                    controller: _passController
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.blue1.withOpacity(0.03),
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 17.sp),
        child: DButton(
            text: 'Đăng ký'.tr,
            onClick: this.onClickDangKy
        ),
      ),
    );
  }

  onClickDangKy() {

  }
}
