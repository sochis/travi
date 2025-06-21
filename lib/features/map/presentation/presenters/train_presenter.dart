import 'package:travi/features/map/domain/repositories/train/passenger_survey.dart';
import 'package:travi/features/map/domain/repositories/train/rail_direction.dart';
import 'package:travi/features/map/domain/repositories/train/railway.dart';
import 'package:travi/features/map/domain/repositories/train/railway_fare.dart';
import 'package:travi/features/map/domain/repositories/train/station.dart';
import 'package:travi/features/map/domain/repositories/train/station_timetatble.dart';
import 'package:travi/features/map/domain/repositories/train/train.dart';
import 'package:travi/features/map/domain/repositories/train/train_information.dart';
import 'package:travi/features/map/domain/repositories/train/train_timetable.dart';
import 'package:travi/features/map/domain/repositories/train/train_type.dart';
import 'package:travi/features/map/infrastructure/repositories/train_repository_impl.dart';
import 'package:travi/shared/helpers/api_result_notifier.dart';

class StationNotifier extends ApiResultNotifier<Station> {
  StationNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchStation);
}

class StationTimetableNotifier extends ApiResultNotifier<StationTimetable> {
  StationTimetableNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchStationTimetable);
}

class TrainNotifier extends ApiResultNotifier<Train> {
  TrainNotifier(TrainRepositoryImpl repository) : super(repository.fetchTrain);
}

class TrainTimetableNotifier extends ApiResultNotifier<TrainTimetable> {
  TrainTimetableNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchTrainTimetable);
}

class TrainInformationNotifier extends ApiResultNotifier<TrainInformation> {
  TrainInformationNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchTrainInformation);
}

class TrainTypeNotifier extends ApiResultNotifier<TrainType> {
  TrainTypeNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchTrainType);
}

class RailDirectionNotifier extends ApiResultNotifier<RailDirection> {
  RailDirectionNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchRailDirection);
}

class RailwayNotifier extends ApiResultNotifier<Railway> {
  RailwayNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchRailway);
}

class RailwayFareNotifier extends ApiResultNotifier<RailwayFare> {
  RailwayFareNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchRailwayFare);
}

class PassengerSurveyNotifier extends ApiResultNotifier<PassengerSurvey> {
  PassengerSurveyNotifier(TrainRepositoryImpl repository)
    : super(repository.fetchPassengerSurvey);
}
