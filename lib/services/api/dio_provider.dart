import 'package:dio/dio.dart';
import 'dio_interceptors.dart';
import 'endpoint.dart';
import '../../res/strings.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio();
    dio
      ..options.baseUrl = Endpoint.BASE_URL
      ..options.connectTimeout = Endpoint.connectionTimeout
      ..options.receiveTimeout = Endpoint.receiveTimeout
      ..options.headers = {
        AppStrings.content_type: AppStrings.application_json
      }
      ..options.followRedirects = false
      ..options.validateStatus =   (status) { return status! < 500; }
      ..interceptors.add(LogInterceptor(
        request: false,
        responseBody: false,
        requestBody: false,
        requestHeader: false,
      ))
      ..interceptors.add(AppDioInterceptor(tokenPrefix: 'Bearer '));
    return dio;
  }
}
