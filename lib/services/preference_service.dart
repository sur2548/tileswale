import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tileswale/models/modesl.dart';

class PreferenceService {
  static PreferenceService? _instance;
  static SharedPreferences? _prefs;

  final kIsLoggedIn = 'is-logged-in';

  final kUser = 'user';

  static Future<PreferenceService?> getInstance() async {
    _instance ??= PreferenceService();
    _prefs ??= await SharedPreferences.getInstance();
    return _instance;
  }

  Future logout() async {
    await _prefs!.remove(kIsLoggedIn);
  }

  Future setUser(User user) async {
    setLoginStatus(true);
    await _prefs!.setString(kUser, jsonEncode(user));
  }

  User? getUser() {
    if (!isLoggedIn) return null;

    final response = _prefs!.getString(kUser);

    if (response == null) return null;

    return User.fromJson(jsonDecode(response));
  }

  bool get isLoggedIn => _prefs!.getBool(kIsLoggedIn) ?? false;

  void setLoginStatus(bool status) => _prefs!.setBool(kIsLoggedIn, status);
}
