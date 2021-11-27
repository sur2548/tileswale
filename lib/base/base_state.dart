import 'package:flutter/foundation.dart';

abstract class BaseState extends ChangeNotifier {
  bool _isBusy = false;
  bool _isNestedBusy = false;
  bool _isError = false;
  String _error = '';

  void setBusy(bool isBusy) {
    if (!isBusy) _isError = false;

    _isBusy = isBusy;
    notifyListeners();
  }

  void setNestedBusy(bool isBusy) {
    if (!isBusy) _isError = false;

    _isNestedBusy = isBusy;
    notifyListeners();
  }

  void setError(bool isError, {String error = ''}) {
    _isError = isError;
    _error = error;
    _isBusy = false;
    _isNestedBusy = false;

    notifyListeners();
  }

  bool get isBusy => _isBusy;

  bool get isNestedBusy => _isNestedBusy;

  bool get isError => _isError;

  String get error => _error;
}
