import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/detail_booking_response.dart';
import 'package:sprint/services/entity/district_response.dart';
import 'package:sprint/services/entity/history_booking_response.dart';
import 'package:sprint/services/entity/list_booking_response.dart';
import 'package:sprint/services/entity/login_response.dart';
import 'package:sprint/services/entity/notification_response.dart';
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

  Future<ListBookingResponse> listBooking() async {
    final client = AppRestClient(dio);
    return client.listBooking();
  }

  Future<NotificationResponse> getNotification() async {
    final client = AppRestClient(dio);
    return client.getNotification();
  }

  Future<DetailBookingResponse> getDetailBooking(String bookingCode) async {
    final client = AppRestClient(dio);
    return client.getDetailBooking(bookingCode);
  }

  Future<DetailBookingResponse> getDetailHistory(String bookingCode) async {
    final client = AppRestClient(dio);
    return client.getDetailHistory(bookingCode);
  }

  Future<BaseResponse> updateStatus(Map<String,dynamic> data) async {
    final client = AppRestClient(dio);
    return client.updateStatus(data);
  }

  Future<BaseResponse> readNotification(Map<String,dynamic> data) async {
    final client = AppRestClient(dio);
    return client.readNotification(data);
  }

  Future<HistoryBookingResponse> getHistoryBooking() async {
    final client = AppRestClient(dio);
    return client.getHistoryBooking();
  }

}
