import 'package:get/get.dart';
import 'app_pages.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();
  static navigateLogin() async => Get.offAllNamed(Routes.login);
  static navigateHome() async => Get.offAllNamed(Routes.home);
  static navigateRegister() async => Get.toNamed(Routes.register);
  static navigateForgotPass() async => Get.toNamed(Routes.forgotPass);
  static navigateResetPass() async => Get.toNamed(Routes.resetPass);
}
