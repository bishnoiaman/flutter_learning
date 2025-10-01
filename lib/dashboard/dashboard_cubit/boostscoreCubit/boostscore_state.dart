part of 'boostscore_cubit.dart';

@immutable
sealed class BoostscoreState {}

final class BoostscoreInitial extends BoostscoreState {}

final class BoostscoreLoading extends BoostscoreState {}

final class BoostscoreLoaded extends BoostscoreState {

  final BoostScoreResponseModel boostScoreData;

  BoostscoreLoaded(this.boostScoreData);
}

final class BoostscoreError extends BoostscoreState {}
