import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_list_riverpod/model/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState());
  final Dio dio = Dio();

  Future<void> fetchUsers() async {
    final response = await dio.get(
      'https://reqres.in/api/users?page=2',
    );
    print('_printResponse ${response.data['data']}');
    final List list = response.data['data'];
    state = state.copyWith();
  }
}

final userProvider = StateNotifierProvider.autoDispose
<UserNotifier, UserState>(
      (ref) => UserNotifier(),
);