import 'package:travi/features/map/domain/repositories/bus/bus_information.dart';
import 'package:travi/features/map/domain/repositories/bus/bus_routepattern.dart';
import 'package:travi/features/map/domain/repositories/bus/bus_timetable.dart';
import 'package:travi/features/map/domain/repositories/bus/busstop_pole.dart';
import 'package:travi/features/map/domain/repositories/bus/busstop_pole_timetable.dart';
import 'package:travi/features/map/infrastructure/repositories/bus_repository_impl.dart';
import 'package:travi/features/map/presentation/presenters/bus_presenter.dart';
import 'package:travi/shared/helpers/common_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides real-time or static bus operation information.
/// Uses the ODPT API to retrieve metadata about bus lines, including operators,
/// service status, and operational descriptions.
final busProvider =
    StateNotifierProvider<BusNotifier, CommonState<BusInformation>>(
      (ref) => BusNotifier(BusRepositoryImpl.withOdptDefaults()),
    );

/// Provides access to the timetable information of a specific bus route or stop.
/// Retrieves detailed schedule data from the ODPT BusTimetable endpoint,
/// supporting variations by day type (weekdays, holidays, etc.).
final busTimetableProvider =
    StateNotifierProvider<BusTimetableNotifier, CommonState<BusTimetable>>(
      (ref) => BusTimetableNotifier(BusRepositoryImpl.withOdptDefaults()),
    );

/// Provides the bus route pattern data, including stop sequences and route shape.
/// This connects to the ODPT BusRoutePattern endpoint, which defines how buses
/// run through various poles (stops) along the line.
final busroutePatternProvider =
    StateNotifierProvider<
      BusroutePatternNotifier,
      CommonState<BusroutePattern>
    >((ref) => BusroutePatternNotifier(BusRepositoryImpl.withOdptDefaults()));

/// Provides fare-related data associated with a given route pattern.
/// Fetches ODPT fare information based on route distance, zones, or fare structure.
final busroutePatternFareProvider =
    StateNotifierProvider<
      BusroutePatternNotifier,
      CommonState<BusroutePattern>
    >((ref) => BusroutePatternNotifier(BusRepositoryImpl.withOdptDefaults()));

/// Provides metadata about bus stop poles, including location and parent stop.
/// Retrieves data from the ODPT BusstopPole endpoint, representing individual
/// poles where buses arrive/depart.
final busstopPoleProvider =
    StateNotifierProvider<BusstopPoleNotifier, CommonState<BusstopPole>>(
      (ref) => BusstopPoleNotifier(BusRepositoryImpl.withOdptDefaults()),
    );

/// Provides scheduled bus arrival and departure times for a given bus stop pole.
/// Connects to the ODPT BusstopPoleTimetable endpoint and returns timing
/// information by direction, service day, and route.
final busstopPoleTimetableProvider =
    StateNotifierProvider<
      BusstopPoleTimetableNotifier,
      CommonState<BusstopPoleTimetable>
    >(
      (ref) =>
          BusstopPoleTimetableNotifier(BusRepositoryImpl.withOdptDefaults()),
    );
