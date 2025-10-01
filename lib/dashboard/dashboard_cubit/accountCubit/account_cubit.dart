import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoreup_cubit/dashboard/models/account_model/account_model.dart';
import 'package:scoreup_cubit/data/api_service.dart';
import 'package:scoreup_cubit/resources/url/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());


  final ApiService _apiService = ApiService(); 

 

  Future<void> fetchData() async {
    emit(AccountLoading());

    final prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString('token');
    debugPrint(userToken.toString());


    try {
      final response = await _apiService.postRequest(
        AppUrl.dashboardAccountUrl,
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
        final accountDetail = AccountDetailModel.fromJson(response.data);
      debugPrint(response.data.toString());
        emit(AccountLoaded(accountDetail));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
