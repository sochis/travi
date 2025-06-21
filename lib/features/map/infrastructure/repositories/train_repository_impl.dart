import 'package:travi/core/base/api_client_factory.dart';
import 'package:travi/core/network/api_result.dart';
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
import 'package:travi/shared/helpers/common_odpt_repository.dart';

class TrainRepositoryImpl extends BaseOdptRepository {
  TrainRepositoryImpl(super.client);

  factory TrainRepositoryImpl.withOdptDefaults() {
    final client = ApiClientFactory.create(ApiType.odpt);
    return TrainRepositoryImpl(client);
  }

  Future<ApiResult<List<Station>>> fetchStation() =>
      fetchList('odpt:Station', Station.fromJson);

  Future<ApiResult<List<StationTimetable>>> fetchStationTimetable() =>
      fetchList('odpt:StationTimetable', StationTimetable.fromJson);

  Future<ApiResult<List<Train>>> fetchTrain() =>
      fetchList('odpt:Train', Train.fromJson);

  Future<ApiResult<List<TrainTimetable>>> fetchTrainTimetable() =>
      fetchList('odpt:TrainTimetable', TrainTimetable.fromJson);

  Future<ApiResult<List<TrainInformation>>> fetchTrainInformation() =>
      fetchList('odpt:TrainInformation', TrainInformation.fromJson);

  Future<ApiResult<List<TrainType>>> fetchTrainType() =>
      fetchList('odpt:TrainType', TrainType.fromJson);

  Future<ApiResult<List<RailDirection>>> fetchRailDirection() =>
      fetchList('odpt:RailDirection', RailDirection.fromJson);

  Future<ApiResult<List<Railway>>> fetchRailway() =>
      fetchList('odpt:Railway', Railway.fromJson);

  Future<ApiResult<List<RailwayFare>>> fetchRailwayFare() =>
      fetchList('odpt:RailwayFare', RailwayFare.fromJson);

  Future<ApiResult<List<PassengerSurvey>>> fetchPassengerSurvey() =>
      fetchList('odpt:PassengerSurvey', PassengerSurvey.fromJson);
}
