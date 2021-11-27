import 'package:auto_route/auto_route.dart';
import 'package:tileswale/screens/screens.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: AuthScreen, initial: true),
    MaterialRoute(page: MainScreen),
  ],
)
class $Router {}
