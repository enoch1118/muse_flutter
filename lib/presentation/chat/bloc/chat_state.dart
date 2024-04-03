part of 'chat_bloc.dart';

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState.init() = Init;

  const factory ChatState.loaded(List<Content> contents) = Loaded;

  const factory ChatState.loading(List<Content> contents) = Loading;
}
