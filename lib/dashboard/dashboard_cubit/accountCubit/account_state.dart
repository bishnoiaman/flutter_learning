part of 'account_cubit.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}
final class AccountLoading extends AccountState {}
final class AccountLoaded extends AccountState {

  final AccountDetailModel accountData;

  AccountLoaded(this.accountData);
}
final class AccountError extends AccountState {}
