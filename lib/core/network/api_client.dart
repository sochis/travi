import 'package:dio/dio.dart';
import 'package:flutter_base/core/exceptions/network_exception.dart';
import 'api_result.dart';
import 'interceptors/logger_interceptor.dart';
import 'interceptors/auth_interceptor.dart';

/// A wrapper around Dio that adds authentication and logging interceptors,
/// and provides a unified way to handle API requests and responses.
class ApiClient {
  final Dio _dio;

  /// Creates an [ApiClient] with optional [baseUrl] and required [getToken] function.
  ///
  /// If no [baseUrl] is provided, it defaults to 'https://api.example.com'.
  ApiClient({
    String baseUrl = 'https://api.example.com',
    required Future<String?> Function() getToken,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: const Duration(seconds: 10),
           receiveTimeout: const Duration(seconds: 10),
         ),
       ) {
    _dio.interceptors.addAll(<Interceptor>[
      LoggerInterceptor(),
      AuthInterceptor(getToken),
    ]);
  }

  /// Sends a GET request to the given [path] with optional [queryParameters].
  ///
  /// A custom [parser] can be provided to convert the response data to type [T].
  /// Returns an [ApiResult] that is either [Success] or [Failure].
  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      final T parsed =
          parser != null ? parser(response.data) : response.data as T;
      return Success<T>(parsed);
    } on DioException catch (e) {
      return Failure<T>(NetworkException.fromDioError(e));
    }
  }

  /// Sends a POST request to the given [path] with optional [data] payload.
  ///
  /// A [parser] can be passed to convert the response data to type [T].
  Future<ApiResult<T>> post<T>(
    String path, {
    Map<String, dynamic>? data,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(path, data: data);
      final T parsed =
          parser != null ? parser(response.data) : response.data as T;
      return Success<T>(parsed);
    } on DioException catch (e) {
      return Failure<T>(NetworkException.fromDioError(e));
    }
  }

  /// Sends a PUT request to the given [path] with optional [data] payload.
  ///
  /// Accepts a [parser] to transform the response into type [T].
  Future<ApiResult<T>> put<T>(
    String path, {
    Map<String, dynamic>? data,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final Response<dynamic> response = await _dio.put(path, data: data);
      final T parsed =
          parser != null ? parser(response.data) : response.data as T;
      return Success<T>(parsed);
    } on DioException catch (e) {
      return Failure<T>(NetworkException.fromDioError(e));
    }
  }

  /// Sends a DELETE request to the given [path] with optional [data].
  ///
  /// Uses the [parser] function to parse the response into type [T].
  Future<ApiResult<T>> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final Response<dynamic> response = await _dio.delete(path, data: data);
      final T parsed =
          parser != null ? parser(response.data) : response.data as T;
      return Success<T>(parsed);
    } on DioException catch (e) {
      return Failure<T>(NetworkException.fromDioError(e));
    }
  }
}
