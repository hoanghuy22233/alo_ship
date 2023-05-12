import 'package:json_annotation/json_annotation.dart';
import 'package:sprint/services/entity/base_response.dart';

part 'history_booking_response.g.dart';

@JsonSerializable()
class ItemHistoryBooking {
  int? id;
  String? booking_code,customer_code,shipper_code,booking_name,location_from,location_to,status_name,status,updated_date;
  double? distance;
  int? shipping_fee_admin,shipping_fee_shipper;


  ItemHistoryBooking(
      this.id,
      this.booking_code,
      this.customer_code,
      this.shipper_code,
      this.booking_name,
      this.location_from,
      this.location_to,
      this.status_name,
      this.distance,
      this.shipping_fee_admin,
      this.status,
      this.updated_date,
      this.shipping_fee_shipper);

  factory ItemHistoryBooking.fromJson(Map<String, dynamic> json) =>
      _$ItemHistoryBookingFromJson(json);

  Map<String, dynamic> toJson() => _$ItemHistoryBookingToJson(this);
}

@JsonSerializable()
class HistoryBookingResponse extends BaseResponse {
  List<ItemHistoryBooking>? payload;


  HistoryBookingResponse(this.payload);

  factory HistoryBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryBookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryBookingResponseToJson(this);
}
