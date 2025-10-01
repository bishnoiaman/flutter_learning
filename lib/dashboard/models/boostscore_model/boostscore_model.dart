import 'package:json_annotation/json_annotation.dart';

part 'boostscore_model.g.dart';

@JsonSerializable()
class BoostScoreResponseModel {
  final int code;
  final bool success;
  final String message;
  final BoostScoreData data;

  BoostScoreResponseModel({required this.code, required this.success, required this.message, required this.data});

  factory BoostScoreResponseModel.fromJson(Map<String, dynamic> json) => _$BoostScoreResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoostScoreResponseModelToJson(this);
}

@JsonSerializable()
class BoostScoreData {
  final String helpfulArticlesTitle;
  final String totalPotentialGainValue;
  final String totalPotentialGainLabel;
  final List<BoostingStepData> boostingSteps;
  final int totalCompletedSteps;
  final String stepsTitle;
  final List<HelpfulArticlesData> helpfulArticles;
  final String currentTime;

  BoostScoreData({required this.helpfulArticlesTitle, required this.totalPotentialGainValue, required this.totalPotentialGainLabel, required this.boostingSteps, required this.totalCompletedSteps, required this.stepsTitle, required this.helpfulArticles, required this.currentTime});

  factory BoostScoreData.fromJson(Map<String, dynamic> json) => _$BoostScoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$BoostScoreDataToJson(this);


}



@JsonSerializable()
class BoostingStepData {
  final int id;
  final String type;
  final String title;
  final String impactLabel;
  final String impactBgColor;
  final String shortDescription;
  final String potentialGainValue;
  final String fullDescription;
  final String thumbnailUrl;
  final String videoUrl;
  final int currentDateTime;
  final int unlockDateTime;
  final bool isCompleted;

  BoostingStepData({required this.id, required this.type, required this.title, required this.impactLabel, required this.impactBgColor, required this.shortDescription, required this.potentialGainValue, required this.fullDescription, required this.thumbnailUrl, required this.videoUrl, required this.currentDateTime, required this.unlockDateTime, required this.isCompleted});

  factory BoostingStepData.fromJson(Map<String, dynamic> json) => _$BoostingStepDataFromJson(json);

  Map<String, dynamic> toJson() => _$BoostingStepDataToJson(this);

}



@JsonSerializable()
class HelpfulArticlesData {
  final String title;
  final String shortDescription;
  final String fullDescription;

  HelpfulArticlesData({required this.title, required this.shortDescription, required this.fullDescription});

  factory HelpfulArticlesData.fromJson(Map<String, dynamic> json) => _$HelpfulArticlesDataFromJson(json);

  Map<String, dynamic> toJson() => _$HelpfulArticlesDataToJson(this);

}