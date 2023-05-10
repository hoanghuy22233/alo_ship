import 'package:json_annotation/json_annotation.dart';
import 'package:sprint/services/entity/base_response.dart';
import 'package:sprint/services/entity/list_booking_response.dart';

part 'detail_booking_response.g.dart';

@JsonSerializable()
class DetailBookingData {
  int? id;
  String? booking_code,customer_code,shipper_code,booking_name,receiver_name,receiver_phone,orderer_name,orderer_user_phone,shipping_fee_type;
  String? shipping_fee_type_name,note;
  double? distance;
  int? advance_money,shipping_fee_admin,final_price,shipping_fee_shipper;
  String? created_date,status,status_name;
  String? location_from,location_to;


  DetailBookingData(
  {
    this.id,
    this.booking_code,
    this.customer_code,
    this.shipper_code,
    this.booking_name,
    this.receiver_name,
    this.receiver_phone,
    this.orderer_name,
    this.orderer_user_phone,
    this.shipping_fee_type,
    this.shipping_fee_type_name,
    this.note,
    this.distance,
    this.advance_money,
    this.shipping_fee_admin,
    this.shipping_fee_shipper,
    this.final_price,
    this.created_date,
    this.status,
    this.status_name,
    this.location_from,
    this.location_to
});

  factory DetailBookingData.fromJson(Map<String, dynamic> json) =>
      _$DetailBookingDataFromJson(json);

  Map<String, dynamic> toJson() => _$DetailBookingDataToJson(this);
}

@JsonSerializable()
class DetailBookingResponse extends BaseResponse {
  DetailBookingData? payload;


  DetailBookingResponse(this.payload);

  factory DetailBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailBookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailBookingResponseToJson(this);
}
