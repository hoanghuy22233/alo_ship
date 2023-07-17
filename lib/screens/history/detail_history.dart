import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sprint/res/app_values.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/history/controllers/history_controller.dart';
import 'package:sprint/screens/home/controllers/detail_controller.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../res/app_styles.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DLine.dart';
import '../../widgets/app_text.dart';
import '../../widgets/widget_handle.dart';
import '../home/form_confirm.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory({Key? key}) : super(key: key);

  @override
  State<DetailHistory> createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
  String bookingCode=Get.arguments;
  HistoryController _historyController=Get.find<HistoryController>();
  int type=1;
  DetailController _detailController =Get.find<DetailController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _historyController.getDetailHistory(bookingCode: bookingCode,onSuccess: (res){
        type=res.status=="01"?1:res.status=="02"?2:3;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      child: Column(
        children: [
          AppHeader(title: 'Đơn hàng mới'),
          Expanded(
            child: Obx((){
              if(_historyController.detailHistory.value!.booking_code!=null){
                DetailBookingData dataDetail=_historyController.detailHistory.value!;
                return SingleChildScrollView(
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
                                  type==1?'Đang lấy hàng':type==2?'Đang giao':'Hoàn thành',
                                  style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,color:dataDetail.status=="03"? AppColors.green:AppColors.orange),
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
                            itemInfo(title: 'Số điện thoại', content: dataDetail.receiver_phone??'',textColor: AppColors.blue1,isCall: true)
                          ],
                        ),
                      ),
                      _thongTinNguoiDat(dataDetail),
                      DLine(),
                      SizedBox(height: 15.sp,),
                      Column(
                        children: List.generate(dataDetail.statusTimeBooking!.length, (index) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.sp),
                            child: itemInfo2(title: dataDetail.statusTimeBooking![index].status_name??'', content: AppValue.formatStringDateAndTime(dataDetail.statusTimeBooking![index].updated_date??''))),),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 14.sp,horizontal: 15.sp),
                        margin: EdgeInsets.symmetric(horizontal: 30.sp,vertical: 15.sp),
                        decoration: BoxDecoration(
                          color: AppColors.WHITE,
                          borderRadius: BorderRadius.circular(5.sp),
                          border: Border.all(width: 1,color: AppColors.red1)
                        ),
                        child: itemInfo2(title: 'Phí vận chuyện', content: AppValue.format_money(dataDetail.status=='03'?dataDetail.shipping_fee_shipper!.toDouble() : dataDetail.shipping_fee_admin!.toDouble()),isBold: true),
                      ),
                      SizedBox(height: 15.sp,),
                      Container(
                        margin: EdgeInsets.only(left: 15.sp,right: 15.sp,bottom: 15.sp),
                        child:type==1? DButton(
                            text: 'Lấy hàng thành công',
                            textColor: AppColors.BLACK,
                            bgColor: AppColors.WHITE,
                            onClick: this.onClickLayThanhCong
                        ):type==2? DButton(
                            text: 'Giao hàng thành công',
                            textColor: AppColors.BLACK,
                            bgColor: AppColors.WHITE,
                            onClick: this.onClickGiaoThanhCong
                        ):SizedBox(),
                      )
                    ],
                  ),
                );
              }
              else{
                return SizedBox();
              }
            }),
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

  Widget _thongTinNguoiDat(DetailBookingData dataDetail){
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

  onClickLayThanhCong() {
    _detailController.updateStatus(
        bookingCode: bookingCode,
        status: "02",
        onSuccess: (){
          // Get.back();
          setState(() {
            type=2;
          });
          _historyController.getHistoryTransfer();
        }
    );
  }

  onClickGiaoThanhCong() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return FormConfirm(
          onHoanThanh: (sotien){
            _detailController.updateStatus(
                bookingCode: bookingCode,
                status: "03",
                shipping_fee: sotien,
                onSuccess: (){
                  Get.back();
                  Get.back();
                  _historyController.getHistoryTransfer();
                }
            );
          },
        );
      },
    );
  }
}
