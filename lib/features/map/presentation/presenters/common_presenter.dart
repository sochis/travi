import 'package:flutter_base/features/map/domain/repositories/common/calendar.dart';
import 'package:flutter_base/features/map/domain/repositories/common/operator.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/common_repository_impl.dart';
import 'package:flutter_base/shared/helpers/api_result_notifier.dart';

class CalendarNotifier extends ApiResultNotifier<Calendar> {
  CalendarNotifier(CommonRepositoryImpl repository)
    : super(repository.fetchCalendar);
}

class OperatorNotifier extends ApiResultNotifier<Operator> {
  OperatorNotifier(CommonRepositoryImpl repository)
    : super(repository.fetchOperator);
}
