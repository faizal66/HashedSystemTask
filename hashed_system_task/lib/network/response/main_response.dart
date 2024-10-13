import 'package:hashed_system_task/network/response/response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_response.g.dart';

@JsonSerializable()
class MainResponse {
  MainResponse({
    required this.success,
    this.response});

  @JsonKey(name: 'response')
  ResponseData? response;
  @JsonKey(name: 'success')
  bool success;


  factory MainResponse.fromJson(Map<String, dynamic> json) =>
      _$MainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseToJson(this);
}