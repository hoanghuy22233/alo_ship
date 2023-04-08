import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  TextEditingController email = TextEditingController();
  TextEditingController ngaySinh = TextEditingController();
  TextEditingController bienSo = TextEditingController();
  TextEditingController tinhThanh = TextEditingController();
  TextEditingController quanHuyen = TextEditingController();
  TextEditingController diaChi = TextEditingController();

  @override
  void initState() {
    super.initState();
    ten.text = 'Như Quỳnh';
    email.text = 'mailmail@gmail.com';
    ngaySinh.text = '31/12/2022';
    bienSo.text = 'Biển kiểm soát 17B123123';
    tinhThanh.text = 'Hà Nội';
    quanHuyen.text = 'Thanh Xuân';
    diaChi.text = '120 Nguyễn Trãi, Thanh Xuân';
  }

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    final ns = ngaySinh.text.split('/');
    final d = int.parse(ns[0]);
    final m = int.parse(ns[1]);
    final y = int.parse(ns[2]);
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
                  selectImage(),
                  SizedBox(height: 16.sp),
                  IgnorePointer(
                    ignoring: !isSua,
                    child: DInput(
                      hintText: 'Tên'.tr,
                      controller: ten,
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  IgnorePointer(
                      ignoring: !isSua,
                      child: DInput(hintText: 'Email'.tr, controller: email)),
                  SizedBox(height: 16.sp),
                  InkWell(
                    onTap: () async {
                      if (isSua) {
                        final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime(y, m, d),
                            firstDate: DateTime(1970),
                            lastDate: DateTime.now());
                        if (date != null) {
                          setState(() {
                            ngaySinh.text =
                                '${date.day}/${date.month}/${date.year}';
                          });
                        }
                      }
                    },
                    child: IgnorePointer(
                      child: Stack(children: [
                        DInput(
                          hintText: 'Ngày sinh'.tr,
                          controller: ngaySinh,
                          rightPadding: isSua ? 48.sp : 20.sp,
                        ),
                        if (isSua)
                          Positioned(
                            right: 16.sp,
                            top: 0,
                            bottom: 0,
                            child: SvgPicture.asset(
                              'assets/icons/ngaySinh.svg',
                              width: 16.sp,
                              height: 16.sp,
                            ),
                          )
                      ]),
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  IgnorePointer(
                      ignoring: !isSua,
                      child: DInput(
                          hintText: 'Biển kiểm soát'.tr, controller: bienSo)),
                  SizedBox(height: 16.sp),
                  InkWell(
                    onTap: () {
                      if (isSua) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container();
                          },
                        );
                      }
                    },
                    child: IgnorePointer(
                      child: Stack(children: [
                        DInput(
                          hintText: 'Tỉnh/Thành phố'.tr,
                          controller: tinhThanh,
                          rightPadding: isSua ? 48.sp : 20.sp,
                        ),
                        if (isSua)
                          Positioned(
                            right: 16.sp,
                            top: 0,
                            bottom: 0,
                            child: SvgPicture.asset(
                              'assets/icons/muiTen.svg',
                              width: 16.sp,
                              height: 16.sp,
                            ),
                          )
                      ]),
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  InkWell(
                    onTap: () {
                      if (isSua) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container();
                          },
                        );
                      }
                    },
                    child: IgnorePointer(
                      child: Stack(children: [
                        DInput(
                          hintText: 'Quận/Huyện'.tr,
                          controller: quanHuyen,
                          rightPadding: isSua ? 48.sp : 20.sp,
                        ),
                        if (isSua)
                          Positioned(
                            right: 16.sp,
                            top: 0,
                            bottom: 0,
                            child: SvgPicture.asset(
                              'assets/icons/muiTen.svg',
                              width: 16.sp,
                              height: 16.sp,
                            ),
                          )
                      ]),
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  IgnorePointer(
                      ignoring: !isSua,
                      child: DInput(
                          hintText: 'Địa chỉ cụ thể'.tr, controller: diaChi)),
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

  Row selectImage() {
    return Row(
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
                          final XFile? image = await picker.pickImage(
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
    );
  }
}
