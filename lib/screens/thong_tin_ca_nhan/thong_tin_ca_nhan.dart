import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:sprint/widgets/widget_handle.dart';

const String imgLinkTemp =
    'https://images2.thanhnien.vn/Uploaded/minhnguyet/2021_11_11/trieu-lo-tu-217.jpg';

class ThongTinCaNhan extends StatefulWidget {
  const ThongTinCaNhan({super.key});

  @override
  State<ThongTinCaNhan> createState() => _ThongTinCaNhanState();
}

class _ThongTinCaNhanState extends State<ThongTinCaNhan> {
  bool isSua = false;
  XFile? avatar;
  TextEditingController ten = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Color(0xFFF7FAFE),
        body: Column(
          children: [
            AppHeader(title: 'Thông tin cá nhân'),
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (avatar != null)
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5.sp),
                            child: Image.file(
                              File(avatar!.path),
                              width: 110.sp,
                              height: 110.sp,
                              fit: BoxFit.cover,
                            )),
                      if (avatar == null)
                        WidgetNetworkImage(
                          image: imgLinkTemp,
                          width: 110.sp,
                          height: 110.sp,
                          fit: BoxFit.cover,
                          borderRadius: 5.sp,
                        ),
                      if (isSua)
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 12.sp),
                                  child: DButton(
                                      bgColor: AppColors.WHITE,
                                      textColor: AppColors.BLACK,
                                      text: 'Chọn ảnh'.tr,
                                      onClick: () async {
                                        final ImagePicker picker = ImagePicker();
                                        final XFile? image =
                                            await picker.pickImage(
                                                source: ImageSource.gallery);
                                        if (image != null) {
                                          setState(() {
                                            avatar = image;
                                          });
                                        }
                                      }),
                                ),
                              ),
                              Expanded(child: SizedBox())
                            ],
                          ),
                        )
                    ],
                  ),
                  DInput(hintText: 'Tên', controller: ten)
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
          child: DButton(
              text: isSua ? 'Lưu lại'.tr : 'Chỉnh sửa'.tr,
              onClick: () {
                setState(() {
                  isSua = !isSua;
                });
              }),
        ),
      ),
    );
  }
}
