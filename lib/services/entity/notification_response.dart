import 'package:json_annotation/json_annotation.dart';
import 'package:sprint/services/entity/base_response.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class ItemNotification {
  int? id,is_read;
  String? notification_code,user_code,title,content,created_date;


  ItemNotification(this.id, this.is_read, this.notification_code,
      this.user_code, this.title, this.content, this.created_date);

  factory ItemNotification.fromJson(Map<String, dynamic> json) =>
      _$ItemNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ItemNotificationToJson(this);
}

@JsonSerializable()
class NotificationResponse extends BaseResponse {
  List<ItemNotification>? payload;


  NotificationResponse(this.payload);

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
