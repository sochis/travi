import 'package:flutter_base/core/network/api_client.dart';
import 'package:flutter_base/core/network/api_result.dart';
import 'package:flutter_base/core/utils/load_config.dart';

abstract class BaseOdptRepository {
  final ApiClient client;

  BaseOdptRepository(this.client);

  Map<String, String> get defaultQueryParameters => {
    'acl:consumerKey': ApiKeyProvider.odptApiKey,
  };

  Future<ApiResult<List<T>>> fetchList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return client.get<List<T>>(
      path,
      queryParameters: defaultQueryParameters,
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
