import 'package:get/get.dart';
import 'package:sprint/screens/doi_mat_khau/controllers/change_pass_controller.dart';
import 'package:sprint/screens/login/controllers/login_controller.dart';
import 'package:sprint/screens/thong_tin_ca_nhan/controllers/thong_tin_ca_nhan_controller.dart';
import '../services/api/dio_provider.dart';
import '../services/repo/common_repository.dart';
import 'common_binding.dart';

class AppBinding extends CommonBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put(CommonRepository(DioProvider.instance()));
    Get.put(LoginController());
    Get.put(ProfileController());
    Get.put(ChangePassController());
  }
}
