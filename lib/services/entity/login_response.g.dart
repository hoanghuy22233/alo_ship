// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['payload'] == null
          ? null
          : LoginData.fromJson(json['payload'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      json['id'] as int?,
      json['user_code'] as String?,
      json['full_name'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['avatar'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'id': instance.id,
      'user_code': instance.user_code,
      'full_name': instance.full_name,
      'phone': instance.phone,
      'email': instance.email,
      'avatar': instance.avatar,
      'token': instance.token,
    };
