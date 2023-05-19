import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../widgets/DLine.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';

class MoreDetail extends StatefulWidget {
  const MoreDetail({Key? key}) : super(key: key);

  @override
  State<MoreDetail> createState() => _MoreDetailState();
}

class _MoreDetailState extends State<MoreDetail> {
  DetailBookingData dataDetail=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      child: Column(
        children: [
          AppHeader(title: 'Đơn hàng mới'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15.sp,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Row(
                      children: [
                        WidgetContainerImage(
                          image: Assets.imagesImg1,
                          width: 45.sp,
                          height: 45.sp,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        SizedBox(width: 15.sp,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              dataDetail.booking_name??'',
                              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                            ),
                            AppText(
                              'Cách bạn ${dataDetail.distance!.toStringAsFixed(1)} km',
                              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w400,color: AppColors.grey7),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15.sp,),
                  Container(height: 1,color: AppColors.greyF2,),
                  SizedBox(height: 15.sp,),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.WHITE,
                      borderRadius: BorderRadius.circular(5.sp),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: AppColors.BLACK.withOpacity(0.05),
                          offset: Offset(0,4)
                        )
                      ]
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      children: [
                        itemAddress('Điểm đi',dataDetail.location_from??'Chưa có'),
                        DLine(),
                        itemAddress('Điểm đến',dataDetail.location_to??'Chưa có',hasLine: true,type: 2)
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        borderRadius: BorderRadius.circular(5.sp),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: AppColors.BLACK.withOpacity(0.05),
                              offset: Offset(0,4)
                          )
                        ]
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    margin: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 15.sp),
                    child: Column(
                      children: [
                        itemInfo(title: 'Tên người nhận', content: dataDetail.receiver_name??''),
                        itemInfo(title: 'Số điện thoại', content: dataDetail.receiver_phone??'',isCall: true,textColor: AppColors.blue1)
                      ],
                    ),
                  ),
                  _thongTinNguoiDat(),
                  DLine(),
                  SizedBox(height: 15.sp,),
                  // _thongTinVanChuyen(),
                  // DLine(),
                  // SizedBox(height: 15.sp,),
                  // Container(
                  //   margin: EdgeInsets.only(left: 16.sp,right: 16.sp,bottom: 18.sp),
                  //   padding: EdgeInsets.all(15.sp),
                  //   decoration: BoxDecoration(
                  //       color: AppColors.WHITE,
                  //     border: Border.all(width: 1,color: AppColors.primary),
                  //     borderRadius: BorderRadius.circular(5.sp)
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: AppText(
                  //           'Thu tiền mặt',
                  //           style: AppStyle.DEFAULT_16,
                  //         ),
                  //       ),
                  //       AppText(
                  //         '510.000 vnđ',
                  //         style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.primary),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemAddress(String title,String content,{bool hasLine=false,int type=1}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      margin: EdgeInsets.only(top: 12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AppText(
                  title,
                  style: AppStyle.DEFAULT_14.copyWith(color:type==1? AppColors.primary:AppColors.blue1),
                ),
              ),
              SvgPicture.asset(
                type==1?Assets.iconsIcDiemDi:Assets.iconsIcDiemDen,
                width: 15.sp,
                height: 15.sp,
                fit: BoxFit.contain,
              )
            ],
          ),
          SizedBox(height: 5.sp,),
          AppText(
            content,
            style: AppStyle.DEFAULT_16,
          ),
          SizedBox(height: 12.sp,),
          hasLine?DLine():SizedBox()
        ],
      ),
    );
  }

  Widget itemInfo({required String title,required String content,bool isBold=false,Color textColor=AppColors.BLACK,bool isCall=false}){
    return InkWell(
      onTap: ()async{
        if(isCall){
          if (!await launchUrl(
              Uri.parse('tel:${content}')
          )) {
            throw Exception('Could not launch');
          }
        }
      },
      child: Column(
        children: [
          SizedBox(height: 15.sp,),
          Row(
            children: [
              AppText(
                title,
                style: AppStyle.DEFAULT_16,
              ),
              Spacer(),
              AppText(
                content,
                style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: isBold?FontWeight.bold:FontWeight.w400,
                    color: textColor,
                    decoration:isCall?TextDecoration.underline:TextDecoration.none
                ),
              )
            ],
          ),
          SizedBox(height: 15.sp,),
          DLine()
        ],
      ),
    );
  }

  Widget itemInfo2({required String title,required String content,bool isBold=false,bool isCall=false}){
    return InkWell(
      onTap: ()async{
        if(isCall){
          if (!await launchUrl(
          Uri.parse('tel:${content}')
          )) {
        throw Exception('Could not launch');
        }
        }
      },
      child: Row(
        children: [
          AppText(
            title,
            style: AppStyle.DEFAULT_16,
          ),
          Spacer(),
          AppText(
            content,
            style: AppStyle.DEFAULT_16.copyWith(
                fontWeight: isBold?FontWeight.bold:FontWeight.w400,
                color: isCall?AppColors.blue1:AppColors.BLACK,
                decoration: isCall?TextDecoration.underline:TextDecoration.none
            ),
          )
        ],
      ),
    );
  }

  Widget _thongTinNguoiDat(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Thông tin người đặt',
            style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Tên người đặt', content: dataDetail.orderer_name??''),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Số điện thoại', content: dataDetail.orderer_user_phone??'',isCall: true),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Phí vận chuyển', content: 'Người nhận trả'),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Ghi chú', content:''),
          SizedBox(height: 15.sp,),
          AppText(
            dataDetail.note??'',
            style: AppStyle.DEFAULT_16,
          ),
          SizedBox(height: 20.sp,)
        ],
      ),
    );
  }
  Widget _thongTinVanChuyen(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Thông tin vận chuyển',
            style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Mã vận chuyển', content: 'ABC 1231345'),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Khoảng cách', content: '0.5 km'),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Tiến ứng', content: '500.000 vnđ'),
          SizedBox(height: 15.sp,),
          itemInfo2(title: 'Phí vận chuyển', content: '10.000 vnđ',isBold: true),
          SizedBox(height: 15.sp,),
        ],
      ),
    );
  }
}
