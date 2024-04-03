part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.init() = Init;

  const factory HomeState.errorInit() = ErrorInit;

  const factory HomeState.readyToAsk(HomeViewmodel vm) = ReadyToAsk;
}
