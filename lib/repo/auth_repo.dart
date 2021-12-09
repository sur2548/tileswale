import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tileswale/models/modesl.dart';

import '../main.dart';

final authProvider = Provider((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);

  return AuthRepo(preferences: preferences);
});

class AuthRepo {
  AuthRepo({required this.preferences});

  final SharedPreferences preferences;

  final _kUserKey = 'user';
  final _kLoginKey = 'is_logged_in';

  Future<bool> login(String email, String password) async {
    final json = preferences.getString(_kUserKey);

    if (json == null) return false;

    final user = User.fromJson(jsonDecode(json));

    if (user.email != email && user.password != password) {
      return false;
    }

    await preferences.setBool(_kLoginKey, true);

    return true;
  }

  Future<bool> register(Map<String, dynamic> data) async {
    await preferences.setString(_kUserKey, jsonEncode(data));
    await preferences.setBool(_kLoginKey, true);

    return true;
  }

  Future<void> logout() async {
    await preferences.remove(_kUserKey);
    await preferences.remove(_kLoginKey);
  }
}

abstract class LoadingState {}

class Loading extends LoadingState {}

class Idle extends LoadingState {}

class LoadingCompleted extends LoadingState {}

class AuthStateNotifier extends StateNotifier<LoadingState> {
  AuthStateNotifier(LoadingState state) : super(Idle());

  void login() {
    state = Loading();
  }
}
