import 'package:travi/core/base/api_client_factory.dart';
import 'package:travi/core/network/api_result.dart';
import 'package:travi/features/map/domain/repositories/flight/airport_information.dart';
import 'package:travi/features/map/domain/repositories/flight/airport_terminal_information.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_arrival_information.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_departure_information.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_schedule.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_status.dart';
import 'package:travi/shared/helpers/common_odpt_repository.dart';

class FlightRepositoryImpl extends BaseOdptRepository {
  FlightRepositoryImpl(super.client);

  factory FlightRepositoryImpl.withOdptDefaults() {
    final client = ApiClientFactory.create(ApiType.odpt);
    return FlightRepositoryImpl(client);
  }

  Future<ApiResult<List<AirportInformation>>> fetchAirport() =>
      fetchList('odpt:Airport', AirportInformation.fromJson);

  Future<ApiResult<List<AirportTerminalInformation>>> fetchAirportTerminal() =>
      fetchList('odpt:AirportTerminal', AirportTerminalInformation.fromJson);

  Future<ApiResult<List<FlightArrivalInformation>>> fetchFlightArrivals() =>
      fetchList(
        'odpt:FlightInformationArrival',
        FlightArrivalInformation.fromJson,
      );

  Future<ApiResult<List<FlightDepartureInformation>>> fetchFlightDeparture() =>
      fetchList(
        'odpt:FlightInformationDeparture',
        FlightDepartureInformation.fromJson,
      );

  Future<ApiResult<List<FlightSchedule>>> fetchFlightSchedule() =>
      fetchList('odpt:FlightSchedule', FlightSchedule.fromJson);

  Future<ApiResult<List<FlightStatus>>> fetchFlightStatus() =>
      fetchList('odpt:FlightStatus', FlightStatus.fromJson);
}
