import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sprint/widgets/DHeader.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_header.dart';

import '../../widgets/DButton.dart';

class DoiMatKhau extends StatefulWidget {
  const DoiMatKhau({super.key});

  @override
  State<DoiMatKhau> createState() => _DoiMatKhauState();
}

class _DoiMatKhauState extends State<DoiMatKhau> {
  TextEditingController mkCu = TextEditingController();
  TextEditingController mkMoi1 = TextEditingController();
  TextEditingController mkMoi2 = TextEditingController();

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
                  DInput(hintText: 'Mật khẩu cũ', controller: mkCu),
                  SizedBox(
                    height: 16.sp,
                  ),
                  DInput(hintText: 'Mật khẩu mới', controller: mkMoi1),
                  SizedBox(
                    height: 16.sp,
                  ),
                  DInput(hintText: 'Nhập lại mật khẩu mới', controller: mkMoi2),
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
          child: DButton(text: 'Đồng ý'.tr, onClick: () {}),
        ),
      ),
    );
  }
}
