import 'package:hashed_system_task/network/response/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {
  ResponseData({
    this.data,
    this.message,
    this.accessToken,
  });

  @JsonKey(name: 'data')
  UserData? data;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'accessToken')
  String? accessToken;

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}