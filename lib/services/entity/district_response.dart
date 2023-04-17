import 'package:json_annotation/json_annotation.dart';

import 'base_response.dart';

part 'district_response.g.dart';

@JsonSerializable()
class DistrictItem {
  int? id,province_id;
  String? name,prefix;


  DistrictItem(this.id, this.province_id, this.name, this.prefix);

  factory DistrictItem.fromJson(Map<String, dynamic> json) =>
      _$DistrictItemFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictItemToJson(this);
}

@JsonSerializable()
class DistrictResponse extends BaseResponse {
  List<DistrictItem>? payload;


  DistrictResponse(this.payload);

  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);
}
