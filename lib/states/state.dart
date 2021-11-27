import 'package:tileswale/api/api.dart';
import 'package:tileswale/base/base.dart';
import 'package:tileswale/get.dart';
import 'package:tileswale/services/services.dart';

abstract class ViewModel extends BaseState {
  final api = locate<API>();
  final pref = locate<PreferenceService>();
}
