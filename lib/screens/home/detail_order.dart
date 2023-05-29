import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/home/controllers/detail_controller.dart';
import 'package:sprint/screens/home/controllers/home_controller.dart';
import 'package:sprint/screens/home/form_confirm.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/DInput.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:sprint/widgets/widget_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../res/app_values.dart';
import '../../widgets/DLine.dart';
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
  String booking_code=Get.arguments[0];
  double distance_user=Get.arguments[1];
  HomeController _homeController=Get.find<HomeController>();


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
                              'Cách bạn ${distance_user.toStringAsFixed(1)} km',
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
                        // Row(
                        //   children: [
                        //     // AppText(
                        //     //   '0.5 km',
                        //     //   style: AppStyle.DEFAULT_16.copyWith(color: AppColors.blueText),
                        //     // ),
                        //     Spacer(),
                        //     InkWell(
                        //       onTap: (){
                        //         AppNavigator.navigateMoreDetail(dataDetail);
                        //       },
                        //       child: AppText(
                        //         'Xem chi tiết',
                        //         style: AppStyle.DEFAULT_16.copyWith(color: AppColors.blueText,height: 1.3),
                        //       ),
                        //     ),
                        //     SizedBox(width: 5.sp,),
                        //     SvgPicture.asset(
                        //       Assets.iconsIcNext,
                        //       width: 10.sp,
                        //       height: 10.sp,
                        //       fit: BoxFit.contain,
                        //       color: AppColors.blue1,
                        //     )
                        //   ],
                        // ),
                        // SizedBox(height: 15.sp,),
                        // Container(height: 1,color: AppColors.greyF2,width: Get.width,),
                        SizedBox(height: 15.sp,),
                        // type==1? Container(
                        //   padding: EdgeInsets.all(15.sp),
                        //   decoration: BoxDecoration(
                        //       color: AppColors.WHITE,
                        //       borderRadius: BorderRadius.circular(6.sp),
                        //       boxShadow: [
                        //         BoxShadow(
                        //             spreadRadius: 0,
                        //             blurRadius: 10,
                        //             offset: Offset(0, 4),
                        //             color: AppColors.BLACK.withOpacity(0.05)
                        //         )
                        //       ]
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           AppText(
                        //             'Điểm đi',
                        //             style: AppStyle.DEFAULT_16,
                        //           ),
                        //           // AppText(
                        //           //   AppValue.format_money(4000000),
                        //           //   style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: Color(0xffFF0000)),
                        //           // )
                        //         ],
                        //       ),
                        //       SizedBox(height: 5.sp,),
                        //       AppText(
                        //         dataDetail.location_from??'Chưa có',
                        //         style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                        //       ),
                        //       SizedBox(height: 5.sp,),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           AppText(
                        //             'Điểm đến',
                        //             style: AppStyle.DEFAULT_16,
                        //           ),
                        //           // AppText(
                        //           //   AppValue.format_money(10000),
                        //           //   style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.green),
                        //           // )
                        //         ],
                        //       ),
                        //       SizedBox(height: 5.sp,),
                        //       AppText(
                        //         dataDetail.location_to??'Chưa có',
                        //         style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                        //       ),
                        //       SizedBox(height: 13.sp,),
                        //       Container(
                        //         height: 1,
                        //         color: AppColors.greyF2,
                        //       ),
                        //       SizedBox(height: 15.sp,),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           AppText(
                        //             'Tiền ship',
                        //             style: AppStyle.DEFAULT_14,
                        //           ),
                        //           AppText(
                        //             AppValue.format_money(dataDetail.shipping_fee_admin!.toDouble()),
                        //             style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.green),
                        //           )
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ):
                        Container(
                          child: Column(
                            children: [
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
                                // margin: EdgeInsets.symmetric(horizontal: 16.sp),
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
                                margin: EdgeInsets.symmetric(vertical: 15.sp),
                                child: Column(
                                  children: [
                                    itemInfo(title: 'Tên người nhận', content: dataDetail.receiver_name??''),
                                    itemInfo(title: 'Số điện thoại', content: dataDetail.receiver_phone??'',isCall: true,textColor: AppColors.blue1)
                                  ],
                                ),
                              ),
                              _thongTinNguoiDat(dataDetail),
                              DLine(),
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

  Widget _thongTinNguoiDat(DetailBookingData dataDetail){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
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
          itemInfo2(title: 'Lưu ý', content:''),
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

  onClickHuy() {
  }

  onClickNhanDon() {
    // setState(() {
    //   type=2;
    // });
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
                    Get.back();
                    AppNavigator.navigateHistoryTransfer();
                  }
              );
            },
          );
        },
      );
    }
  }
}
