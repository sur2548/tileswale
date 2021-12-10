import 'package:auto_route/auto_route.dart';
import 'package:tileswale/screens/screens.dart';

// part 'app_router.gr.dart'

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    MaterialRoute(page: AuthScreen, initial: true),
    MaterialRoute(page: MainScreen),
  ],
)
class $Router {}
