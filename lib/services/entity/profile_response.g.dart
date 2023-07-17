// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      id: json['id'] as int?,
      user_code: json['user_code'] as String?,
      full_name: json['full_name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      district_name: json['district_name'] as String?,
      province_name: json['province_name'] as String?,
      sex: json['sex'] as String?,
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      license_plate: json['license_plate'] as String?,
      birthday: json['birthday'] as String?,
      province: json['province'] as int?,
      district: json['district'] as int?,
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district': instance.district,
      'province': instance.province,
      'user_code': instance.user_code,
      'full_name': instance.full_name,
      'phone': instance.phone,
      'email': instance.email,
      'sex': instance.sex,
      'avatar': instance.avatar,
      'address': instance.address,
      'license_plate': instance.license_plate,
      'birthday': instance.birthday,
      'district_name': instance.district_name,
      'province_name': instance.province_name,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['payload'] == null
          ? null
          : ProfileData.fromJson(json['payload'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };
