import 'package:flutter_base/features/map/domain/repositories/flight/airport_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/airport_terminal_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_arrival_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_departure_information.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_schedule.dart';
import 'package:flutter_base/features/map/domain/repositories/flight/flight_status.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/flight_repository_impl.dart';
import 'package:flutter_base/features/map/presentation/presenters/flight_presenter.dart';
import 'package:flutter_base/shared/helpers/common_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides metadata and basic information about airports.
/// Retrieves data from the ODPT Airport endpoint, including airport codes,
/// names, locations, and associated operators.
final airportProvider =
    StateNotifierProvider<AirportNotifier, CommonState<AirportInformation>>(
      (ref) => AirportNotifier(FlightRepositoryImpl.withOdptDefaults()),
    );

/// Provides terminal-specific information within an airport.
/// Connects to the ODPT AirportTerminal endpoint and includes details such as
/// terminal names, associated gates, and location hierarchies.
final airportTerminalProvider = StateNotifierProvider<
  AirportTerminalNotifier,
  CommonState<AirportTerminalInformation>
>((ref) => AirportTerminalNotifier(FlightRepositoryImpl.withOdptDefaults()));

/// Provides real-time or scheduled flight arrival information.
/// Fetches arrival details for flights using the ODPT FlightArrival endpoint,
/// including airport, airline, flight number, and arrival status.
final flightArrivalProvider = StateNotifierProvider<
  FlightArrivalNotifier,
  CommonState<FlightArrivalInformation>
>((ref) => FlightArrivalNotifier(FlightRepositoryImpl.withOdptDefaults()));

/// Provides real-time or scheduled flight departure information.
/// Retrieves departure data from the ODPT FlightDeparture endpoint,
/// including airline, departure airport, flight number, and status.
final flightDepartureProvider = StateNotifierProvider<
  FlightDepartureNotifier,
  CommonState<FlightDepartureInformation>
>((ref) => FlightDepartureNotifier(FlightRepositoryImpl.withOdptDefaults()));

/// Provides flight schedule data, including planned arrival and departure times.
/// Pulls structured information from the ODPT FlightSchedule endpoint for
/// future or past flights, including regular route patterns.
final flightScheduleProvider =
    StateNotifierProvider<FlightScheduleNotifier, CommonState<FlightSchedule>>(
      (ref) => FlightScheduleNotifier(FlightRepositoryImpl.withOdptDefaults()),
    );

/// Provides the operational status of a flight (e.g., on time, delayed, cancelled).
/// Connects to the ODPT FlightStatus endpoint and reflects real-time updates
/// from airport or airline data providers.
final flightStatusProvider =
    StateNotifierProvider<FlightStatusNotifier, CommonState<FlightStatus>>(
      (ref) => FlightStatusNotifier(FlightRepositoryImpl.withOdptDefaults()),
    );
