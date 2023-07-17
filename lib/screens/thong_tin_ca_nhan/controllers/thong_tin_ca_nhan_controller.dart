import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/district_response.dart';
import 'package:sprint/services/entity/province_response.dart';
import 'package:sprint/services/repo/common_repository.dart';
import 'package:sprint/widgets/widget_dialog.dart';

import '../../../res/app_pref.dart';
import '../../../services/entity/profile_response.dart';

class ProfileController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();

  Rx<ProfileData?> profile=ProfileData().obs;
  RxList<ProvinceItem?> listProvince=<ProvinceItem>[].obs;
  RxList<DistrictItem?> listDistrict=<DistrictItem>[].obs;

  int provinceId=0;
  int districId=0;
  Rx<String> avatar=''.obs;

  getProfile(Function onSuccess)async{
    callApi<ProfileResponse>(
        api: commonRepository.getProfile(),
        onSuccess: (res)async{
          avatar.value=res.payload!.avatar!;
          profile.value=res.payload;
          provinceId=res.payload!.province!;
          await getDistrict(provinceId: res.payload!.province!);
          districId=res.payload!.district!;
          onSuccess(res.payload);
        },
        onError: (e){
          print("Error profile ${e}");
        }
    );
  }

  getProvince()async{
    callApi<ProvinceResponse>(
        api: commonRepository.getProvince(),
        onSuccess: (res)async{
          listProvince.value=res.payload!;
        },
        onError: (e){
          print("Error profile ${e}");
        }
    );
  }

  getDistrict({required int provinceId,TextEditingController? controller})async{
    callApi<DistrictResponse>(
        api: commonRepository.getDistrict(provinceId),
        onSuccess: (res)async{
          if(districId==0)
          districId=res.payload![0].id!;
          listDistrict.value=res.payload!;
          if(controller!=null)
          controller.text=res.payload![0].name!;
        },
        onError: (e){
          print("Error profile ${e}");
        }
    );
  }

  selectProvince(int id,TextEditingController districtController){
    provinceId=id;
    getDistrict(provinceId: id,controller: districtController);
  }

  updateProfile(Map<String,dynamic> data,Function onSuccess)async{
    callApi<BaseResponse>(
        api: commonRepository.updateProfile(data),
        onSuccess: (res)async{
          NotificationDialog.createSimpleDialog(
              context: Get.context!,
              titleButton1: 'OK',
              numberButton: 1,
              content: "Cập nhật thông tin cá nhân thành công!",
              onTap1: (){
                Get.back();
                onSuccess();
              }
          );
        },
        onError: (e){
          print("Error update profile ${e}");
        }
    );
  }
}