import 'package:flutter_base/features/map/domain/repositories/train/passenger_survey.dart';
import 'package:flutter_base/features/map/domain/repositories/train/rail_direction.dart';
import 'package:flutter_base/features/map/domain/repositories/train/railway.dart';
import 'package:flutter_base/features/map/domain/repositories/train/railway_fare.dart';
import 'package:flutter_base/features/map/domain/repositories/train/station.dart';
import 'package:flutter_base/features/map/domain/repositories/train/station_timetatble.dart';
import 'package:flutter_base/features/map/domain/repositories/train/train.dart';
import 'package:flutter_base/features/map/domain/repositories/train/train_information.dart';
import 'package:flutter_base/features/map/domain/repositories/train/train_timetable.dart';
import 'package:flutter_base/features/map/domain/repositories/train/train_type.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/train_repository_impl.dart';
import 'package:flutter_base/features/map/presentation/presenters/train_presenter.dart';
import 'package:flutter_base/shared/helpers/common_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides metadata and details about railway stations, such as name, code, operator, and location.
/// Pulls data from the ODPT Station endpoint.
final stationProvider =
    StateNotifierProvider<StationNotifier, CommonState<Station>>(
      (ref) => StationNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

/// Provides detailed timetable data for each station, including arrival and departure times by train.
/// Fetches data from the ODPT StationTimetable endpoint.
final stationTimetableProvider = StateNotifierProvider<
  StationTimetableNotifier,
  CommonState<StationTimetable>
>((ref) => StationTimetableNotifier(TrainRepositoryImpl.withOdptDefaults()));

/// Provides real-time train data, such as current position, destination, and train ID.
/// Retrieves from the ODPT Train endpoint.
final trainProvider = StateNotifierProvider<TrainNotifier, CommonState<Train>>(
  (ref) => TrainNotifier(TrainRepositoryImpl.withOdptDefaults()),
);

/// Provides scheduled route-based train timetables.
/// Uses the ODPT TrainTimetable endpoint to show full path and times for each service.
final trainTimetableProvider =
    StateNotifierProvider<TrainTimetableNotifier, CommonState<TrainTimetable>>(
      (ref) => TrainTimetableNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

/// Provides operational information about train services including delays, suspensions, and disruptions.
/// Connects to the ODPT TrainInformation endpoint.
final trainInformationProvider = StateNotifierProvider<
  TrainInformationNotifier,
  CommonState<TrainInformation>
>((ref) => TrainInformationNotifier(TrainRepositoryImpl.withOdptDefaults()));

/// Provides metadata for train types, such as Local, Express, Rapid, and Limited Express.
/// Fetches from the ODPT TrainType endpoint.
final trainTypeProvider =
    StateNotifierProvider<TrainTypeNotifier, CommonState<TrainType>>(
      (ref) => TrainTypeNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

/// Provides rail direction metadata (e.g., Upbound or Downbound).
/// Useful for determining directional flow of train services.
/// Data sourced from the ODPT RailDirection endpoint.
final railDirectionProvider =
    StateNotifierProvider<RailDirectionNotifier, CommonState<RailDirection>>(
      (ref) => RailDirectionNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

/// Provides metadata about railway lines, such as line name, operator, and route structure.
/// Retrieves from the ODPT Railway endpoint.
final railwayProvider =
    StateNotifierProvider<RailwayNotifier, CommonState<Railway>>(
      (ref) => RailwayNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

/// Provides fare information for travel on railway lines.
/// Retrieves section-based or distance-based fare data from the ODPT RailwayFare endpoint.
final railwayFareProvider =
    StateNotifierProvider<RailwayFareNotifier, CommonState<RailwayFare>>(
      (ref) => RailwayFareNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

/// Provides ridership statistics collected from passenger surveys, typically annual.
/// Fetches data from the ODPT PassengerSurvey endpoint.
final passengerSurveyProvider = StateNotifierProvider<
  PassengerSurveyNotifier,
  CommonState<PassengerSurvey>
>((ref) => PassengerSurveyNotifier(TrainRepositoryImpl.withOdptDefaults()));
