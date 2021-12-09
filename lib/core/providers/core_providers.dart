import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tileswale/core/constants/constants.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(baseUrl: Environment.kBaseURL),
  );
});
