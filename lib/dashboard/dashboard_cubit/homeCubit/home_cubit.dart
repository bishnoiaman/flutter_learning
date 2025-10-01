import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoreup_cubit/dashboard/models/home_model/home_model.dart';
import 'package:scoreup_cubit/data/api_service.dart';
import 'package:scoreup_cubit/resources/url/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  // final ApiService _apiService = GetIt.instance<ApiService>();
  final ApiService _apiService = ApiService();

  Future<void> fetchData() async {
    emit(HomeCubitLoading());

    final prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString('token');
    debugPrint(userToken.toString());

    try {
      final response = await _apiService.postRequest(
        AppUrl.dashboardHomeUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
            'platform': 'application',
            'authorization': 'Bearer $userToken',
          },
        ),
      );
      // debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        final homeDetail = HomeResponseModel.fromJson(response.data);
        emit(HomeCubitLoaded(homeDetail));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
