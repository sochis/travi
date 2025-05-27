import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_base/features/map/domain/entities/flight_information.dart';
import 'package:flutter_base/features/map/infrastructure/repositories/flight_repository_impl.dart';
import 'package:flutter_base/core/network/api_result.dart';

class FlightArrivalState {
  final List<FlightInformation>? arrivals;
  final String? error;
  final bool isLoading;

  const FlightArrivalState({this.arrivals, this.error, this.isLoading = false});

  FlightArrivalState copyWith({
    List<FlightInformation>? arrivals,
    String? error,
    bool? isLoading,
  }) {
    return FlightArrivalState(
      arrivals: arrivals ?? this.arrivals,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class FlightArrivalNotifier extends StateNotifier<FlightArrivalState> {
  final FlightRepositoryImpl repository;

  FlightArrivalNotifier(this.repository) : super(const FlightArrivalState());

  Future<void> fetchFlights() async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await repository.fetchFlightArrivals();
    if (result is Success<List<FlightInformation>>) {
      state = state.copyWith(arrivals: result.data, isLoading: false);
    } else if (result is Failure<List<FlightInformation>>) {
      state = state.copyWith(error: result.error.message, isLoading: false);
    }
  }
}
