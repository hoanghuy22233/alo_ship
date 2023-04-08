import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/res/res.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:sprint/widgets/app_text.dart';

class DieuKhoanChinhSach extends StatefulWidget {
  const DieuKhoanChinhSach({super.key});

  @override
  State<DieuKhoanChinhSach> createState() => _DieuKhoanChinhSachState();
}

class _DieuKhoanChinhSachState extends State<DieuKhoanChinhSach> {
  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFE),
      body: Column(
        children: [
          AppHeader(title: 'Điều khoản chính sách'.tr),
          Expanded(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: 16.sp,
                    left: 16.sp,
                    right: 16.sp,
                    bottom: viewPadding.bottom + 30.sp),
                child: Column(
                  children: [
                    AppText(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: AppStyle.DEFAULT_16.copyWith(),
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.sp),
                      child: Image.asset(
                        'assets/icons/dieuKhoan.png',
                        width: 192.sp,
                        height: 192.sp,
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
