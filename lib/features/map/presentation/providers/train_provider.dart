import 'package:flutter_base/features/map/domain/repositories/train/RailwayFare.dart';
import 'package:flutter_base/features/map/domain/repositories/train/passenger_survey.dart';
import 'package:flutter_base/features/map/domain/repositories/train/rail_direction.dart';
import 'package:flutter_base/features/map/domain/repositories/train/railway.dart';
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

final stationProvider =
    StateNotifierProvider<StationNotifier, CommonState<Station>>(
      (ref) => StationNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

final stationTimetableProvider = StateNotifierProvider<
  StationTimetableNotifier,
  CommonState<StationTimetable>
>((ref) => StationTimetableNotifier(TrainRepositoryImpl.withOdptDefaults()));

final trainProvider = StateNotifierProvider<TrainNotifier, CommonState<Train>>(
  (ref) => TrainNotifier(TrainRepositoryImpl.withOdptDefaults()),
);

final trainTimetableProvider =
    StateNotifierProvider<TrainTimetableNotifier, CommonState<TrainTimetable>>(
      (ref) => TrainTimetableNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

final trainInformationProvider = StateNotifierProvider<
  TrainInformationNotifier,
  CommonState<TrainInformation>
>((ref) => TrainInformationNotifier(TrainRepositoryImpl.withOdptDefaults()));

final trainTypeProvider =
    StateNotifierProvider<TrainTypeNotifier, CommonState<TrainType>>(
      (ref) => TrainTypeNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

final railDirectionProvider =
    StateNotifierProvider<RailDirectionNotifier, CommonState<RailDirection>>(
      (ref) => RailDirectionNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

final railwayProvider =
    StateNotifierProvider<RailwayNotifier, CommonState<Railway>>(
      (ref) => RailwayNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

final railwayFareProvider =
    StateNotifierProvider<RailwayFareNotifier, CommonState<RailwayFare>>(
      (ref) => RailwayFareNotifier(TrainRepositoryImpl.withOdptDefaults()),
    );

final passengerSurveyProvider = StateNotifierProvider<
  PassengerSurveyNotifier,
  CommonState<PassengerSurvey>
>((ref) => PassengerSurveyNotifier(TrainRepositoryImpl.withOdptDefaults()));
