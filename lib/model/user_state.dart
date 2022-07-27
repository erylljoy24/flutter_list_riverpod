import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';


@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(0) int id,
    @Default('') String email,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String imageUrl,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) => _$UserStateFromJson(json);
}