import 'dart:developer';
import 'package:dio/dio.dart';

/// An interceptor that logs HTTP requests, responses, and errors.
///
/// This is useful for debugging and monitoring HTTP traffic in development.
/// Logs are written using Dart's `log` function with the 'HTTP' tag.
class LoggerInterceptor extends Interceptor {
  /// Logs the outgoing HTTP request including method, URL, headers, and body.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String method = options.method;
    final Uri uri = options.uri;
    final Map<String, dynamic> headers = options.headers;
    final dynamic data = options.data;

    log('--> $method $uri', name: 'HTTP');
    log('Headers: $headers', name: 'HTTP');
    log('Data: $data', name: 'HTTP');

    super.onRequest(options, handler);
  }

  /// Logs the incoming HTTP response including status code, URL, and body.
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final int? statusCode = response.statusCode;
    final Uri uri = response.requestOptions.uri;
    final dynamic responseBody = response.data;

    log('<-- $statusCode $uri', name: 'HTTP');
    log('Response: $responseBody', name: 'HTTP');

    super.onResponse(response, handler);
  }

  /// Logs any HTTP errors including the error message and stack trace.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final String message = err.message ?? 'Unknown error';
    final StackTrace stackTrace = err.stackTrace;

    log('❌ Error: $message', name: 'HTTP', error: err, stackTrace: stackTrace);

    super.onError(err, handler);
  }
}
