class Endpoint {
  Endpoint._();

  static const BASE_URL = 'https://ship99.top';
  static const login = '/api/user/login';
  static const profile = '/api/user/profile';
  static const update_profile = '/api/user/update-info-user';
  static const province = '/api/user/list-province';
  static const district = '/api/user/list-district';
  static const changePass = '/api/user/change-password';


  static const int DEFAULT_LIMIT = 20;

  // request failed
  static const int FAILURE = 0;

  // request success
  static const int SUCCESS = 1;

  // request with token expire
  static const int TOKEN_EXPIRE = 2;

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // method
  static const GET = 'GET';
  static const POST = 'POST';
  static const PUT = 'PUT';
  static const DELETE = 'DELETE';

  // get path
  static String getPath(String path) {
    return '$BASE_URL$path';
  }
}
