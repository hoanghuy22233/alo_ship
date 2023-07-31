import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/services/entity/list_booking_response.dart';

import '../../../services/repo/common_repository.dart';

class HomeController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();

  RxList<ItemListBooking?> dataBooking= <ItemListBooking>[].obs;

  listBooking()async{
    callApi<ListBookingResponse>(
        api: commonRepository.listBooking(),
        onSuccess: (res)async{
          dataBooking.value=res.payload!;
        }
    );
  }

  updateLocation(Map<String,dynamic> data)async{
    callApiNotLoading<ListBookingResponse>(
        api: commonRepository.updateLocation(data),
        onSuccess: (res)async{
          dataBooking.value=res.payload!;
          update();
        }
    );
  }
}