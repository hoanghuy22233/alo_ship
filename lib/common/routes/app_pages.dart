import 'package:get/get.dart';
import 'package:sprint/screens/home/detail_order.dart';
import 'package:sprint/screens/home/more_detail.dart';
import 'package:sprint/screens/loading/splash.dart';
import 'package:sprint/screens/login/fogot_pass.dart';
import 'package:sprint/screens/login/login.dart';
import 'package:sprint/screens/login/register.dart';
import 'package:sprint/screens/login/reset_pass.dart';
import '../../screens/home/home_page.dart';

import 'common_pages.dart';

part 'app_routes.dart';

class AppPages extends CommonPages {
  AppPages();

  @override
  List<GetPage> onConfig() {
    return [
        GetPage(name: Routes.splash, page: () => const Splash()),
        GetPage(name: Routes.home, page: () => const HomePage()),
        GetPage(name: Routes.login, page: () => const Login()),
        GetPage(name: Routes.register, page: () => const Register()),
        GetPage(name: Routes.forgotPass, page: () => const ForgotPass()),
        GetPage(name: Routes.resetPass, page: () => const ResetPass()),
        GetPage(name: Routes.detailOrder, page: () => const DetailOrder()),
        GetPage(name: Routes.moreDetail, page: () => const MoreDetail()),
     ];
  }
}
