part of 'credit_report_cubit.dart';

@immutable
sealed class CreditReportState {}

final class CreditReportInitial extends CreditReportState {}

final class CreditReportLoading extends CreditReportState {}

final class CreditReportLoaded extends CreditReportState {
  final CreditReportResponseModel creditReportData;

  CreditReportLoaded(this.creditReportData);
}

final class CreditReportError extends CreditReportState {}
