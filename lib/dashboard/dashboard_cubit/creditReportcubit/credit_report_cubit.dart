import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoreup_cubit/dashboard/models/creditreport_model/creditreport_model.dart';
import 'package:scoreup_cubit/data/api_service.dart';
import 'package:scoreup_cubit/resources/url/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'credit_report_state.dart';

class CreditReportCubit extends Cubit<CreditReportState> {
  CreditReportCubit() : super(CreditReportInitial());

  final ApiService _apiService = ApiService();

  Future<void> fetchData() async {
    emit(CreditReportLoading());

    final prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString('token');
    debugPrint(userToken.toString());

    try {
      final response = await _apiService.postRequest(
        AppUrl.dashboardCreditReportUrl,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
            'platform': 'application',
            'authorization': 'Bearer $userToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        final creditReportDetail = CreditReportResponseModel.fromJson(response.data);
        debugPrint(response.data.toString());
        emit(CreditReportLoaded(creditReportDetail));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
