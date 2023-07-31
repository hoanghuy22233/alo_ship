import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/res/app_styles.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/home/controllers/home_controller.dart';
import 'package:sprint/screens/home/header_home.dart';
import 'package:sprint/screens/home/item_list_home.dart';
import 'package:sprint/screens/login/controllers/login_controller.dart';
import 'package:sprint/services/entity/profile_response.dart';
import 'package:sprint/widgets/DButton.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_text.dart';

import '../thong_tin_ca_nhan/controllers/thong_tin_ca_nhan_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController=Get.find<HomeController>();
  ProfileController _profileController = Get.find<ProfileController>();
  LoginController _loginController = Get.find<LoginController>();
  ScrollController _scrollController=ScrollController();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      _homeController.listBooking();
      _profileController.getProfile((ProfileData res){

      });

    });
    Future.delayed(Duration(seconds: 9),(){
      Timer.periodic(new Duration(seconds: 9), (timer) {
        _loginController.getCurrentPosition();
      });
    });
    Future.delayed(Duration(seconds: 10),(){
      Timer.periodic(new Duration(seconds: 10), (timer) {
        _homeController.updateLocation({
          "lat":_loginController.lat,
          "long":_loginController.lng
        });
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
                return RefreshIndicator(
                  onRefresh:this.onRefresh,
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: _homeController.dataBooking.value.length,
                    padding: EdgeInsets.only(top: 15.sp,left: 20.sp,right: 20.sp),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemListHome(data: _homeController.dataBooking.value[index]!,);
                    },
                  ),
                );
              }

              else{
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText('Chưa có đơn hàng',style: AppStyle.DEFAULT_16.copyWith(fontStyle: FontStyle.italic),),
                      SizedBox(height: 20.sp,),
                      Row(
                        children: [
                          Spacer(flex: 3,),
                          Expanded(flex: 3,child: DButton(text: 'Làm mới', onClick: this.onRefresh)),
                          Spacer(flex: 3,),
                        ],
                      )
                    ],
                  ),
                );
              }
            }),
          )
        ],
      ),
    );
  }

  Future<void> onRefresh() async{
    _homeController.listBooking();
  }
}
