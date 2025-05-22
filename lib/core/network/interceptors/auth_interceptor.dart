import 'package:dio/dio.dart';

/// An interceptor that adds an Authorization header to outgoing requests.
///
/// This is typically used to attach a Bearer token for authenticated API access.
class AuthInterceptor extends Interceptor {
  /// A function that asynchronously provides the current access token.
  final Future<String?> Function() getToken;

  /// Creates an AuthInterceptor with a token provider callback.
  AuthInterceptor(this.getToken);

  /// Attaches the Bearer token to the request if available.
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
