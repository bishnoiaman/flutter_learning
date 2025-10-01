// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    HomeResponseModel(
      code: (json['code'] as num).toInt(),
      success: json['success'] as bool,
      message: json['message'] as String,
      data: HomeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
  paymentStatus: json['paymentStatus'] as String,
  creditScoreCard: CreditScoreCardData.fromJson(
    json['creditScoreCard'] as Map<String, dynamic>,
  ),
  quickActionsTitle: json['quickActionsTitle'] as String,
  quickActions: (json['quickActions'] as List<dynamic>)
      .map((e) => QuickActionData.fromJson(e as Map<String, dynamic>))
      .toList(),
  videoGuide: VideoGuideData.fromJson(
    json['videoGuide'] as Map<String, dynamic>,
  ),
  successStories: (json['successStories'] as List<dynamic>)
      .map((e) => SuccessStoriesData.fromJson(e as Map<String, dynamic>))
      .toList(),
  creditTips: (json['creditTips'] as List<dynamic>)
      .map((e) => CreditTipsData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
  'paymentStatus': instance.paymentStatus,
  'creditScoreCard': instance.creditScoreCard,
  'quickActionsTitle': instance.quickActionsTitle,
  'quickActions': instance.quickActions,
  'videoGuide': instance.videoGuide,
  'successStories': instance.successStories,
  'creditTips': instance.creditTips,
};

CreditTipsData _$CreditTipsDataFromJson(Map<String, dynamic> json) =>
    CreditTipsData(
      icon: json['icon'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreditTipsDataToJson(CreditTipsData instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'description': instance.description,
    };

SuccessStoriesData _$SuccessStoriesDataFromJson(Map<String, dynamic> json) =>
    SuccessStoriesData(
      name: json['name'] as String,
      image: json['image'] as String,
      quote: json['quote'] as String,
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$SuccessStoriesDataToJson(SuccessStoriesData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'quote': instance.quote,
      'rating': instance.rating,
    };

VideoGuideData _$VideoGuideDataFromJson(Map<String, dynamic> json) =>
    VideoGuideData(
      thumbnailUrl: json['thumbnailUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      videoUrl: json['videoUrl'] as String,
    );

Map<String, dynamic> _$VideoGuideDataToJson(VideoGuideData instance) =>
    <String, dynamic>{
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
    };

QuickActionData _$QuickActionDataFromJson(Map<String, dynamic> json) =>
    QuickActionData(
      icon: json['icon'] as String,
      label: json['label'] as String,
      backgroundColor: json['backgroundColor'] as String,
      iconColor: json['iconColor'] as String,
      tabIndex: (json['tabIndex'] as num).toInt(),
    );

Map<String, dynamic> _$QuickActionDataToJson(QuickActionData instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'label': instance.label,
      'backgroundColor': instance.backgroundColor,
      'iconColor': instance.iconColor,
      'tabIndex': instance.tabIndex,
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
      creditBureauLogo: json['creditBureauLogo'] as String,
      scoreChangeValue: json['scoreChangeValue'] as String,
      scoreChangeLabel: json['scoreChangeLabel'] as String,
      scoreChangeColor: json['scoreChangeColor'] as String,
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
  'creditBureauLogo': instance.creditBureauLogo,
  'scoreChangeValue': instance.scoreChangeValue,
  'scoreChangeLabel': instance.scoreChangeLabel,
  'scoreChangeColor': instance.scoreChangeColor,
};
