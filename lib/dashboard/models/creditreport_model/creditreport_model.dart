import 'package:json_annotation/json_annotation.dart';

part 'creditreport_model.g.dart';

@JsonSerializable()
class CreditReportResponseModel {
  final int code;
  final bool success;
  final String message;
  final CreditReportData data;

  CreditReportResponseModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory CreditReportResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreditReportResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditReportResponseModelToJson(this);
}

@JsonSerializable()
class CreditReportData {
  final CreditScoreCardData creditScoreCard;
  final List<ScoreFactorData> scoreFactors;
  final AccountSummaryData accountSummary;

  CreditReportData({
    required this.creditScoreCard,
    required this.scoreFactors,
    required this.accountSummary,
  });

  factory CreditReportData.fromJson(Map<String, dynamic> json) =>
      _$CreditReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreditReportDataToJson(this);
}

@JsonSerializable()
class AccountSummaryData {
  final int totalAccounts;
  final double totalCreditLimit;
  final int onTimePayments;

  AccountSummaryData({
    required this.totalAccounts,
    required this.totalCreditLimit,
    required this.onTimePayments,
  });

  factory AccountSummaryData.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSummaryDataToJson(this);
}

@JsonSerializable()
class ScoreFactorData {
  final int id;
  final String title;
  final String impactLabel;
  final String impactBgColor;
  final String description;

  ScoreFactorData({
    required this.id,
    required this.title,
    required this.impactLabel,
    required this.impactBgColor,
    required this.description,
  });

  factory ScoreFactorData.fromJson(Map<String, dynamic> json) =>
      _$ScoreFactorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ScoreFactorDataToJson(this);
}

@JsonSerializable()
class CreditScoreCardData {
  final int cibilId;
  final int score;
  final String label;
  final int minScore;
  final int maxScore;
  final String creditGenerationDate;
  final String creditScoreDescription;
  final String scoreChangeValue;
  final String scoreChangeLabel;
  final String scoreChangeColor;
  final String creditBureauLogo;

  CreditScoreCardData({
    required this.cibilId,
    required this.score,
    required this.label,
    required this.minScore,
    required this.maxScore,
    required this.creditGenerationDate,
    required this.creditScoreDescription,
    required this.scoreChangeValue,
    required this.scoreChangeLabel,
    required this.scoreChangeColor,
    required this.creditBureauLogo,
  });

  factory CreditScoreCardData.fromJson(Map<String, dynamic> json) =>
      _$CreditScoreCardDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreditScoreCardDataToJson(this);
}
