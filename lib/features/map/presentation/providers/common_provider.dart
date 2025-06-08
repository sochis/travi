import 'package:flutter_base/features/map/domain/repositories/common/calendar.dart';
import 'package:flutter_base/features/map/domain/repositories/common/operator.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/common_repository_impl.dart';
import 'package:flutter_base/features/map/presentation/presenters/common_presenter.dart';
import 'package:flutter_base/shared/helpers/common_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides access to service calendar data used for determining valid operation dates.
/// Retrieves ODPT Calendar information such as weekdays, weekends, holidays,
/// and special event days that affect transit schedules.
final calendarProvider =
    StateNotifierProvider<CalendarNotifier, CommonState<Calendar>>(
      (ref) => CalendarNotifier(CommonRepositoryImpl.withOdptDefaults()),
    );

/// Provides transit operator metadata, such as operator name, code, and associated transport types.
/// Fetches data from the ODPT Operator endpoint, used to associate agencies
/// with bus, railway, or other transport services.
final operatorProvider =
    StateNotifierProvider<OperatorNotifier, CommonState<Operator>>(
      (ref) => OperatorNotifier(CommonRepositoryImpl.withOdptDefaults()),
    );
