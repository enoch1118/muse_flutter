part of 'chat_bloc.dart';

class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class OnSend extends ChatEvent {
  const OnSend(this.content);
  final Content content;
  @override
  List<Object> get props => [content];
}

class OnInit extends ChatEvent {
  final Content? initPrompt;
  const OnInit({this.initPrompt});
}
