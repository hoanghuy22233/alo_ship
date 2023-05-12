import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/services/entity/history_booking_response.dart';

import '../../../services/repo/common_repository.dart';

class HistoryController extends BaseController{
  CommonRepository commonRepository = Get.find<CommonRepository>();
  RxList<ItemHistoryBooking>? listHistory=<ItemHistoryBooking>[].obs;
  Rx<DetailBookingData?> detailHistory=DetailBookingData().obs;

  getHistoryTransfer()async{
    callApi<HistoryBookingResponse>(
        api: commonRepository.getHistoryBooking(),
        onSuccess: (res)async{
          listHistory!.value=res.payload!;
        },
        onError: (e){
          print('error history ${e}');
        }
    );
  }

  getDetailHistory({required String bookingCode,Function? onSuccess})async{
    callApi<DetailBookingResponse>(
        api: commonRepository.getDetailHistory(bookingCode),
        onSuccess: (res)async{
          print("Công hihi ${res.payload!}");
          detailHistory.value=res.payload!;
          if(onSuccess!=null) onSuccess(res.payload);
        },
        onError: (e){
          print('error history ${e}');
        }
    );
  }
}