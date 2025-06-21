import 'package:travi/features/map/infrastructure/repositories/flight_repository_impl.dart';
import 'package:travi/features/map/domain/repositories/flight/airport_information.dart';
import 'package:travi/features/map/domain/repositories/flight/airport_terminal_information.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_arrival_information.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_departure_information.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_schedule.dart';
import 'package:travi/features/map/domain/repositories/flight/flight_status.dart';
import 'package:travi/shared/helpers/api_result_notifier.dart';

class AirportNotifier extends ApiResultNotifier<AirportInformation> {
  AirportNotifier(FlightRepositoryImpl repository)
    : super(repository.fetchAirport);
}

class AirportTerminalNotifier
    extends ApiResultNotifier<AirportTerminalInformation> {
  AirportTerminalNotifier(FlightRepositoryImpl repository)
    : super(repository.fetchAirportTerminal);
}

class FlightArrivalNotifier
    extends ApiResultNotifier<FlightArrivalInformation> {
  FlightArrivalNotifier(FlightRepositoryImpl repository)
    : super(repository.fetchFlightArrivals);
}

class FlightDepartureNotifier
    extends ApiResultNotifier<FlightDepartureInformation> {
  FlightDepartureNotifier(FlightRepositoryImpl repository)
    : super(repository.fetchFlightDeparture);
}

class FlightScheduleNotifier extends ApiResultNotifier<FlightSchedule> {
  FlightScheduleNotifier(FlightRepositoryImpl repository)
    : super(repository.fetchFlightSchedule);
}

class FlightStatusNotifier extends ApiResultNotifier<FlightStatus> {
  FlightStatusNotifier(FlightRepositoryImpl repository)
    : super(repository.fetchFlightStatus);
}
