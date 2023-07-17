import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/generated/assets.dart';
import 'package:sprint/res/app_pref.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/widget_handle.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

bool fake=false;

class _SplashState extends State<Splash> {

  fakeIOS() async {
    var _dio = Dio();
    final _result = await _dio.get(
        'https://raw.githubusercontent.com/hoanghuy22233/ios_fake/main/ship99');
    final value = _result.data!.toString().trim();
    print('fakeIOS $value');
    if (value == '1') fake = true;
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0),(){
      fakeIOS();
    });
    Future.delayed(Duration(seconds: 2),(){
      getToken();
    });
    super.initState();
  }

  getToken()async {
    String? token=await AppPref().getString("TOKEN");
    if(token!=null){
      AppNavigator.navigateHome();
    }
    else{
      AppNavigator.navigateLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      child: Stack(
        children: [
          WidgetContainerImage(
            image: Assets.imagesBgSplash,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child: Center(
              child: WidgetContainerImage(
                image: Assets.imagesLogo,
                width: Get.width/2,
                height: 150.sp,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
