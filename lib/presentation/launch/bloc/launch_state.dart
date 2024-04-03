part of 'launch_bloc.dart';

@freezed
sealed class LaunchState with _$LaunchState {
  const factory LaunchState.init() = Init;

  const factory LaunchState.loading() = Loading;

  const factory LaunchState.needOnboarding() = NeedOnBoarding;

  const factory LaunchState.needHome() = NeedHome;

  const factory LaunchState.geminiError() = GeminiError;
}
