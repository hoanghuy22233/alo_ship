import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/home/controllers/detail_controller.dart';
import 'package:sprint/screens/home/form_confirm.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:sprint/widgets/widget_dialog.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/app_values.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';

class DetailOrder extends StatefulWidget {
  const DetailOrder({Key? key}) : super(key: key);

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  int type=1;
  DetailController _detailController=Get.find<DetailController>();
  String booking_code=Get.arguments;


  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _detailController.getDetailBooking(bookingCode: booking_code);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 15.sp,right: 15.sp,bottom: 15.sp),
        child:type==1? DButton(
            text: 'Nhận đơn',
            textColor: AppColors.BLACK,
            bgColor: AppColors.WHITE,
            onClick: this.onClickNhanDon
        ):DButton(
            text: type==2?'Lấy hàng thành công':'Giao hàng thành công',
            textColor: AppColors.BLACK,
            bgColor: AppColors.WHITE,
            onClick: this.onClickLayDon
        ),
      ),
      child: Column(
        children: [
          AppHeader(title: 'Đơn hàng mới'),
          Expanded(child: Obx(() {
            if(_detailController.detailBooking.value!=null){
              DetailBookingData dataDetail=_detailController.detailBooking.value!;
              return Column(
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
                  Container(height: 1,color: AppColors.greyF2,width: Get.width,),
                  SizedBox(height: 15.sp,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // AppText(
                            //   '0.5 km',
                            //   style: AppStyle.DEFAULT_16.copyWith(color: AppColors.blueText),
                            // ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                AppNavigator.navigateMoreDetail(dataDetail);
                              },
                              child: AppText(
                                'Xem chi tiết',
                                style: AppStyle.DEFAULT_16.copyWith(color: AppColors.blueText,height: 1.3),
                              ),
                            ),
                            SizedBox(width: 5.sp,),
                            SvgPicture.asset(
                              Assets.iconsIcNext,
                              width: 10.sp,
                              height: 10.sp,
                              fit: BoxFit.contain,
                              color: AppColors.blue1,
                            )
                          ],
                        ),
                        SizedBox(height: 15.sp,),
                        Container(height: 1,color: AppColors.greyF2,width: Get.width,),
                        SizedBox(height: 15.sp,),
                        Container(
                          padding: EdgeInsets.all(15.sp),
                          decoration: BoxDecoration(
                              color: AppColors.WHITE,
                              borderRadius: BorderRadius.circular(6.sp),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                    color: AppColors.BLACK.withOpacity(0.05)
                                )
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    'Điểm đi',
                                    style: AppStyle.DEFAULT_16,
                                  ),
                                  // AppText(
                                  //   AppValue.format_money(4000000),
                                  //   style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: Color(0xffFF0000)),
                                  // )
                                ],
                              ),
                              SizedBox(height: 5.sp,),
                              AppText(
                                dataDetail.location_from??'Chưa có',
                                style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 5.sp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    'Điểm đến',
                                    style: AppStyle.DEFAULT_16,
                                  ),
                                  // AppText(
                                  //   AppValue.format_money(10000),
                                  //   style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.green),
                                  // )
                                ],
                              ),
                              SizedBox(height: 5.sp,),
                              AppText(
                                dataDetail.location_to??'Chưa có',
                                style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 13.sp,),
                              Container(
                                height: 1,
                                color: AppColors.greyF2,
                              ),
                              SizedBox(height: 15.sp,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    'Tiền ship',
                                    style: AppStyle.DEFAULT_14,
                                  ),
                                  AppText(
                                    AppValue.format_money(dataDetail.shipping_fee_admin!.toDouble()),
                                    style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.green),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              );
            }
            else return SizedBox();
          }))
        ],
      ),
    );
  }

  Widget _renderItemAddress(String title,String content){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title,
            style: AppStyle.DEFAULT_14.copyWith(color: AppColors.grey7),
          ),
          AppText(
            content,
            style: AppStyle.DEFAULT_16,
          ),
          SizedBox(height: 10.sp,),
          Container(height: 1,color: AppColors.greyF2,)
        ],
      ),
    );
  }

  onClickHuy() {
  }

  onClickNhanDon() {

    _detailController.updateStatus(
        bookingCode: booking_code,
        status: "01",
        onSuccess: (){
          setState(() {
            type=2;
          });
        }
    );
  }

  onClickLayDon() {
    if(type==2)
    {
      _detailController.updateStatus(
          bookingCode: booking_code,
          status: "02",
          onSuccess: (){
            setState(() {
              type=3;
            });
          }
      );
    }
    else{
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return FormConfirm(
            onHoanThanh: (sotien){
              _detailController.updateStatus(
                  bookingCode: booking_code,
                  status: "03",
                  shipping_fee: sotien,
                  onSuccess: (){
                    Get.back();

                  }
              );
            },
          );
        },
      );
    }
  }
}
