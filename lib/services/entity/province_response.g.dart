// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceItem _$ProvinceItemFromJson(Map<String, dynamic> json) => ProvinceItem(
      json['id'] as int?,
      json['province_code'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ProvinceItemToJson(ProvinceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province_code': instance.province_code,
      'name': instance.name,
    };

ProvinceResponse _$ProvinceResponseFromJson(Map<String, dynamic> json) =>
    ProvinceResponse(
      (json['payload'] as List<dynamic>?)
          ?.map((e) => ProvinceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$ProvinceResponseToJson(ProvinceResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };
