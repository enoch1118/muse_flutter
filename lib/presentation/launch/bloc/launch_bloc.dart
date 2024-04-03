import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:muse_flutter/core/provider/greeting_provider.dart';
import 'package:muse_flutter/domain/usecase/gemini_usecase.dart';
import 'package:muse_flutter/domain/usecase/system_usecase.dart';

part 'launch_bloc.freezed.dart';
part 'launch_event.dart';
part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final SystemUsecase system = GetIt.I.get();
  final GeminiUsecase gemini = GetIt.I.get();
  final GreetingProvider prv = GetIt.I.get();
  LaunchBloc() : super(const LaunchState.init()) {
    on<OnLaunch>(_onLaunch);
  }
  Future _onLaunch(OnLaunch event, Emitter emit) async {
    final isFirst = await system.getFirstLaunch();
    final greeting = await gemini.getGreeting();
    if (greeting == null) {
      emit(const GeminiError());
      return;
    }
    prv.text = greeting;

    if (isFirst) {
      await system.setFirstLaunch();
      emit(const NeedOnBoarding());
      return;
    }
    emit(const NeedHome());
  }
}
