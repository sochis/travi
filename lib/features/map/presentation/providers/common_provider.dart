import 'package:flutter_base/features/map/domain/repositories/common/calendar.dart';
import 'package:flutter_base/features/map/domain/repositories/common/operator.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/common_repository_impl.dart';
import 'package:flutter_base/features/map/presentation/presenters/common_presenter.dart';
import 'package:flutter_base/shared/helpers/common_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarProvider =
    StateNotifierProvider<CalendarNotifier, CommonState<Calendar>>(
      (ref) => CalendarNotifier(CommonRepositoryImpl.withOdptDefaults()),
    );

final operatorProvider =
    StateNotifierProvider<OperatorNotifier, CommonState<Operator>>(
      (ref) => OperatorNotifier(CommonRepositoryImpl.withOdptDefaults()),
    );
