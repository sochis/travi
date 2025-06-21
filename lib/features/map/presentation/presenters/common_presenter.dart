import 'package:travi/features/map/domain/repositories/common/calendar.dart';
import 'package:travi/features/map/domain/repositories/common/operator.dart';
import 'package:travi/features/map/infrastructure/repositories/common_repository_impl.dart';
import 'package:travi/shared/helpers/api_result_notifier.dart';

class CalendarNotifier extends ApiResultNotifier<Calendar> {
  CalendarNotifier(CommonRepositoryImpl repository)
    : super(repository.fetchCalendar);
}

class OperatorNotifier extends ApiResultNotifier<Operator> {
  OperatorNotifier(CommonRepositoryImpl repository)
    : super(repository.fetchOperator);
}
