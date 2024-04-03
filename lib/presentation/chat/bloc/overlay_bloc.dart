import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'overlay_bloc.freezed.dart';
part 'overlay_event.dart';
part 'overlay_state.dart';

class OverlayBloc extends Bloc<OverlayEvent, OverlayState> {
  OverlayBloc() : super(const OverlayState.init()) {
    on<ToChat>(_toChat);
    on<PopToHome>(_popToHome);
    on<HasFocus>(_hasFocus);
  }
  Future _hasFocus(HasFocus event, Emitter emit) async {
    emit(AtChatWriting(Content.text("")));
  }

  Future _toChat(ToChat event, Emitter emit) async {
    emit(Loading(Content.text("")));
    await Future.delayed(Duration(seconds: 2));
    emit(AtChat(Content.text("")));
  }

  Future _popToHome(PopToHome event, Emitter emit) async {
    emit(AtHome(Content.text("")));
  }
}
