import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:muse_flutter/core/logger.dart';
import 'package:muse_flutter/domain/usecase/gemini_usecase.dart';
import 'package:muse_flutter/presentation/home/bloc/home_viewmodel.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final gemini = GetIt.I.get<GeminiUsecase>();
  HomeBloc() : super(const HomeState.init()) {
    on<OnInit>(_onInit);
  }

  Future _onInit(OnInit event, Emitter emit) async {
    try {
      final res = await gemini.getIntro();
      emit(ReadyToAsk(HomeViewmodel(questions: res)));
    } on Error catch (_) {
      XLog.red("init error ${_.stackTrace}", name: "home");
      emit(const ErrorInit());
    }
  }
}
