import 'package:flutter_base/features/map/domain/repositories/flight/flight_departure_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_schedule.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_status.dart';
import 'package:flutter_base/shared/helpers/common_notifier.dart';
import 'package:flutter_base/core/network/api_result.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_arrival_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/airport_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/airport_terminal_information.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/flight_repository_impl.dart';

class AirportNotifier extends CommonNotifier<AirportInformation> {
  final FlightRepositoryImpl repository;

  AirportNotifier(this.repository);

  @override
  Future<List<AirportInformation>> fetchFromRepository() async {
    final result = await repository.fetchAirport();
    if (result is Success<List<AirportInformation>>) {
      return result.data;
    } else if (result is Failure<List<AirportInformation>>) {
      throw Exception(result.error.message);
    } else {
      throw Exception('Unknown error');
    }
  }
}

class AirportTerminalNotifier
    extends CommonNotifier<AirportTerminalInformation> {
  final FlightRepositoryImpl repository;

  AirportTerminalNotifier(this.repository);

  @override
  Future<List<AirportTerminalInformation>> fetchFromRepository() async {
    final result = await repository.fetchAirportTerminal();
    if (result is Success<List<AirportTerminalInformation>>) {
      return result.data;
    } else if (result is Failure<List<AirportTerminalInformation>>) {
      throw Exception(result.error.message);
    } else {
      throw Exception('Unknown error');
    }
  }
}

class FlightArrivalNotifier extends CommonNotifier<FlightArrivalInformation> {
  final FlightRepositoryImpl repository;

  FlightArrivalNotifier(this.repository);

  @override
  Future<List<FlightArrivalInformation>> fetchFromRepository() async {
    final result = await repository.fetchFlightArrivals();
    if (result is Success<List<FlightArrivalInformation>>) {
      return result.data;
    } else if (result is Failure<List<FlightArrivalInformation>>) {
      throw Exception(result.error.message);
    } else {
      throw Exception('Unknown error');
    }
  }
}

class FlightDepartureNotifier
    extends CommonNotifier<FlightDepartureInformation> {
  final FlightRepositoryImpl repository;

  FlightDepartureNotifier(this.repository);

  @override
  Future<List<FlightDepartureInformation>> fetchFromRepository() async {
    final result = await repository.fetchFlightDeparture();
    if (result is Success<List<FlightDepartureInformation>>) {
      return result.data;
    } else if (result is Failure<List<FlightDepartureInformation>>) {
      throw Exception(result.error.message);
    } else {
      throw Exception('Unknown error');
    }
  }
}

class FlightScheduleNotifier extends CommonNotifier<FlightSchedule> {
  final FlightRepositoryImpl repository;

  FlightScheduleNotifier(this.repository);

  @override
  Future<List<FlightSchedule>> fetchFromRepository() async {
    final result = await repository.fetchFlightSchedule();
    if (result is Success<List<FlightSchedule>>) {
      return result.data;
    } else if (result is Failure<List<FlightSchedule>>) {
      throw Exception(result.error.message);
    } else {
      throw Exception('Unknown error');
    }
  }
}

class FlightStatusNotifier extends CommonNotifier<FlightStatus> {
  final FlightRepositoryImpl repository;

  FlightStatusNotifier(this.repository);

  @override
  Future<List<FlightStatus>> fetchFromRepository() async {
    final result = await repository.fetchFlightStatus();
    if (result is Success<List<FlightStatus>>) {
      return result.data;
    } else if (result is Failure<List<FlightStatus>>) {
      throw Exception(result.error.message);
    } else {
      throw Exception('Unknown error');
    }
  }
}
