import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sprint/common/controllers/base_controller.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/district_response.dart';
import 'package:sprint/services/entity/province_response.dart';
import 'package:sprint/services/repo/common_repository.dart';

import '../../../res/app_pref.dart';
import '../../../services/entity/profile_response.dart';

class ProfileController extends BaseController{
  CommonRepository commonRepository=Get.find<CommonRepository>();

  Rx<ProfileData?> profile=ProfileData().obs;
  RxList<ProvinceItem?> listProvince=<ProvinceItem>[].obs;
  RxList<DistrictItem?> listDistrict=<DistrictItem>[].obs;

  int provinceId=-1;
  int districId=-1;

  getProfile(Function onSuccess)async{
    callApi<ProfileResponse>(
        api: commonRepository.getProfile(),
        onSuccess: (res)async{
          profile.value=res.payload;
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
          districId=res.payload![0].id!;
          listDistrict.value=res.payload!;
          controller!.text=res.payload![0].name!;
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

  updateProfile(Map<String,dynamic> data)async{
    callApi<BaseResponse>(
        api: commonRepository.updateProfile(data),
        onSuccess: (res)async{
          print("Công cặc ${res}");
        },
        onError: (e){
          print("Error update profile ${e}");
        }
    );
  }

}