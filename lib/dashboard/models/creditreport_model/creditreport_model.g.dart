// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditreport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditReportResponseModel _$CreditReportResponseModelFromJson(
  Map<String, dynamic> json,
) => CreditReportResponseModel(
  code: (json['code'] as num).toInt(),
  success: json['success'] as bool,
  message: json['message'] as String,
  data: CreditReportData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreditReportResponseModelToJson(
  CreditReportResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

CreditReportData _$CreditReportDataFromJson(Map<String, dynamic> json) =>
    CreditReportData(
      creditScoreCard: CreditScoreCardData.fromJson(
        json['creditScoreCard'] as Map<String, dynamic>,
      ),
      scoreFactors: (json['scoreFactors'] as List<dynamic>)
          .map((e) => ScoreFactorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountSummary: AccountSummaryData.fromJson(
        json['accountSummary'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CreditReportDataToJson(CreditReportData instance) =>
    <String, dynamic>{
      'creditScoreCard': instance.creditScoreCard,
      'scoreFactors': instance.scoreFactors,
      'accountSummary': instance.accountSummary,
    };

AccountSummaryData _$AccountSummaryDataFromJson(Map<String, dynamic> json) =>
    AccountSummaryData(
      totalAccounts: (json['totalAccounts'] as num).toInt(),
      totalCreditLimit: (json['totalCreditLimit'] as num).toDouble(),
      onTimePayments: (json['onTimePayments'] as num).toInt(),
    );

Map<String, dynamic> _$AccountSummaryDataToJson(AccountSummaryData instance) =>
    <String, dynamic>{
      'totalAccounts': instance.totalAccounts,
      'totalCreditLimit': instance.totalCreditLimit,
      'onTimePayments': instance.onTimePayments,
    };

ScoreFactorData _$ScoreFactorDataFromJson(Map<String, dynamic> json) =>
    ScoreFactorData(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      impactLabel: json['impactLabel'] as String,
      impactBgColor: json['impactBgColor'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ScoreFactorDataToJson(ScoreFactorData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'impactLabel': instance.impactLabel,
      'impactBgColor': instance.impactBgColor,
      'description': instance.description,
    };

CreditScoreCardData _$CreditScoreCardDataFromJson(Map<String, dynamic> json) =>
    CreditScoreCardData(
      cibilId: (json['cibilId'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      label: json['label'] as String,
      minScore: (json['minScore'] as num).toInt(),
      maxScore: (json['maxScore'] as num).toInt(),
      creditGenerationDate: json['creditGenerationDate'] as String,
      creditScoreDescription: json['creditScoreDescription'] as String,
      scoreChangeValue: json['scoreChangeValue'] as String,
      scoreChangeLabel: json['scoreChangeLabel'] as String,
      scoreChangeColor: json['scoreChangeColor'] as String,
      creditBureauLogo: json['creditBureauLogo'] as String,
    );

Map<String, dynamic> _$CreditScoreCardDataToJson(
  CreditScoreCardData instance,
) => <String, dynamic>{
  'cibilId': instance.cibilId,
  'score': instance.score,
  'label': instance.label,
  'minScore': instance.minScore,
  'maxScore': instance.maxScore,
  'creditGenerationDate': instance.creditGenerationDate,
  'creditScoreDescription': instance.creditScoreDescription,
  'scoreChangeValue': instance.scoreChangeValue,
  'scoreChangeLabel': instance.scoreChangeLabel,
  'scoreChangeColor': instance.scoreChangeColor,
  'creditBureauLogo': instance.creditBureauLogo,
};
