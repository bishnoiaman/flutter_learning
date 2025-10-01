import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountDetailModel {
  final int code;
  final bool success;
  final String message;
  final UserData data;

  AccountDetailModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory AccountDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDetailModelToJson(this);
}

@JsonSerializable()
class UserData {
  final bool isCertificateAvailable;
  final UserDetail userDetail;
  final SubscriptionData subscription; 

  UserData({
    required this.isCertificateAvailable,
    required this.userDetail,
    required this.subscription,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}


@JsonSerializable()
class UserDetail {
  final int customerId;
  final String fullName;
  final String email;
  final String mobileNo;

  UserDetail({
    required this.customerId,
    required this.fullName,
    required this.email,
    required this.mobileNo,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}


@JsonSerializable()
class SubscriptionData {
  final String title;
  final String amount;
  final String status;
  final String statusColor;
  final String startDate;
  final String expiryDate;

  SubscriptionData({required this.title, required this.amount, required this.status, required this.statusColor, required this.startDate, required this.expiryDate});

  factory SubscriptionData.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDataFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionDataToJson(this);
}