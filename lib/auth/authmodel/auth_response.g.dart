// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  code: (json['code'] as num).toInt(),
  success: json['success'] as bool,
  message: json['message'] as String,
  data: AuthData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
  customerId: (json['customerId'] as num).toInt(),
  token: json['token'] as String,
  isProfileVerified: json['isProfileVerified'] as bool,
  isSubscriptionActive: json['isSubscriptionActive'] as bool,
);

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
  'customerId': instance.customerId,
  'token': instance.token,
  'isProfileVerified': instance.isProfileVerified,
  'isSubscriptionActive': instance.isSubscriptionActive,
};
