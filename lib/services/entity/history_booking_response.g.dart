// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemHistoryBooking _$ItemHistoryBookingFromJson(Map<String, dynamic> json) =>
    ItemHistoryBooking(
      json['id'] as int?,
      json['booking_code'] as String?,
      json['customer_code'] as String?,
      json['shipper_code'] as String?,
      json['booking_name'] as String?,
      json['location_from'] as String?,
      json['location_to'] as String?,
      json['status_name'] as String?,
      (json['distance'] as num?)?.toDouble(),
      json['shipping_fee_admin'] as int?,
      json['status'] as String?,
      json['updated_date'] as String?,
      json['shipping_fee_shipper'] as int?,
    );

Map<String, dynamic> _$ItemHistoryBookingToJson(ItemHistoryBooking instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_code': instance.booking_code,
      'customer_code': instance.customer_code,
      'shipper_code': instance.shipper_code,
      'booking_name': instance.booking_name,
      'location_from': instance.location_from,
      'location_to': instance.location_to,
      'status_name': instance.status_name,
      'status': instance.status,
      'updated_date': instance.updated_date,
      'distance': instance.distance,
      'shipping_fee_admin': instance.shipping_fee_admin,
      'shipping_fee_shipper': instance.shipping_fee_shipper,
    };

HistoryBookingResponse _$HistoryBookingResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryBookingResponse(
      (json['payload'] as List<dynamic>?)
          ?.map((e) => ItemHistoryBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$HistoryBookingResponseToJson(
        HistoryBookingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };
