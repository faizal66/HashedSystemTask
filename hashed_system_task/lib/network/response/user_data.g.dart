// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      logo: json['logo'] as String?,
      occupation: json['occupation'] as String?,
      province: json['province'] == null
          ? null
          : Province.fromJson(json['province'] as Map<String, dynamic>),
      email: json['email'] as String?,
      claimReward: json['claimReward'] as bool?,
      referelCode: json['referelCode'] as String?,
      reward: (json['reward'] as num?)?.toDouble(),
      gift: (json['gift'] as num?)?.toInt(),
      role: json['role'] as String?,
      totalInvite: (json['totalInvite'] as num?)?.toInt(),
      isReferenceUsed: json['isReferenceUsed'] as bool?,
      firstTimeLogin: json['firstTimeLogin'] as bool?,
      uploadVideo: json['uploadVideo'] as bool?,
      isRating: json['isRating'] as bool?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'logo': instance.logo,
      'occupation': instance.occupation,
      'province': instance.province,
      'email': instance.email,
      'claimReward': instance.claimReward,
      'referelCode': instance.referelCode,
      'reward': instance.reward,
      'gift': instance.gift,
      'role': instance.role,
      'totalInvite': instance.totalInvite,
      'isReferenceUsed': instance.isReferenceUsed,
      'firstTimeLogin': instance.firstTimeLogin,
      'uploadVideo': instance.uploadVideo,
      'isRating': instance.isRating,
    };
