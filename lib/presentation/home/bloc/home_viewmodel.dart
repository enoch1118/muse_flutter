import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_viewmodel.freezed.dart';

@freezed
class HomeViewmodel with _$HomeViewmodel {
  const factory HomeViewmodel({
    required List<String> questions,
  }) = _HomeViewmodel;
  const HomeViewmodel._();
}
