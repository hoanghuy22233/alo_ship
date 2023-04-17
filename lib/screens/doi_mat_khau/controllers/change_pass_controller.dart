import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/repo/common_repository.dart';
import 'package:sprint/widgets/widget_dialog.dart';

class ChangePassController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();

  changePass({required String password,required String newPassword})async{
    callApi<BaseResponse>(
        api: commonRepository.changePass({
          'password':password,
          'newPassword':newPassword
        }),
        onSuccess: (res)async{
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: 'OK',
              numberButton: 1,
              content: "Đổi mật khẩu thành công!",
              onTap1: (){
                  Get.back();
                  Get.back();
              }
          );
        }
    );
  }
}