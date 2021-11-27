import 'package:get_it/get_it.dart';
import 'package:tileswale/api/api.dart';
import 'package:tileswale/services/services.dart';
import 'package:tileswale/states/states.dart';

final locate = GetIt.instance;

Future setupGet() async {
  final preferenceInstance = await PreferenceService.getInstance();
  locate.registerLazySingleton(() => preferenceInstance!);

  locate.registerLazySingleton(() => API());

  locate.registerFactory(() => AuthState());
  locate.registerFactory(() => LoginState());
  locate.registerFactory(() => RegisterState());

  locate.registerFactory(() => DashboardState());
}
