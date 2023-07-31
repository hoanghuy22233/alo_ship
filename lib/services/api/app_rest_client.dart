import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/services/entity/district_response.dart';
import 'package:sprint/services/entity/history_booking_response.dart';
import 'package:sprint/services/entity/list_booking_response.dart';
import 'package:sprint/services/entity/login_response.dart';
import 'package:sprint/services/entity/notification_response.dart';
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

  @POST(Endpoint.updateStatus)
  Future<BaseResponse> updateStatus(
      @Body() Map<String,dynamic> data
      );

  @POST(Endpoint.readNotification)
  Future<BaseResponse> readNotification(
      @Body() Map<String,dynamic> data
      );

  @GET(Endpoint.listBooking)
  Future<ListBookingResponse> listBooking();

  @POST(Endpoint.updateLocation)
  Future<ListBookingResponse> updateLocation(
      @Body() Map<String,dynamic> data
      );

  @GET(Endpoint.notification)
  Future<NotificationResponse> getNotification();

  @GET(Endpoint.detailBooking)
  Future<DetailBookingResponse> getDetailBooking(
      @Query('booking_code') String bookingCode
      );

  @GET(Endpoint.detailHistory)
  Future<DetailBookingResponse> getDetailHistory(
      @Query('booking_code') String bookingCode
      );

  @GET(Endpoint.historyBooking)
  Future<HistoryBookingResponse> getHistoryBooking();
}
