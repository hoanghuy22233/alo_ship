import 'package:get/get.dart';
import '../services/api/dio_provider.dart';
import '../services/repo/common_repository.dart';
import 'common_binding.dart';

class AppBinding extends CommonBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.put(CommonRepository(DioProvider.instance()));
  }
}
