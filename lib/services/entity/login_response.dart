import 'package:json_annotation/json_annotation.dart';
import 'package:sprint/services/entity/base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse{
  LoginData? payload;


  LoginResponse(this.payload);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData{
  int? id;
  String? user_code,full_name,phone,email,avatar,token;


  LoginData(this.id, this.user_code, this.full_name, this.phone, this.email,
      this.avatar, this.token);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
