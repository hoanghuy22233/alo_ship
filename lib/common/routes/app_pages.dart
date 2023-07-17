import 'package:get/get.dart';
import 'package:sprint/screens/history/detail_history.dart';
import 'package:sprint/screens/history/history_transfer.dart';
import 'package:sprint/screens/dieu_khoan_chinh_sach/dieu_khoan_chinh_sach.dart';
import 'package:sprint/screens/doi_mat_khau/doi_mat_khau.dart';
import 'package:sprint/screens/home/detail_order.dart';
import 'package:sprint/screens/home/more_detail.dart';
import 'package:sprint/screens/loading/splash.dart';
import 'package:sprint/screens/login/fogot_pass.dart';
import 'package:sprint/screens/login/login.dart';
import 'package:sprint/screens/login/register.dart';
import 'package:sprint/screens/login/reset_pass.dart';
import 'package:sprint/screens/thong_bao/thong_bao.dart';
import 'package:sprint/screens/thong_tin_ca_nhan/thong_tin_ca_nhan.dart';
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
        GetPage(name: Routes.thongTinCaNhan, page: () => const ThongTinCaNhan()),
        GetPage(name: Routes.historyTransfer, page: () => const HistoryTransfer()),
        GetPage(name: Routes.doiMatKhau, page: () => const DoiMatKhau()),
        GetPage(name: Routes.dieuKhoanChinhSach, page: () => const DieuKhoanChinhSach()),
        GetPage(name: Routes.notification, page: () => const ThongBao()),
        GetPage(name: Routes.detailHistory, page: () => const DetailHistory()),
     ];
  }
}
