import 'package:flutter_base/core/network/api_client.dart';

enum ApiType { odpt, myBackend }

class ApiClientFactory {
  static ApiClient create(ApiType type) {
    switch (type) {
      case ApiType.odpt:
        return ApiClient(
          baseUrl: 'https://api.odpt.org/api/v4/',
          getToken: () async => null,
        );
      case ApiType.myBackend:
        return ApiClient(
          baseUrl: 'https://api.example.com',
          getToken: () async => 'someToken',
        );
    }
  }
}
