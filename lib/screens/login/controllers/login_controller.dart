import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/common/routes/navigator.dart';
import 'package:sprint/res/app_pref.dart';
import 'package:sprint/services/repo/common_repository.dart';

import '../../../services/entity/login_response.dart';

class LoginController extends BaseController{
  CommonRepository commonRepository = Get.find<CommonRepository>();

  Rx<LoginData?> data= null.obs;

  login({required String email,required String password})async{
    callApi<LoginResponse>(
        api: commonRepository.login({
          'email':email,
          'password':password
        }),
        onSuccess: (res)async{
          await AppPref().saveString('TOKEN', res.payload!.token!);
          AppNavigator.navigateHome();
        }
    );
  }
}