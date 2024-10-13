
import 'package:hashed_system_task/network/response/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  UserData({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.logo,
    this.occupation,
    this.province,
    this.email,
    this.claimReward,
    this.referelCode,
    this.reward,
    this.gift,
    this.role,
    this.totalInvite,
    this.isReferenceUsed,
    this.firstTimeLogin,
    this.uploadVideo,
    this.isRating,
  });

  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'fullName')
  String? fullName;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'logo')
  String? logo;
  @JsonKey(name: 'occupation')
  String? occupation;
  @JsonKey(name: 'province')
  Province? province;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'claimReward')
  bool? claimReward;
  @JsonKey(name: 'referelCode')
  String? referelCode;
  @JsonKey(name: 'reward')
  double? reward;
  @JsonKey(name: 'gift')
  int? gift;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'totalInvite')
  int? totalInvite;
  @JsonKey(name: 'isReferenceUsed')
  bool? isReferenceUsed;
  @JsonKey(name: 'firstTimeLogin')
  bool? firstTimeLogin;
  @JsonKey(name: 'uploadVideo')
  bool? uploadVideo;
  @JsonKey(name: 'isRating')
  bool? isRating;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
