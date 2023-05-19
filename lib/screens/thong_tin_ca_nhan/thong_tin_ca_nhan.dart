import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/app_values.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/thong_tin_ca_nhan/controllers/thong_tin_ca_nhan_controller.dart';
import 'package:sprint/services/entity/profile_response.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:sprint/widgets/app_text.dart';
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

  ProfileController _profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () {
      _profileController.getProfile((ProfileData res){
        ten.text = res.full_name??"";
        email.text = res.email??"";
        ngaySinh.text = AppValue.formatStringDate(res.birthday!);
        bienSo.text = res.license_plate??"";
        tinhThanh.text = res.province_name??"";
        quanHuyen.text = res.district_name??"";
        diaChi.text ='${res.address??''}'+', '+'${res.district_name??''}'+', '+'${res.province_name??''}';
      });
      _profileController.getProvince();
    });


  }

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
              child: Obx((){
                if(_profileController.profile.value!=null){
                  final ns =ngaySinh.text!=""? ngaySinh.text.split('/'):AppValue.DATE_FORMAT.format(DateTime.now()).split("/");
                  final d = int.parse(ns[0]);
                  final m = int.parse(ns[1]);
                  final y = int.parse(ns[2]);
                  return Column(
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
                          child: DInput(hintText: 'Email'.tr, controller: email,readOnly: true,)),
                      SizedBox(height: 16.sp),
                      InkWell(
                        onTap: () async {
                          if (isSua) {
                            final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime(y,m,d),
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
                      // DInput(
                      //   hintText: 'Tỉnh/Thành phố'.tr,
                      //   controller: tinhThanh,
                      //   rightPadding: isSua ? 48.sp : 20.sp,
                      // ),
                      // SizedBox(height: 16.sp),
                      // DInput(
                      //   hintText: 'Quận/Huyện'.tr,
                      //   controller: quanHuyen,
                      //   rightPadding: isSua ? 48.sp : 20.sp,
                      // ),
                      // SizedBox(height: 16.sp),
                      IgnorePointer(
                          ignoring: !isSua,
                          child: DInput(
                              hintText: 'Địa chỉ cụ thể'.tr, controller: diaChi)),
                    ],
                  );
                }
                else{
                  return SizedBox();
                }
              }),
            ))
          ],
        ),
        // bottomNavigationBar: Padding(
        //   padding: EdgeInsets.only(
        //       top: 8.sp,
        //       bottom: viewPadding.bottom + 8.sp,
        //       left: 16.sp,
        //       right: 16.sp),
        //   child: DButton(
        //       text: isSua ? 'Lưu lại'.tr : 'Chỉnh sửa'.tr,
        //       onClick: () async{
        //         if(isSua){
        //           Map<String,dynamic> data={
        //             "full_name": ten.text,
        //             "address": diaChi.text,
        //             "district": _profileController.districId,
        //             "province": _profileController.provinceId,
        //             "license_plate": bienSo.text
        //           };
        //           if(ngaySinh.text!=""){
        //             data["birthday"]=AppValue.formatStringDateYMD(ngaySinh.text);
        //           }
        //           if(avatar!=null){
        //             List<int> bytes=await avatar!.readAsBytes();
        //             data["imageBase64"]=base64Encode(bytes);
        //           }
        //           _profileController.updateProfile(data,(){
        //             _profileController.getProfile((ProfileData res){
        //               ten.text = res.full_name??"";
        //               email.text = res.email??"";
        //               ngaySinh.text = AppValue.formatStringDate(res.birthday!);
        //               bienSo.text = res.license_plate??"";
        //               tinhThanh.text = res.province_name??"";
        //               quanHuyen.text = res.district_name??"";
        //               diaChi.text = res.address??"";
        //             });
        //           });
        //         }
        //         setState(() {
        //           isSua = !isSua;
        //         });
        //       }),
        // ),
      ),
    );
  }

  Obx selectImage() {
    return Obx((){
      if(_profileController.profile.value!.avatar!=null&&_profileController.profile.value!.avatar!="")
        {
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
                  image: _profileController.profile.value!.avatar??"",
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
      else return SizedBox();
    });
  }
}
