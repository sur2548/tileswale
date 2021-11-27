import 'package:flutter/material.dart' hide Router;

import 'styles/styles.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  final _appRouter = Router();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tileswale',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
