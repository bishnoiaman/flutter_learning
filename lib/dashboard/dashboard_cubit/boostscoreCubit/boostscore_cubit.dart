import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoreup_cubit/dashboard/models/boostscore_model/boostscore_model.dart';
import 'package:scoreup_cubit/data/api_service.dart';
import 'package:scoreup_cubit/resources/url/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'boostscore_state.dart';

class BoostscoreCubit extends Cubit<BoostscoreState> {
  BoostscoreCubit() : super(BoostscoreInitial());

  final ApiService _apiService = ApiService(); 

 

  Future<void> fetchData() async {
    emit(BoostscoreLoading());

    final prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString('token');
    debugPrint(userToken.toString()); 

    try {
      final response = await _apiService.postRequest(
        AppUrl.dashboardBoostScoreUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
            'platform': 'application',
            'authorization': 'Bearer $userToken',
          },
        ),
      );

      if(response.statusCode == 200){
        final boostscoreDetail = BoostScoreResponseModel.fromJson(response.data);
      debugPrint(response.data.toString());
        emit(BoostscoreLoaded(boostscoreDetail));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
