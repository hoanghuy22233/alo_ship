// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemNotification _$ItemNotificationFromJson(Map<String, dynamic> json) =>
    ItemNotification(
      json['id'] as int?,
      json['is_read'] as int?,
      json['notification_code'] as String?,
      json['user_code'] as String?,
      json['title'] as String?,
      json['content'] as String?,
      json['created_date'] as String?,
    );

Map<String, dynamic> _$ItemNotificationToJson(ItemNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_read': instance.is_read,
      'notification_code': instance.notification_code,
      'user_code': instance.user_code,
      'title': instance.title,
      'content': instance.content,
      'created_date': instance.created_date,
    };

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      (json['payload'] as List<dynamic>?)
          ?.map((e) => ItemNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };
