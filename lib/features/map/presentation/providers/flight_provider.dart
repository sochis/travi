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

final airportProvider =
    StateNotifierProvider<AirportNotifier, CommonState<AirportInformation>>(
      (ref) => AirportNotifier(FlightRepositoryImpl.withOdptDefaults()),
    );

final airportTerminalProvider = StateNotifierProvider<
  AirportTerminalNotifier,
  CommonState<AirportTerminalInformation>
>((ref) => AirportTerminalNotifier(FlightRepositoryImpl.withOdptDefaults()));

final flightArrivalProvider = StateNotifierProvider<
  FlightArrivalNotifier,
  CommonState<FlightArrivalInformation>
>((ref) => FlightArrivalNotifier(FlightRepositoryImpl.withOdptDefaults()));

final flightDepartureProvider = StateNotifierProvider<
  FlightDepartureNotifier,
  CommonState<FlightDepartureInformation>
>((ref) => FlightDepartureNotifier(FlightRepositoryImpl.withOdptDefaults()));

final flightScheduleProvider =
    StateNotifierProvider<FlightScheduleNotifier, CommonState<FlightSchedule>>(
      (ref) => FlightScheduleNotifier(FlightRepositoryImpl.withOdptDefaults()),
    );

final flightStatusProvider =
    StateNotifierProvider<FlightStatusNotifier, CommonState<FlightStatus>>(
      (ref) => FlightStatusNotifier(FlightRepositoryImpl.withOdptDefaults()),
    );
