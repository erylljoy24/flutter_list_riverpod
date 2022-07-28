import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_list_riverpod/model/movie_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserNotifier extends StateNotifier<MovieState> {
  UserNotifier() : super(const MovieState());
  final Dio dio = Dio();

  Future<void> fetchUsers() async {
    final response = await dio.get(
      'https://mocki.io/v1/1aa7c7e4-fe26-4cbf-ba4e-5dd87f429545',
    );
    print('_printMovies ${response}');
    final List list = response.data['movies'];
    List<Movie> users = list.map((e) => Movie.fromJson(e)).toList();
    state = state.copyWith(users: users);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, MovieState>((ref) => UserNotifier(),
);