import 'package:flutter_base/features/map/domain/repositories/bus/bus_information.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/bus_routepattern.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/bus_timetable.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/busstop_pole.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/busstop_pole_timetable.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/bus_repository_impl.dart';
import 'package:flutter_base/features/map/presentation/presenters/bus_presenter.dart';
import 'package:flutter_base/shared/helpers/common_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final busProvider =
    StateNotifierProvider<BusNotifier, CommonState<BusInformation>>(
      (ref) => BusNotifier(BusRepositoryImpl.withOdptDefaults()),
    );

final busTimetableProvider =
    StateNotifierProvider<BusTimetableNotifier, CommonState<BusTimetable>>(
      (ref) => BusTimetableNotifier(BusRepositoryImpl.withOdptDefaults()),
    );

final busroutePatternProvider = StateNotifierProvider<
  BusroutePatternNotifier,
  CommonState<BusroutePattern>
>((ref) => BusroutePatternNotifier(BusRepositoryImpl.withOdptDefaults()));

final busroutePatternFareProvider = StateNotifierProvider<
  BusroutePatternNotifier,
  CommonState<BusroutePattern>
>((ref) => BusroutePatternNotifier(BusRepositoryImpl.withOdptDefaults()));

final busstopPoleProvider =
    StateNotifierProvider<BusstopPoleNotifier, CommonState<BusstopPole>>(
      (ref) => BusstopPoleNotifier(BusRepositoryImpl.withOdptDefaults()),
    );

final busstopPoleTimetableProvider = StateNotifierProvider<
  BusstopPoleTimetableNotifier,
  CommonState<BusstopPoleTimetable>
>((ref) => BusstopPoleTimetableNotifier(BusRepositoryImpl.withOdptDefaults()));
