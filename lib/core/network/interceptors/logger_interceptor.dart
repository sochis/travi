import 'package:dio/dio.dart';
import 'package:travi/core/utils/logger.dart';

/// An interceptor that logs HTTP requests, responses, and errors.
///
/// This is useful for debugging and monitoring HTTP traffic in development.
/// Logs are written using Dart's `log` function with the 'HTTP' tag.
class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String method = options.method;
    final Uri uri = options.uri;
    final Map<String, dynamic> headers = options.headers;
    final dynamic data = options.data;

    Logger.log('--> $method $uri');
    Logger.log('Headers: $headers');
    Logger.log('Data: $data');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final int? statusCode = response.statusCode;
    final Uri uri = response.requestOptions.uri;

    Logger.log('<-- $statusCode $uri');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final String message = err.message ?? 'Unknown error';
    Logger.error('❌ Error: $message', err);

    super.onError(err, handler);
  }
}
