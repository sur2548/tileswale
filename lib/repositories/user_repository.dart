import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tileswale/core/constants/constants.dart';
import 'package:tileswale/core/providers/core_providers.dart';
import 'package:tileswale/models/modesl.dart';
import 'package:tileswale/repositories/auth_repositoy.dart';

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});

class UserRepository {
  UserRepository(this.ref);

  final Ref ref;

  User? getUser() {
    final preferences = ref.read(sharedPreferencesProvider);
    final authRepo = ref.read(authRepositoryProvider);

    if (!authRepo.isLoggedIn) return null;

    final name = preferences.getString(DBConstants.userName)!;
    final email = preferences.getString(DBConstants.userEmail)!;
    final password = preferences.getString(DBConstants.userPassword)!;

    return User(name: name, email: email, password: password);
  }
}
