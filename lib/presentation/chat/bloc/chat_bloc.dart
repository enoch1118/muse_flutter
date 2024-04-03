import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:muse_flutter/domain/usecase/gemini_usecase.dart';
import 'package:muse_flutter/presentation/chat/util/content_extension.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final gemini = GetIt.I.get<GeminiUsecase>();
  ChatBloc() : super(const ChatState.init()) {
    on<OnSend>(_onSend);
    on<OnInit>(_onInit);
  }
  Future _onInit(OnInit event, Emitter emit) async {
    if (event.initPrompt != null) {
      emit(Loading([event.initPrompt!]));
      await _chat([event.initPrompt!], emit);
    }
  }

  Future _chat(List<Content> contents, Emitter emit) async {
    final stream = gemini.chat(contents);
    List<Content> newContent = [...contents, Content.model([])];
    await for (var event in stream) {
      Content last = newContent.removeLast();
      last = last.combineParts(event);
      newContent = [...newContent, last];
      emit(Loading(newContent));
    }
    emit(Loaded(newContent));
  }

  Future _onSend(OnSend event, Emitter emit) async {
    switch (state) {
      case Loaded(:final contents):
        final con = [...contents, event.content];
        emit(Loading(con));
        await _chat(con, emit);
        break;
      default:
    }
  }
}
