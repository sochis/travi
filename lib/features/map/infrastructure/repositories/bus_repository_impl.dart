import 'package:flutter_base/core/base/api_client_factory.dart';
import 'package:flutter_base/core/network/api_result.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/bus_information.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/bus_routepattern.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/bus_timetable.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/busstop_pole.dart';
import 'package:flutter_base/features/map/domain/repositories/bus/busstop_pole_timetable.dart';
import 'package:flutter_base/shared/helpers/common_odpt_repository.dart';

class BusRepositoryImpl extends BaseOdptRepository {
  BusRepositoryImpl(super.client);

  factory BusRepositoryImpl.withOdptDefaults() {
    final client = ApiClientFactory.create(ApiType.odpt);
    return BusRepositoryImpl(client);
  }

  Future<ApiResult<List<BusInformation>>> fetchBus() =>
      fetchList('odpt:Bus', BusInformation.fromJson);

  Future<ApiResult<List<BusTimetable>>> fetchBusTimetable() =>
      fetchList('odpt:BusTimetable', BusTimetable.fromJson);

  Future<ApiResult<List<BusroutePattern>>> fetchBusroutePattern() =>
      fetchList('odpt:BusroutePattern', BusroutePattern.fromJson);

  Future<ApiResult<List<BusroutePattern>>> fetchBusroutePatternFare() =>
      fetchList('odpt:BusroutePatternFare', BusroutePattern.fromJson);

  Future<ApiResult<List<BusstopPole>>> fetchBusstopPole() =>
      fetchList('odpt:BusstopPole', BusstopPole.fromJson);

  Future<ApiResult<List<BusstopPoleTimetable>>> fetchBusstopPoleTimetable() =>
      fetchList('odpt:BusstopPoleTimetable', BusstopPoleTimetable.fromJson);
}
