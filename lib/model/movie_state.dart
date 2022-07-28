import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_state.freezed.dart';
part 'movie_state.g.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default([]) List<Movie> users,
  }) = _MovieState;

  const MovieState._();
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String year,
    @Default('') String director,
    @Default('') String posterUrl,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}