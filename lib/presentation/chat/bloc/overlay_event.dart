part of 'overlay_bloc.dart';

class OverlayEvent extends Equatable {
  const OverlayEvent();

  @override
  List<Object> get props => [];
}

class ToChat extends OverlayEvent {}

class Sending extends OverlayEvent {
  final Content content;
  const Sending(this.content);
}

class HasFocus extends OverlayEvent {}

class NoFocus extends OverlayEvent {}

class PopToHome extends OverlayEvent {}

class OnLoaded extends OverlayEvent {}
