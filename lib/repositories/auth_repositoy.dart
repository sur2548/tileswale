import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tileswale/core/constants/constants.dart';
import 'package:tileswale/core/providers/core_providers.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);

  return AuthRepository(prefs);
});

class AuthRepository {
  AuthRepository(this.preferences);

  final SharedPreferences preferences;

  bool get isLoggedIn => preferences.getBool(DBConstants.loginStatus) ?? false;

  Future login(String name, String email, String password) async {
    await preferences.setString(DBConstants.userName, name);
    await preferences.setString(DBConstants.userEmail, email);
    await preferences.setString(DBConstants.userPassword, password);

    await preferences.setBool(DBConstants.loginStatus, true);
  }

  Future logout() async {
    await preferences.remove(DBConstants.userName);
    await preferences.remove(DBConstants.userEmail);
    await preferences.remove(DBConstants.userPassword);

    await preferences.remove(DBConstants.loginStatus);
  }
}
