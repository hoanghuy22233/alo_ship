import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:sprint/widgets/app_text.dart';

import '../../generated/assets.dart';
import '../../res/app_values.dart';
import '../../widgets/widget_handle.dart';

class HistoryTransfer extends StatefulWidget {
  const HistoryTransfer({Key? key}) : super(key: key);

  @override
  State<HistoryTransfer> createState() => _HistoryTransferState();
}

class _HistoryTransferState extends State<HistoryTransfer> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int indexTab=0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      child: Column(
        children: [
          AppHeader(title: 'Lịch sử vận chuyển'),
          _renderTopTab(),
          Expanded(child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _renderListData(),
              _renderListData(),
              _renderListData(),
            ],
          ))
        ],
      ),
    );
  }

  Widget _renderTopTab(){
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              _tabController!.animateTo(0);
              setState(() {
                indexTab=0;
              });

            },
            child: Container(
              width: (Get.width-50.sp)/3,
              decoration: BoxDecoration(
                color: indexTab==0?AppColors.red1:AppColors.WHITE,
                borderRadius: BorderRadius.circular(5.sp)
              ),
              padding: EdgeInsets.symmetric(vertical: 9.sp),
              child: AppText(
                'Tất cả',
                textAlign: TextAlign.center,
                style: AppStyle.DEFAULT_16.copyWith(fontWeight: indexTab==0?FontWeight.w600:FontWeight.w400,color: indexTab==0?AppColors.WHITE:AppColors.BLACK,height: 1.3),
              ),
            ),
          ),
          SizedBox(width: 10.sp,),
          InkWell(
            onTap: (){
              setState(() {
                indexTab=1;
              });
              _tabController!.animateTo(1);
            },
            child: Container(
              width: (Get.width-50.sp)/3,
              decoration: BoxDecoration(
                  color: indexTab==1?AppColors.red1:AppColors.WHITE,
                  borderRadius: BorderRadius.circular(5.sp)
              ),

              padding: EdgeInsets.symmetric(vertical: 9.sp),
              child: AppText(
                'Đang thực hiện',
                textAlign: TextAlign.center,
                style: AppStyle.DEFAULT_16.copyWith(fontWeight: indexTab==1?FontWeight.w600:FontWeight.w400,color: indexTab==1?AppColors.WHITE:AppColors.BLACK,height: 1.3),
              ),
            ),
          ),
          SizedBox(width: 10.sp,),
          InkWell(
            onTap: (){
              _tabController!.animateTo(2);
              setState(() {
                indexTab=2;
              });
            },
            child: Container(
              width: (Get.width-50.sp)/3,
              decoration: BoxDecoration(
                  color: indexTab==2?AppColors.red1:AppColors.WHITE,
                  borderRadius: BorderRadius.circular(5.sp)
              ),
              padding: EdgeInsets.symmetric(vertical: 9.sp),
              child: AppText(
                'Hoàn thành',
                textAlign: TextAlign.center,
                style: AppStyle.DEFAULT_16.copyWith(fontWeight: indexTab==2?FontWeight.w600:FontWeight.w400,color: indexTab==2?AppColors.WHITE:AppColors.BLACK,height: 1.3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderItemList(){
    return InkWell(
      onTap: (){
        AppNavigator.navigateMoreDetail();
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
                        'Đơn hàng giao hàng (Hỏa tốc)',
                        style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                      ),
                      AppText(
                        'Hoàn thành',
                        style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,color: AppColors.green),
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
                  AppText(
                    'Điểm đi',
                    style: AppStyle.DEFAULT_16,
                  ),
                  SizedBox(height: 5.sp,),
                  AppText(
                    '5 ngõ 411 Đ. Trường Chinh,  Đống Đa, Hà Nội',
                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5.sp,),
                  AppText(
                    'Điểm đến',
                    style: AppStyle.DEFAULT_16,
                  ),
                  SizedBox(height: 5.sp,),
                  AppText(
                    '173 Yên Lãng, Thịnh Quang, Đống Đa, Hà Nội',
                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 12.sp,),
                  Container(height: 1,width: Get.width,color: AppColors.greyF2,),
                  SizedBox(height: 10.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        'Mã đơn: ABC 123456',
                        style: AppStyle.DEFAULT_16,
                      ),
                      AppText(
                        AppValue.format_money(20000),
                        style: AppStyle.DEFAULT_16.copyWith(color: AppColors.red1,fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderListData(){
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      itemBuilder: (context, index) {
        return _renderItemList();
      },
    );
  }

}
