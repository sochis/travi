import 'package:flutter_base/features/map/infrastructure/repositories/flight_repository_impl.dart';
import 'package:flutter_base/features/map/presentation/presenters/flight_presenter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flightArrivalProvider =
    StateNotifierProvider<FlightArrivalNotifier, FlightArrivalState>((ref) {
      return FlightArrivalNotifier(FlightRepositoryImpl.withOdptDefaults());
    });
