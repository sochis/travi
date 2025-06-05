import 'package:flutter_base/core/base/api_client_factory.dart';
import 'package:flutter_base/core/network/api_client.dart';
import 'package:flutter_base/core/network/api_result.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/airport_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/airport_terminal_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_arrival_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_departure_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_schedule.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_status.dart';

class FlightRepositoryImpl {
  final ApiClient _client;

  FlightRepositoryImpl(this._client);

  factory FlightRepositoryImpl.withOdptDefaults() {
    final client = ApiClientFactory.create(ApiType.odpt);
    return FlightRepositoryImpl(client);
  }

  Future<ApiResult<List<AirportInformation>>> fetchAirport() {
    return _client.get<List<AirportInformation>>(
      'odpt:Airport',
      queryParameters: {'acl:consumerKey': 'your_api_key_here'},
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map(
              (item) =>
                  AirportInformation.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }

  Future<ApiResult<List<AirportTerminalInformation>>> fetchAirportTerminal() {
    return _client.get<List<AirportTerminalInformation>>(
      'odpt:AirportTerminal',
      queryParameters: {'acl:consumerKey': 'your_api_key_here'},
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map(
              (item) => AirportTerminalInformation.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
      },
    );
  }

  Future<ApiResult<List<FlightArrivalInformation>>> fetchFlightArrivals() {
    return _client.get<List<FlightArrivalInformation>>(
      'odpt:FlightInformationArrival',
      queryParameters: {'acl:consumerKey': 'your_api_key_here'},
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map(
              (item) => FlightArrivalInformation.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
      },
    );
  }

  Future<ApiResult<List<FlightDepartureInformation>>> fetchFlightDeparture() {
    return _client.get<List<FlightDepartureInformation>>(
      'odpt:FlightInformationDeparture',
      queryParameters: {'acl:consumerKey': 'your_api_key_here'},
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map(
              (item) => FlightDepartureInformation.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();
      },
    );
  }

  Future<ApiResult<List<FlightSchedule>>> fetchFlightSchedule() {
    return _client.get<List<FlightSchedule>>(
      'odpt:FlightSchedule',
      queryParameters: {'acl:consumerKey': 'your_api_key_here'},
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map(
              (item) => FlightSchedule.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }

  Future<ApiResult<List<FlightStatus>>> fetchFlightStatus() {
    return _client.get<List<FlightStatus>>(
      'odpt:FlightStatus',
      queryParameters: {'acl:consumerKey': 'your_api_key_here'},
      parser: (data) {
        final list = data as List<dynamic>;
        return list
            .map((item) => FlightStatus.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
