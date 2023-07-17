import 'package:get/get.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'app_pages.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();
  static navigateLogin() async => Get.offAllNamed(Routes.login);
  static navigateHome() async => Get.offAllNamed(Routes.home);
  static navigateRegister() async => Get.toNamed(Routes.register);
  static navigateForgotPass() async => Get.toNamed(Routes.forgotPass);
  static navigateResetPass() async => Get.toNamed(Routes.resetPass);
  static navigateDetailOrder(String code,double distance_user) async => Get.toNamed(Routes.detailOrder,arguments: [code,distance_user]);
  static navigateMoreDetail(DetailBookingData dataDetail) async => Get.toNamed(Routes.moreDetail,arguments: dataDetail);
  static navigateHistoryTransfer() async => Get.toNamed(Routes.historyTransfer);
  static navigateNotification() async => Get.toNamed(Routes.notification);
  static navigateDetailHistory(String bookingCode) async => Get.toNamed(Routes.detailHistory,arguments: bookingCode);
}
