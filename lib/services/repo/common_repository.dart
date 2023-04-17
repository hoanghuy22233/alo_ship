import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/district_response.dart';
import 'package:sprint/services/entity/login_response.dart';
import 'package:sprint/services/entity/profile_response.dart';
import 'package:sprint/services/entity/province_response.dart';
import '../api/app_rest_client.dart';
import 'app_common_repository.dart';

class CommonRepository extends AppCommonRepository {
  final Dio dio;

  CommonRepository(this.dio) : super(dio);

//authentic
  Future<LoginResponse> login(Map<String,dynamic> data) async {
    final client = AppRestClient(dio);
    return client.login(data);
  }

  Future<ProfileResponse> getProfile() async {
    final client = AppRestClient(dio);
    return client.getProfile();
  }

  Future<ProvinceResponse> getProvince() async {
    final client = AppRestClient(dio);
    return client.getProvince();
  }

  Future<DistrictResponse> getDistrict(int provinceId) async {
    final client = AppRestClient(dio);
    return client.getDistrict(provinceId);
  }

  Future<BaseResponse> updateProfile(Map<String,dynamic> data) async {
    final client = AppRestClient(dio);
    return client.updateProfile(data);
  }

  Future<BaseResponse> changePass(Map<String,dynamic> data) async {
    final client = AppRestClient(dio);
    return client.changePass(data);
  }

}
