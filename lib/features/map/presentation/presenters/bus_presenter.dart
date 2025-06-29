import 'package:travi/features/map/domain/repositories/bus/bus_information.dart';
import 'package:travi/features/map/domain/repositories/bus/bus_routepattern.dart';
import 'package:travi/features/map/domain/repositories/bus/bus_timetable.dart';
import 'package:travi/features/map/domain/repositories/bus/busroute_pattern_fare.dart';
import 'package:travi/features/map/domain/repositories/bus/busstop_pole.dart';
import 'package:travi/features/map/domain/repositories/bus/busstop_pole_timetable.dart';
import 'package:travi/features/map/infrastructure/repositories/bus_repository_impl.dart';
import 'package:travi/shared/helpers/api_result_notifier.dart';

class BusNotifier extends ApiResultNotifier<BusInformation> {
  BusNotifier(BusRepositoryImpl repository) : super(repository.fetchBus);
}

class BusTimetableNotifier extends ApiResultNotifier<BusTimetable> {
  BusTimetableNotifier(BusRepositoryImpl repository)
    : super(repository.fetchBusTimetable);
}

class BusroutePatternNotifier extends ApiResultNotifier<BusroutePattern> {
  BusroutePatternNotifier(BusRepositoryImpl repository)
    : super(repository.fetchBusroutePattern);
}

class BusroutePatternFareNotifier
    extends ApiResultNotifier<BusroutePatternFare> {
  BusroutePatternFareNotifier(BusRepositoryImpl repository)
    : super(repository.fetchBusroutePatternFare);
}

class BusstopPoleNotifier extends ApiResultNotifier<BusstopPole> {
  BusstopPoleNotifier(BusRepositoryImpl repository)
    : super(repository.fetchBusstopPole);
}

class BusstopPoleTimetableNotifier
    extends ApiResultNotifier<BusstopPoleTimetable> {
  BusstopPoleTimetableNotifier(BusRepositoryImpl repository)
    : super(repository.fetchBusstopPoleTimetable);
}
