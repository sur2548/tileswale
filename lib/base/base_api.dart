import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tileswale/exceptions/exceptions.dart';

abstract class BaseAPI {
  final http = Dio();


  String get baseURL => '';

  String? get token => null;

  bool get enableLogger => true;

  bool get logResponseBody => false;

  BaseAPI() {
    http.options.baseUrl = baseURL;
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _authorize();

    var responseJson;
    try {
      final response = await http.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      responseJson = _returnResponse(e.response!);
    }

    return responseJson;
  }

  Future<dynamic> post(
    String url,
    Map<String, dynamic> data, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _authorize();

    final formData = FormData.fromMap(data);

    var responseJson;
    try {
      final response = await http.post(
        url,
        data: formData,
        queryParameters: queryParameters,
        options: options,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      responseJson = _returnResponse(e.response!);
    }

    return responseJson;
  }

  Future<dynamic> patch(
    String url,
    Map<String, dynamic> data, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    _authorize();

    final formData = FormData.fromMap(data);

    var responseJson;
    try {
      final response = await http.post(
        url + '?_method=patch',
        data: formData,
        queryParameters: queryParameters,
        options: options,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      responseJson = _returnResponse(e.response!);
    }

    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data);
      case 422:
        throw ValidationException(response.data['error']);
      case 401:
      case 403:
        throw UnauthorisedException(response.data['message']);
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }

  void _authorize() {
    http.interceptors.clear();
    http.interceptors.addAll([
      TokenInterceptors(token: token),
    ]);
  }
}

class TokenInterceptors extends Interceptor {
  final String? token;

  TokenInterceptors({
    required this.token,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }
}
