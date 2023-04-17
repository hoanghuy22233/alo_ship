import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'province_response.g.dart';

@JsonSerializable()
class ProvinceItem {
  int? id;
  String? province_code,name;


  ProvinceItem(this.id, this.province_code, this.name);

  factory ProvinceItem.fromJson(Map<String, dynamic> json) =>
      _$ProvinceItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceItemToJson(this);
}

@JsonSerializable()
class ProvinceResponse extends BaseResponse {
  List<ProvinceItem>? payload;


  ProvinceResponse(this.payload);

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);
}
