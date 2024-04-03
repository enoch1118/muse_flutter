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
    on<OnLoaded>(_onLoaded);
    on<Sending>(_sending);
    on<NoFocus>(_noFocus);
  }
  Future _noFocus(NoFocus event, Emitter emit) async {
    emit(AtChat(Content.text("")));
  }

  Future _sending(Sending event, Emitter emit) async {
    emit(Loading(event.content));
  }

  Future _onLoaded(OnLoaded event, Emitter emit) async {
    emit(AtChat(Content.text("")));
  }

  Future _hasFocus(HasFocus event, Emitter emit) async {
    emit(AtChatWriting(Content.text("")));
  }

  Future _toChat(ToChat event, Emitter emit) async {
    emit(Loading(Content.text("")));
  }

  Future _popToHome(PopToHome event, Emitter emit) async {
    emit(AtHome(Content.text("")));
  }
}
