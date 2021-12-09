import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'get.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupGet();

    final sharedPreferences = await SharedPreferences.getInstance();

    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: App(),
      ),
    );
  } catch (error) {
    debugPrint(error.toString());
  }
}
