part of 'overlay_bloc.dart';

class OverlayEvent extends Equatable {
  const OverlayEvent();

  @override
  List<Object> get props => [];
}

class ToChat extends OverlayEvent {}

class HasFocus extends OverlayEvent {}

class PopToHome extends OverlayEvent {}
