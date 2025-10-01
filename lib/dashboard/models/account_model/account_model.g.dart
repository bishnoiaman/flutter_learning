// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetailModel _$AccountDetailModelFromJson(Map<String, dynamic> json) =>
    AccountDetailModel(
      code: (json['code'] as num).toInt(),
      success: json['success'] as bool,
      message: json['message'] as String,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountDetailModelToJson(AccountDetailModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  isCertificateAvailable: json['isCertificateAvailable'] as bool,
  userDetail: UserDetail.fromJson(json['userDetail'] as Map<String, dynamic>),
  subscription: SubscriptionData.fromJson(
    json['subscription'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'isCertificateAvailable': instance.isCertificateAvailable,
  'userDetail': instance.userDetail,
  'subscription': instance.subscription,
};

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
  customerId: (json['customerId'] as num).toInt(),
  fullName: json['fullName'] as String,
  email: json['email'] as String,
  mobileNo: json['mobileNo'] as String,
);

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
    };

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) =>
    SubscriptionData(
      title: json['title'] as String,
      amount: json['amount'] as String,
      status: json['status'] as String,
      statusColor: json['statusColor'] as String,
      startDate: json['startDate'] as String,
      expiryDate: json['expiryDate'] as String,
    );

Map<String, dynamic> _$SubscriptionDataToJson(SubscriptionData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'amount': instance.amount,
      'status': instance.status,
      'statusColor': instance.statusColor,
      'startDate': instance.startDate,
      'expiryDate': instance.expiryDate,
    };
