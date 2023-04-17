import 'package:json_annotation/json_annotation.dart';
import 'package:sprint/services/entity/base_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileData {
  int? id;
  String? user_code,full_name,phone,email,sex,avatar,address,license_plate,birthday,province,district;


  ProfileData({this.id, this.user_code, this.full_name, this.phone, this.email,
    this.sex, this.avatar, this.address,this.license_plate,this.birthday,this.province,this.district});

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

@JsonSerializable()
class ProfileResponse extends BaseResponse {

  ProfileData? payload;


  ProfileResponse(this.payload);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
