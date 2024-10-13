
import 'package:json_annotation/json_annotation.dart';

part'sign_in_body.g.dart';

@JsonSerializable()
class SignInBody{
  SignInBody({
    this.email,
    this.password,
    this.device_id
  });
  String? email;
  String? password;
  String? device_id;

  factory SignInBody.fromJson(Map<String, dynamic> json) => _$SignInBodyFromJson(json);
  Map<String, dynamic> toJson() => _$SignInBodyToJson(this);
}