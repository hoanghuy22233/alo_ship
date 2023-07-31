import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/app_pref.dart';
import 'package:sprint/services/repo/common_repository.dart';

import '../../../services/entity/login_response.dart';

class LoginController extends BaseController{
  CommonRepository commonRepository = Get.find<CommonRepository>();

  Rx<LoginData?> data= null.obs;
  double? lat,lng;

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  String? tokenFirebase;

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    print("Công cục ${position.latitude}, ${position.longitude}");
    lat=position.latitude;
    lng=position.longitude;
  }


  @override
  void onReady() async{
    await getCurrentPosition();
    await getToken();
    super.onReady();
  }

  Future getToken()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    tokenFirebase = await messaging.getToken();
    print("Token firebase ${tokenFirebase}");
  }

  login({required String email,required String password})async{
    callApi<LoginResponse>(
        api: commonRepository.login({
          'email':email,
          'password':password,
          'location_lat':lat,
          'location_long':lng,
          'device_token':tokenFirebase
        }),
        onSuccess: (res)async{
          await AppPref().saveString('TOKEN', res.payload!.token!);
          AppNavigator.navigateHome();
        },
      onError: (e){
          print("Error login ${e}");
      }
    );
  }
}