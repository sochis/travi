import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  NetworkException(this.message, [this.statusCode]);

  @override
  String toString() => 'NetworkException($statusCode): $message';

  static NetworkException fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Timeout occurred', 408);
      case DioExceptionType.badResponse:
        return NetworkException(
          'Server responded with ${error.response?.statusCode}',
          error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return NetworkException('Request was cancelled');
      case DioExceptionType.unknown:
        return NetworkException('Unknown error occurred');
      default:
        return NetworkException('Unexpected error');
    }
  }
}
