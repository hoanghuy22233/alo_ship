import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/notification_response.dart';
import 'package:sprint/services/repo/common_repository.dart';

class NotificationController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();
  RxList<ItemNotification> dataNotification = <ItemNotification>[].obs;
  Rx<int> numberNotification = 0.obs;

  getNotification()async{
    callApi<NotificationResponse>(
        api: commonRepository.getNotification(),
        onSuccess: (res)async{
          dataNotification.value=res.payload!;
          numberNotification.value=res.payload!.where((element) => element.is_read==0).toList().length;
        },
        onError: (e){
          print("Error Notification ${e}");
        }
    );
  }

  readNotificaton({
    required int id,
    required String code,
    required Function onSuccess
})async{
    await callApi<BaseResponse>(
        api: commonRepository.readNotification({
          "id": id,
          "notification_code": code
        }),
        onSuccess: (res)async{
          onSuccess();
        },
        onError: (e){
          print("Error Notification ${e}");
        }
    );
  }
}