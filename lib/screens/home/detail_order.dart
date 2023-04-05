import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';

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
  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 15.sp,right: 15.sp,bottom: 15.sp),
        child: Row(
          children: [
            Expanded(child: DButton(
                text: 'Hủy bỏ',
                textColor: AppColors.BLACK,
                bgColor: AppColors.WHITE,
                onClick: this.onClickHuy
            )),
            SizedBox(width: 15.sp,),
            Expanded(child: DButton(text: 'Nhận đơn', onClick: this.onClickNhanDon)),
          ],
        ),
      ),
      child: Column(
        children: [
          AppHeader(title: 'Đơn hàng mới'),
          Expanded(child: Column(
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
                          'Đơn hàng giao hàng (Hỏa tốc)',
                          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                        ),
                        AppText(
                          'Cách bạn 1.3 km',
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
                        AppText(
                          '0.5 km',
                          style: AppStyle.DEFAULT_16.copyWith(color: AppColors.blueText),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            AppNavigator.navigateMoreDetail();
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
                                'Tiền ứng',
                                style: AppStyle.DEFAULT_16,
                              ),
                              AppText(
                                AppValue.format_money(4000000),
                                style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: Color(0xffFF0000)),
                              )
                            ],
                          ),
                          SizedBox(height: 5.sp,),
                          AppText(
                            '5 ngõ 411 Đ. Trường Chinh,  Đống Đa, Hà Nội',
                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 5.sp,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                'Tiền ship',
                                style: AppStyle.DEFAULT_16,
                              ),
                              AppText(
                                AppValue.format_money(10000),
                                style: AppStyle.DEFAULT_18.copyWith(fontWeight: FontWeight.w500,color: AppColors.green),
                              )
                            ],
                          ),
                          SizedBox(height: 5.sp,),
                          AppText(
                            '173 Yên Lãng, Thịnh Quang, Đống Đa, Hà Nội',
                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.sp,),
                    Container(
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
                          Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.iconsIcMarker,
                                  width: 18.sp,
                                  height: 18.sp,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 9.sp,),
                                Expanded(
                                  child: AppText(
                                    '4 điểm đến khác',
                                    style: AppStyle.DEFAULT_14,
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.sp),
                                    child: SvgPicture.asset(
                                      Assets.iconsIcNext,
                                      width: 15.sp,
                                      height: 15.sp,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: AppColors.greyF2,
                          ),
                          SizedBox(height: 10.sp,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(3, (index) => _renderItemAddress('Điểm đến ${index+1}', '120 Nguyễn Trãi, Thanh Xuân, Hà Nội')),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ))
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
  }
}
