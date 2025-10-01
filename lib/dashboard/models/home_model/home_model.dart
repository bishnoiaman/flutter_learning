import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeResponseModel {
  final int code;
  final bool success;
  final String message;
  final HomeData data;

  HomeResponseModel({required this.code, required this.success, required this.message, required this.data});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) => _$HomeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseModelToJson(this);
}

@JsonSerializable()
class HomeData {
  final String paymentStatus;
  final CreditScoreCardData creditScoreCard;
  final String quickActionsTitle;
  final List<QuickActionData> quickActions;
  final VideoGuideData videoGuide;
  final List<SuccessStoriesData> successStories;
  final List<CreditTipsData> creditTips;

  HomeData({required this.paymentStatus, required this.creditScoreCard, required this.quickActionsTitle, required this.quickActions, required this.videoGuide, required this.successStories, required this.creditTips});

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

}

@JsonSerializable()
class CreditTipsData {
  final String icon;
  final String title;
  final String description;

  CreditTipsData({required this.icon, required this.title, required this.description});

  factory CreditTipsData.fromJson(Map<String, dynamic> json) => _$CreditTipsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreditTipsDataToJson(this);
}


@JsonSerializable()
class SuccessStoriesData {
  final String name;
  final String image;
  final String quote;
  final int rating;

  SuccessStoriesData({required this.name, required this.image, required this.quote, required this.rating});

  factory SuccessStoriesData.fromJson(Map<String, dynamic> json) => _$SuccessStoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessStoriesDataToJson(this);
}

@JsonSerializable()
class VideoGuideData {
  final String thumbnailUrl;
  final String title;
  final String description;
  final String videoUrl;

  VideoGuideData({required this.thumbnailUrl, required this.title, required this.description, required this.videoUrl});

  factory VideoGuideData.fromJson(Map<String, dynamic> json) => _$VideoGuideDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoGuideDataToJson(this);
}

@JsonSerializable()
class QuickActionData {
  final String icon;
  final String label;
  final String backgroundColor;
  final String iconColor;
  final int tabIndex;

  QuickActionData({required this.icon, required this.label, required this.backgroundColor, required this.iconColor, required this.tabIndex});

  factory QuickActionData.fromJson(Map<String, dynamic> json) => _$QuickActionDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuickActionDataToJson(this);


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
  final String creditBureauLogo;
  final String scoreChangeValue;
  final String scoreChangeLabel;
  final String scoreChangeColor;

  CreditScoreCardData({required this.cibilId, required this.score, required this.label, required this.minScore, required this.maxScore, required this.creditGenerationDate, required this.creditScoreDescription, required this.creditBureauLogo, required this.scoreChangeValue, required this.scoreChangeLabel, required this.scoreChangeColor});

  factory CreditScoreCardData.fromJson(Map<String, dynamic> json) => _$CreditScoreCardDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreditScoreCardDataToJson(this);
}