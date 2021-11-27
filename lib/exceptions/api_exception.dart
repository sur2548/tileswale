class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class ValidationException extends ApiException {
  ValidationException([String? message]) : super(message, 'Invalid Data: ');
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, '');
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message, '');
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, '');
}
