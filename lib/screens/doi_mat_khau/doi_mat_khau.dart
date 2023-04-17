import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sprint/screens/doi_mat_khau/controllers/change_pass_controller.dart';
import 'package:sprint/widgets/DHeader.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_header.dart';

import '../../widgets/DButton.dart';
import '../../widgets/widget_dialog.dart';

class DoiMatKhau extends StatefulWidget {
  const DoiMatKhau({super.key});

  @override
  State<DoiMatKhau> createState() => _DoiMatKhauState();
}

class _DoiMatKhauState extends State<DoiMatKhau> {
  TextEditingController mkCu = TextEditingController();
  TextEditingController mkMoi1 = TextEditingController();
  TextEditingController mkMoi2 = TextEditingController();
  ChangePassController _changePassController=Get.find<ChangePassController>();

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7FAFE),
        body: Column(
          children: [
            AppHeader(title: 'Đổi mật khẩu'),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
              child: Column(
                children: [
                  DInput(hintText: 'Mật khẩu cũ', controller: mkCu,isPass: true),
                  SizedBox(
                    height: 16.sp,
                  ),
                  DInput(hintText: 'Mật khẩu mới', controller: mkMoi1,isPass: true),
                  SizedBox(
                    height: 16.sp,
                  ),
                  DInput(hintText: 'Nhập lại mật khẩu mới', controller: mkMoi2,isPass: true),
                ],
              ),
            ))
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              top: 8.sp,
              bottom: viewPadding.bottom + 8.sp,
              left: 16.sp,
              right: 16.sp),
          child: DButton(text: 'Đồng ý'.tr, onClick: () {
            if(mkCu.text!=""&&mkMoi1.text!=""&&mkMoi2.text!=""){
              if(mkMoi1.text==mkMoi2.text){
                _changePassController.changePass(password: mkCu.text, newPassword: mkMoi1.text);
              }
              else{
                NotificationDialog.createSimpleDialog(
                    context: context,
                    titleButton1: 'OK',
                    numberButton: 1,
                    content: "Mật khẩu mới không trùng khớp",
                    type: 2,
                );
              }
            }
            else{
              NotificationDialog.createSimpleDialog(
                context: context,
                titleButton1: 'OK',
                numberButton: 1,
                content: "Bạn chưa nhập đủ thông tin",
                type: 2,
              );
            }

          }),
        ),
      ),
    );
  }
}
