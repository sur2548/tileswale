import 'package:flutter/material.dart';

import 'app.dart';
import 'get.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await setupGet();

    runApp(App());
  } catch (error) {
    debugPrint(error.toString());
  }
}
