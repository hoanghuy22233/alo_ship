// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemListBooking _$ItemListBookingFromJson(Map<String, dynamic> json) =>
    ItemListBooking(
      json['id'] as int?,
      json['booking_code'] as String?,
      json['customer_code'] as String?,
      json['shipper_code'] as String?,
      json['type_flg'] as String?,
      json['booking_name'] as String?,
      json['payments_flg'] as String?,
      json['created_date'] as String?,
      json['status'] as String?,
      json['status_name'] as String?,
      (json['distance'] as num?)?.toDouble(),
      json['location_from'] as String?,
      json['location_to'] as String?,
      json['advance_money'] as int?,
      json['shipping_fee'] as int?,
      (json['distance_user'] as num?)?.toDouble(),
      json['final_price'] as int?,
    );

Map<String, dynamic> _$ItemListBookingToJson(ItemListBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_code': instance.booking_code,
      'customer_code': instance.customer_code,
      'shipper_code': instance.shipper_code,
      'type_flg': instance.type_flg,
      'booking_name': instance.booking_name,
      'payments_flg': instance.payments_flg,
      'created_date': instance.created_date,
      'status': instance.status,
      'status_name': instance.status_name,
      'distance': instance.distance,
      'distance_user': instance.distance_user,
      'location_from': instance.location_from,
      'location_to': instance.location_to,
      'advance_money': instance.advance_money,
      'shipping_fee': instance.shipping_fee,
      'final_price': instance.final_price,
    };

ItemLocation _$ItemLocationFromJson(Map<String, dynamic> json) => ItemLocation(
      json['id'] as int?,
      json['booking_code'] as String?,
      json['location'] as String?,
      json['type'] as String?,
      (json['location_lat'] as num?)?.toDouble(),
      (json['location_long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemLocationToJson(ItemLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_code': instance.booking_code,
      'location': instance.location,
      'type': instance.type,
      'location_lat': instance.location_lat,
      'location_long': instance.location_long,
    };

ListBookingResponse _$ListBookingResponseFromJson(Map<String, dynamic> json) =>
    ListBookingResponse(
      (json['payload'] as List<dynamic>?)
          ?.map((e) => ItemListBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$ListBookingResponseToJson(
        ListBookingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };
