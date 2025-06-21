import 'package:travi/core/network/api_client.dart';
import 'package:travi/core/network/api_result.dart';
import 'package:travi/core/utils/load_config.dart';

/// Abstract base class for ODPT repositories.
/// Provides a common method to perform GET requests to the ODPT API.
abstract class BaseOdptRepository {
  final ApiClient client;

  BaseOdptRepository(this.client);

  /// Default query parameters required for ODPT API requests.
  /// Currently includes only the `acl:consumerKey` parameter.
  Map<String, String> get defaultQueryParameters => {
    'acl:consumerKey': ApiKeyProvider.odptApiKey,
  };

  /// Generic method to fetch a list of data from a specified endpoint.
  ///
  /// Sends a GET request to the given [path], applying any [additionalQueryParameters],
  /// and parses the response into a `List<T>` using the provided [fromJson] function.
  ///
  /// This method automatically includes required query parameters such as the API key.
  ///
  /// Use [additionalQueryParameters] to apply filtering (e.g., `dc:title=Tokyo`)
  /// or OR conditions (e.g., `dc:title=Tokyo,Gotanda`) as supported by the ODPT API.
  ///
  /// ---
  /// ### Example:
  /// ```dart
  /// final stations = await repository.fetchList(
  ///   'odpt:Station',
  ///   Station.fromJson,
  ///   additionalQueryParameters: {'dc:title': 'Tokyo,Gotanda'},
  /// );
  /// ```
  ///
  /// ### Equivalent cURL request:
  /// ```
  /// curl 'https://api.odpt.org/api/v4/odpt:Station?dc:title=Tokyo,Gotanda&acl:consumerKey=YOUR_KEY'
  /// ```
  ///
  /// [path]: The ODPT API endpoint (e.g., 'odpt:Station').
  /// [fromJson]: A function that parses a JSON object into type `T`.
  /// [additionalQueryParameters]: Optional filters or query parameters.
  Future<ApiResult<List<T>>> fetchList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, String>? additionalQueryParameters,
  }) {
    final queryParams = {
      ...defaultQueryParameters,
      if (additionalQueryParameters != null) ...additionalQueryParameters,
    };

    return client.get<List<T>>(
      path,
      queryParameters: queryParams,
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map((item) => fromJson(item as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
