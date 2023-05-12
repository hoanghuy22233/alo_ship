import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/generated/assets.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/app_values.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/services/entity/list_booking_response.dart';
import 'package:sprint/widgets/app_text.dart';
import 'package:sprint/widgets/widget_handle.dart';

class ItemListHome extends StatefulWidget {
  ItemListHome({Key? key,required this.data}) : super(key: key);

  ItemListBooking data;

  @override
  State<ItemListHome> createState() => _ItemListHomeState();
}

class _ItemListHomeState extends State<ItemListHome> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppNavigator.navigateDetailOrder(widget.data.booking_code!,widget.data.distance_user!);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.WHITE,
            borderRadius: BorderRadius.circular(5.sp)
        ),
        margin: EdgeInsets.only(bottom: 15.sp),
        padding: EdgeInsets.symmetric(vertical: 15.sp),
        child: Column(
          children: [
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
                        widget.data.booking_name??'',
                        style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                      ),
                      AppText(
                        'Cách bạn ${widget.data.distance_user!.toStringAsFixed(1)} km',
                        style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w400,color: AppColors.grey7),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15.sp,),
            Container(height: 1,width: Get.width,color: AppColors.greyF2,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.sp,),
                  // Row(
                  //   children: [
                  //     SvgPicture.asset(
                  //       Assets.iconsIcMarker,
                  //       width: 18.sp,
                  //       height: 18.sp,
                  //       fit: BoxFit.contain,
                  //     ),
                  //     SizedBox(width: 9.sp,),
                  //     Expanded(
                  //       child: AppText(
                  //         '${widget.data.locations!.length-2} điểm đến khác',
                  //         style: AppStyle.DEFAULT_14,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.all(5.sp),
                  //       child: SvgPicture.asset(
                  //         Assets.iconsIcNext,
                  //         width: 15.sp,
                  //         height: 15.sp,
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //
                  //   ],
                  // ),
                  // SizedBox(height: 15.sp,),
                  // Container(height: 1,width: Get.width,color: AppColors.greyF2,),
                  // SizedBox(height: 15.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        'Điểm đi',
                        style: AppStyle.DEFAULT_16,
                      ),
                      // AppText(
                      //   AppValue.format_money(widget.data.advance_money!.toDouble()),
                      //   style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: Color(0xffFF0000)),
                      // )
                    ],
                  ),
                  SizedBox(height: 5.sp,),
                  AppText(
                    '${widget.data.location_from}',
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
                      //   AppValue.format_money(widget.data.shipping_fee!.toDouble()),
                      //   style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.green),
                      // )
                    ],
                  ),
                  SizedBox(height: 5.sp,),
                  AppText(
                    '${widget.data.location_to??'Chưa có'}',
                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 12.sp,),
                  Container(height: 1,width: Get.width,color: AppColors.greyF2,),
                  // SizedBox(height: 10.sp,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     AppText(
                  //       'Tiền ship',
                  //       style: AppStyle.DEFAULT_14,
                  //     ),
                  //     AppText(
                  //       '${AppValue.format_money(widget.data.shipping_fee!.toDouble())}',
                  //       style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.green)
                  //     )
                  //   ],
                  // ),
                  SizedBox(height: 15.sp,),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 9.sp),
                      decoration: BoxDecoration(
                        color: AppColors.WHITE,
                        border: Border.all(width: 1,color: AppColors.primary),
                        borderRadius: BorderRadius.circular(5.sp)
                      ),
                      width: Get.width,
                      child: AppText(
                        'Nhận đơn',
                        textAlign: TextAlign.center,
                        style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,height: 1.3),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
