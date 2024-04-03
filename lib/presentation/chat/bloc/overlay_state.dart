part of 'overlay_bloc.dart';

@freezed
sealed class OverlayState with _$OverlayState {
  const factory OverlayState.init() = Init;

  const factory OverlayState.atHome(Content content) = AtHome;

  const factory OverlayState.atChat(Content content) = AtChat;

  const factory OverlayState.atChatWriting(Content content) = AtChatWriting;

  const factory OverlayState.loading(Content content) = Loading;

  const factory OverlayState.error(Content content) = Error;
}
