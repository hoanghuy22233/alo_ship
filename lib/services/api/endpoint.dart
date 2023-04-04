class Endpoint {
  Endpoint._();

  static const BASE_URL = 'https://admin.smartkidney.vn';
  static const otp = '/api/otp';
  static const check_otp = '/api/verifyotp';
  static const login = '/api/login';
  static const about_us = '/api/aboutus';
  static const terms = '/api/termsandconditions';
  static const home = '/api/home';
  static const detail_news = '/api/article';
  static const detail_test = '/api/test';
  static const add_patient_data = '/api/AddPatientData';
  static const query_data = '/api/QueryPatientData';
  static const view_data = '/api/ViewPatientData';
  static const user_info = '/api/QueryPatientInfo';
  static const update_avatar = '/api/UploadPatientAvatar';
  static const add_body_index = '/api/AddBodyIndex';
  static const query_body_index = '/api/QueryBodyIndex';
  static const update_user_info = '/api/UpdatePatientInfo';
  static const add_treatment = '/api/AddTreatmentPlan';
  static const delete_data = '/api/DeletePatientData';
  static const list_treatment = '/api/QueryTreatmentPlan';
  static const query_test = '/api/QueryTest';
  static const like_data = '/api/LikeData';
  static const getComment = '/api/GetComment';
  static const addComment = '/api/AddComment';
  static const submitTest = '/api/SubmitTestAnswers';
  static const getMessage = '/api/message';
  static const getTest = '/api/Test';


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
