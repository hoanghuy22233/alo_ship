import 'package:json_annotation/json_annotation.dart';
import 'package:sprint/services/entity/base_response.dart';

part 'list_booking_response.g.dart';

@JsonSerializable()
class ItemListBooking {
  int? id;
  String? booking_code,customer_code,shipper_code,type_flg,booking_name,payments_flg,created_date,status,status_name;
  double? distance;
  String? location_from,location_to;
  int? advance_money,shipping_fee,final_price;


  ItemListBooking(
      this.id,
      this.booking_code,
      this.customer_code,
      this.shipper_code,
      this.type_flg,
      this.booking_name,
      this.payments_flg,
      this.created_date,
      this.status,
      this.status_name,
      this.distance,
      this.location_from,
      this.location_to,
      this.advance_money,
      this.shipping_fee,
      this.final_price);

  factory ItemListBooking.fromJson(Map<String, dynamic> json) =>
      _$ItemListBookingFromJson(json);

  Map<String, dynamic> toJson() => _$ItemListBookingToJson(this);
}

@JsonSerializable()
class ItemLocation {
  int? id;
  String? booking_code,location,type;
  double? location_lat,location_long;


  ItemLocation(this.id, this.booking_code, this.location, this.type,
      this.location_lat, this.location_long);

  factory ItemLocation.fromJson(Map<String, dynamic> json) =>
      _$ItemLocationFromJson(json);

  Map<String, dynamic> toJson() => _$ItemLocationToJson(this);
}

@JsonSerializable()
class ListBookingResponse extends BaseResponse {
  List<ItemListBooking>? payload;


  ListBookingResponse(this.payload);

  factory ListBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBookingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookingResponseToJson(this);
}
