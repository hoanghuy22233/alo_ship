import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/home/controllers/home_controller.dart';
import 'package:sprint/screens/home/header_home.dart';
import 'package:sprint/screens/home/item_list_home.dart';
import 'package:sprint/services/entity/profile_response.dart';
import 'package:sprint/widgets/app_base_page.dart';

import '../thong_tin_ca_nhan/controllers/thong_tin_ca_nhan_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController=Get.find<HomeController>();
  ProfileController _profileController = Get.find<ProfileController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _homeController.listBooking();
      _profileController.getProfile((ProfileData res){

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
          HeaderHome(),
          Expanded(
            child:Obx(() {
              if(_homeController.dataBooking.value.isNotEmpty){
                return ListView.builder(
                  itemCount: _homeController.dataBooking.value.length,
                  padding: EdgeInsets.only(top: 15.sp,left: 20.sp,right: 20.sp),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ItemListHome(data: _homeController.dataBooking.value[index]!,);
                  },
                );
              }

              else{
                return SizedBox();
              }
            }),
          )
        ],
      ),
    );
  }
}
