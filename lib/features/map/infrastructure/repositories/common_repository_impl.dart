import 'package:travi/core/base/api_client_factory.dart';
import 'package:travi/core/network/api_result.dart';
import 'package:travi/features/map/domain/repositories/common/calendar.dart';
import 'package:travi/features/map/domain/repositories/common/operator.dart';
import 'package:travi/shared/helpers/common_odpt_repository.dart';

class CommonRepositoryImpl extends BaseOdptRepository {
  CommonRepositoryImpl(super.client);

  factory CommonRepositoryImpl.withOdptDefaults() {
    final client = ApiClientFactory.create(ApiType.odpt);
    return CommonRepositoryImpl(client);
  }

  Future<ApiResult<List<Calendar>>> fetchCalendar() =>
      fetchList('odpt:Calendar', Calendar.fromJson);

  Future<ApiResult<List<Operator>>> fetchOperator() =>
      fetchList('odpt:Operator', Operator.fromJson);
}
