import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/services/repo/common_repository.dart';

class DetailController extends BaseController{
  CommonRepository commonRepository = Get.find<CommonRepository>();

  Rx<DetailBookingData?> detailBooking= DetailBookingData().obs;

  getDetailBooking({required String bookingCode})async{
    callApi<DetailBookingResponse>(
        api: commonRepository.getDetailBooking(bookingCode),
        onSuccess: (res)async{
          detailBooking.value=res.payload;
        }
    );
  }

  updateStatus({
    required String bookingCode,
    required String status,
    String? shipping_fee,
    required Function onSuccess
  })async{

    Map<String,dynamic> data={
      "booking_code":bookingCode,
      "status":status
    };
    if(shipping_fee!=null) data['shipping_fee']=shipping_fee;

    callApi<BaseResponse>(
        api: commonRepository.updateStatus(data),
        onSuccess: (res)async{
          onSuccess();
        },
        onError: (e){
          print("error update status ${e}");
        }
    );
  }
}