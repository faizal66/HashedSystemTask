// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInBody _$SignInBodyFromJson(Map<String, dynamic> json) => SignInBody(
      email: json['email'] as String?,
      password: json['password'] as String?,
      device_id: json['device_id'] as String?,
    );

Map<String, dynamic> _$SignInBodyToJson(SignInBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'device_id': instance.device_id,
    };
