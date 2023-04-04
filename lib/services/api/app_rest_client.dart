import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'endpoint.dart';
part 'app_rest_client.g.dart';

@RestApi(baseUrl: Endpoint.BASE_URL)
abstract class AppRestClient {
  factory AppRestClient(Dio dio) = _AppRestClient;
// authentication
//
//   @POST(Endpoint.otp)
//   Future<BaseResponse> otp(
//       @Body() Map<String,dynamic> data
//       );
}
