import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/district_response.dart';
import 'package:sprint/services/entity/login_response.dart';
import 'package:sprint/services/entity/profile_response.dart';
import 'package:sprint/services/entity/province_response.dart';
import 'endpoint.dart';
part 'app_rest_client.g.dart';

@RestApi(baseUrl: Endpoint.BASE_URL)
abstract class AppRestClient {
  factory AppRestClient(Dio dio) = _AppRestClient;
// authentication
//
  @POST(Endpoint.login)
  Future<LoginResponse> login(
      @Body() Map<String,dynamic> data
      );

  @GET(Endpoint.profile)
  Future<ProfileResponse> getProfile();

  @GET(Endpoint.province)
  Future<ProvinceResponse> getProvince();

  @GET(Endpoint.district)
  Future<DistrictResponse> getDistrict(
      @Query("province_id") int provinceId
      );

  @POST(Endpoint.update_profile)
  Future<BaseResponse> updateProfile(
      @Body() Map<String,dynamic> data
      );

  @POST(Endpoint.changePass)
  Future<BaseResponse> changePass(
      @Body() Map<String,dynamic> data
      );
}
