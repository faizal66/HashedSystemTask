// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponse _$MainResponseFromJson(Map<String, dynamic> json) => MainResponse(
      success: json['success'] as bool,
      response: json['response'] == null
          ? null
          : ResponseData.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainResponseToJson(MainResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'success': instance.success,
    };
