import 'dart:io';

import 'package:dio/dio.dart';
import '../api/app_rest_client.dart';
import 'app_common_repository.dart';

class CommonRepository extends AppCommonRepository {
  final Dio dio;

  CommonRepository(this.dio) : super(dio);

//authentic
//   Future<BaseResponse> otp(Map<String,dynamic> data) async {
//     final client = AppRestClient(dio);
//     return client.otp(data);
//   }

}
