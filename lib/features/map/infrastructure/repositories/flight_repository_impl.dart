import 'package:flutter_base/core/base/api_client_factory.dart';
import 'package:flutter_base/core/network/api_client.dart';
import 'package:flutter_base/core/network/api_result.dart';
import 'package:flutter_base/features/map/domain/entities/flight_information.dart';

class FlightRepositoryImpl {
  final ApiClient _client;

  FlightRepositoryImpl(this._client);

  factory FlightRepositoryImpl.withOdptDefaults() {
    final client = ApiClientFactory.create(ApiType.odpt);
    return FlightRepositoryImpl(client);
  }

  Future<ApiResult<List<FlightInformation>>> fetchFlightArrivals() {
    return _client.get<List<FlightInformation>>(
      'odpt:FlightInformationArrival',
      queryParameters: {'acl:consumerKey': 'your_api_key_here'},
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map(
              (item) =>
                  FlightInformation.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }
}
