import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/history/controllers/history_controller.dart';
import 'package:sprint/screens/home/controllers/home_controller.dart';
import 'package:sprint/services/entity/history_booking_response.dart';
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
  HistoryController _historyController=Get.find<HistoryController>();
  HomeController _homeController=Get.find<HomeController>();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    Future.delayed(Duration(seconds: 0),(){
      _historyController.getHistoryTransfer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      child: Column(
        children: [
          AppHeader(title: 'Lịch sử vận chuyển',onBack: (){
            AppNavigator.navigateHome();
            _homeController.listBooking();
          },),
          // _renderTopTab(),
          // Expanded(child: TabBarView(
          //   controller: _tabController,
          //   physics: NeverScrollableScrollPhysics(),
          //   children: [
          //     _renderListData(),
          //     _renderListData(),
          //     _renderListData(),
          //   ],
          // )),
          Expanded(child: _renderListData()),
        ],
      ),
    );
  }

  Widget _renderItemList(ItemHistoryBooking data){
    return InkWell(
      onTap: (){
        AppNavigator.navigateDetailHistory(data.booking_code!);
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data.booking_name??'',
                          style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                data.status=="01"? 'Đang lấy hàng':data.status=="02"?"Đang giao":"Hoàn thành",
                                style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500,color:data.status=="03"? AppColors.green:AppColors.orange),
                              ),
                            ),
                            AppText(
                              AppValue.formatStringDateAndTime(data.updated_date??''),
                              style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
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
                    data.location_from??'',
                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5.sp,),
                  AppText(
                    'Điểm đến',
                    style: AppStyle.DEFAULT_16,
                  ),
                  SizedBox(height: 5.sp,),
                  AppText(
                    data.location_to??'---',
                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 12.sp,),
                  Container(height: 1,width: Get.width,color: AppColors.greyF2,),
                  SizedBox(height: 10.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        'Phí vận chuyển',
                        style: AppStyle.DEFAULT_16,
                      ),
                      AppText(
                          data.shipping_fee_admin!=0? AppValue.format_money(data.status=='03'?data.shipping_fee_shipper!.toDouble() : data.shipping_fee_admin!.toDouble()):'---',
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
    return Obx((){
      if(_historyController.listHistory!.value.isNotEmpty){
        return ListView.builder(
          itemCount: _historyController.listHistory!.value.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 15.sp,right: 15.sp,top: 15.sp),
          itemBuilder: (context, index) {
            return _renderItemList(_historyController.listHistory!.value[index]);
          },
        );
      }
      else{
        return Center(child: AppText('Chưa có dữ liệu',style: AppStyle.DEFAULT_16.copyWith(fontStyle: FontStyle.italic),),);
      }
    });
  }

}
