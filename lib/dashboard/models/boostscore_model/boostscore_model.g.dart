// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boostscore_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoostScoreResponseModel _$BoostScoreResponseModelFromJson(
  Map<String, dynamic> json,
) => BoostScoreResponseModel(
  code: (json['code'] as num).toInt(),
  success: json['success'] as bool,
  message: json['message'] as String,
  data: BoostScoreData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BoostScoreResponseModelToJson(
  BoostScoreResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

BoostScoreData _$BoostScoreDataFromJson(Map<String, dynamic> json) =>
    BoostScoreData(
      helpfulArticlesTitle: json['helpfulArticlesTitle'] as String,
      totalPotentialGainValue: json['totalPotentialGainValue'] as String,
      totalPotentialGainLabel: json['totalPotentialGainLabel'] as String,
      boostingSteps: (json['boostingSteps'] as List<dynamic>)
          .map((e) => BoostingStepData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCompletedSteps: (json['totalCompletedSteps'] as num).toInt(),
      stepsTitle: json['stepsTitle'] as String,
      helpfulArticles: (json['helpfulArticles'] as List<dynamic>)
          .map((e) => HelpfulArticlesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentTime: json['currentTime'] as String,
    );

Map<String, dynamic> _$BoostScoreDataToJson(BoostScoreData instance) =>
    <String, dynamic>{
      'helpfulArticlesTitle': instance.helpfulArticlesTitle,
      'totalPotentialGainValue': instance.totalPotentialGainValue,
      'totalPotentialGainLabel': instance.totalPotentialGainLabel,
      'boostingSteps': instance.boostingSteps,
      'totalCompletedSteps': instance.totalCompletedSteps,
      'stepsTitle': instance.stepsTitle,
      'helpfulArticles': instance.helpfulArticles,
      'currentTime': instance.currentTime,
    };

BoostingStepData _$BoostingStepDataFromJson(Map<String, dynamic> json) =>
    BoostingStepData(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      impactLabel: json['impactLabel'] as String,
      impactBgColor: json['impactBgColor'] as String,
      shortDescription: json['shortDescription'] as String,
      potentialGainValue: json['potentialGainValue'] as String,
      fullDescription: json['fullDescription'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      videoUrl: json['videoUrl'] as String,
      currentDateTime: (json['currentDateTime'] as num).toInt(),
      unlockDateTime: (json['unlockDateTime'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$BoostingStepDataToJson(BoostingStepData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'impactLabel': instance.impactLabel,
      'impactBgColor': instance.impactBgColor,
      'shortDescription': instance.shortDescription,
      'potentialGainValue': instance.potentialGainValue,
      'fullDescription': instance.fullDescription,
      'thumbnailUrl': instance.thumbnailUrl,
      'videoUrl': instance.videoUrl,
      'currentDateTime': instance.currentDateTime,
      'unlockDateTime': instance.unlockDateTime,
      'isCompleted': instance.isCompleted,
    };

HelpfulArticlesData _$HelpfulArticlesDataFromJson(Map<String, dynamic> json) =>
    HelpfulArticlesData(
      title: json['title'] as String,
      shortDescription: json['shortDescription'] as String,
      fullDescription: json['fullDescription'] as String,
    );

Map<String, dynamic> _$HelpfulArticlesDataToJson(
  HelpfulArticlesData instance,
) => <String, dynamic>{
  'title': instance.title,
  'shortDescription': instance.shortDescription,
  'fullDescription': instance.fullDescription,
};
