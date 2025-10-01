// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  AuthResponse({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  int code;
  bool success;
  String message;
  AuthData data;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AuthData {
  AuthData({
    required this.customerId,
    required this.token,
    required this.isProfileVerified,
    required this.isSubscriptionActive,
  });

  int customerId;
  String token;
  bool isProfileVerified;
  bool isSubscriptionActive;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
