// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailBookingData _$DetailBookingDataFromJson(Map<String, dynamic> json) =>
    DetailBookingData(
      id: json['id'] as int?,
      booking_code: json['booking_code'] as String?,
      customer_code: json['customer_code'] as String?,
      shipper_code: json['shipper_code'] as String?,
      booking_name: json['booking_name'] as String?,
      receiver_name: json['receiver_name'] as String?,
      receiver_phone: json['receiver_phone'] as String?,
      orderer_name: json['orderer_name'] as String?,
      orderer_user_phone: json['orderer_user_phone'] as String?,
      shipping_fee_type: json['shipping_fee_type'] as String?,
      shipping_fee_type_name: json['shipping_fee_type_name'] as String?,
      note: json['note'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      advance_money: json['advance_money'] as int?,
      shipping_fee_admin: json['shipping_fee_admin'] as int?,
      shipping_fee_shipper: json['shipping_fee_shipper'] as int?,
      final_price: json['final_price'] as int?,
      created_date: json['created_date'] as String?,
      status: json['status'] as String?,
      status_name: json['status_name'] as String?,
      location_from: json['location_from'] as String?,
      location_to: json['location_to'] as String?,
      statusTimeBooking: (json['statusTimeBooking'] as List<dynamic>?)
          ?.map((e) => ItemStatusTime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailBookingDataToJson(DetailBookingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_code': instance.booking_code,
      'customer_code': instance.customer_code,
      'shipper_code': instance.shipper_code,
      'booking_name': instance.booking_name,
      'receiver_name': instance.receiver_name,
      'receiver_phone': instance.receiver_phone,
      'orderer_name': instance.orderer_name,
      'orderer_user_phone': instance.orderer_user_phone,
      'shipping_fee_type': instance.shipping_fee_type,
      'shipping_fee_type_name': instance.shipping_fee_type_name,
      'note': instance.note,
      'distance': instance.distance,
      'advance_money': instance.advance_money,
      'shipping_fee_admin': instance.shipping_fee_admin,
      'final_price': instance.final_price,
      'shipping_fee_shipper': instance.shipping_fee_shipper,
      'created_date': instance.created_date,
      'status': instance.status,
      'status_name': instance.status_name,
      'location_from': instance.location_from,
      'location_to': instance.location_to,
      'statusTimeBooking': instance.statusTimeBooking,
    };

DetailBookingResponse _$DetailBookingResponseFromJson(
        Map<String, dynamic> json) =>
    DetailBookingResponse(
      json['payload'] == null
          ? null
          : DetailBookingData.fromJson(json['payload'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$DetailBookingResponseToJson(
        DetailBookingResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'payload': instance.payload,
    };

ItemStatusTime _$ItemStatusTimeFromJson(Map<String, dynamic> json) =>
    ItemStatusTime(
      json['status_name'] as String?,
      json['updated_date'] as String?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..datetime = json['datetime'] as int?;

Map<String, dynamic> _$ItemStatusTimeToJson(ItemStatusTime instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'datetime': instance.datetime,
      'status_name': instance.status_name,
      'updated_date': instance.updated_date,
    };
