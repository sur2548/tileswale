import 'package:auto_route/auto_route.dart';
import 'package:tileswale/screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthScreen, initial: true),
    AutoRoute(page: MainScreen),
  ],
)
class $AppRouter {}
