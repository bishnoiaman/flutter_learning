
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreup_cubit/auth/authmodel/auth_response.dart';
import 'package:scoreup_cubit/data/api_service.dart';
import 'package:scoreup_cubit/resources/url/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //! Tight coupling, breaking S of SOLID principle
  // We should always inject them and not create a new object.
  final ApiService _apiService = ApiService();

  Future<void> login(String mobileNumber) async {
    emit(AuthLoading());

    try {
      final response = await _apiService.postRequest(
        AppUrl.initiateOtpUrl,
        data: {'mobile_no': mobileNumber},
      );
      if (response.statusCode == 200) {
        emit(OtpSent(mobileNumber));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> verifyOtp(String mobileNumber, String otp) async {
    emit(AuthLoading());

    try {
      final response = await _apiService.postRequest(
        AppUrl.verifyOtpUrl,
        data: {'mobile_no': mobileNumber, 'otp': otp},
      );

      final authResponse = AuthResponse.fromJson(response.data);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', authResponse.data.token);
      await prefs.setBool('isLoggedIn', true);
      debugPrint(response.data.toString());

      // Save accessToken to secure storage and then navigate to home page
      if (response.statusCode == 200) {
        emit(Authenticated());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  Future<void> logout()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    emit(AuthInitial());
  }
}
