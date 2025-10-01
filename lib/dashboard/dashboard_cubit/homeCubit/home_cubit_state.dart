part of 'home_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitLoaded extends HomeCubitState {
  final HomeResponseModel homeData;

  HomeCubitLoaded(this.homeData);

}

final class HomeCubitError extends HomeCubitState {}

