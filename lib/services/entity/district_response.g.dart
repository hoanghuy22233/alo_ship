// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictItem _$DistrictItemFromJson(Map<String, dynamic> json) => DistrictItem(
      json['id'] as int?,
      json['province_id'] as int?,
      json['name'] as String?,
      json['prefix'] as String?,
    );

Map<String, dynamic> _$DistrictItemToJson(DistrictItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province_id': instance.province_id,
      'name': instance.name,
      'prefix': instance.prefix,
    };

DistrictResponse _$DistrictResponseFromJson(Map<String, dynamic> json) =>
    DistrictResponse(
      (json['payload'] as List<dynamic>?)
          ?.map((e) => DistrictItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$DistrictResponseToJson(DistrictResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };
