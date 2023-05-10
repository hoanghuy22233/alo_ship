import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/thong_bao/controllers/notification_controller.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';
import 'package:sprint/widgets/app_text.dart';

import 'item_thong_bao.dart';

class ThongBao extends StatefulWidget {
  const ThongBao({Key? key}) : super(key: key);

  @override
  State<ThongBao> createState() => _ThongBaoState();
}

class _ThongBaoState extends State<ThongBao> {
  NotificationController _notificationController=Get.find<NotificationController>();

  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      child: Column(
        children: [
          AppHeader(title: 'Thông báo'),
          Expanded(
            child:Obx((){
              if(_notificationController.dataNotification.value.isNotEmpty)
                {
                  return ListView.builder(
                    itemCount: _notificationController.dataNotification.value.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 15.sp,left: 16.sp,right: 16.sp),
                    itemBuilder: (context, index) {
                      return ItemThongBao(data: _notificationController.dataNotification.value[index],);
                    },
                  );
                }
              else{
                return Center(
                  child: AppText('Không có thông báo',style: AppStyle.DEFAULT_16.copyWith(fontStyle: FontStyle.italic),),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
