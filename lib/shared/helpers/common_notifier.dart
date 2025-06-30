import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A generic state class used to represent the result of an async operation.
///
/// [T] is the type of data being managed.
class CommonState<T> {
  final List<T>? data;
  final String? error;
  final bool isLoading;

  const CommonState({this.data, this.error, this.isLoading = false});

  /// Creates a new instance of [CommonState] by copying the current one and
  /// optionally overriding individual fields.
  CommonState<T> copyWith({List<T>? data, String? error, bool? isLoading}) {
    return CommonState(
      data: data ?? this.data,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// A base class for managing state with [CommonState] using [StateNotifier].
///
/// It supports manual fetching of data as well as periodic polling.
///
/// To use it, extend this class and implement [fetchFromRepository].
abstract class CommonNotifier<T> extends StateNotifier<CommonState<T>> {
  CommonNotifier() : super(CommonState<T>());

  Timer? _timer;

  /// Implement this method in your subclass to fetch data from the repository.
  Future<List<T>> fetchFromRepository();

  /// Performs a one-time data fetch and updates the state accordingly.
  Future<void> fetch() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await fetchFromRepository();
      state = state.copyWith(data: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// Starts polling at the specified [interval] to continuously fetch data.
  ///
  /// The first fetch is immediate. If already polling, the previous timer is canceled.
  void startPolling({Duration interval = const Duration(seconds: 5)}) {
    _timer?.cancel(); // Cancel any existing timer
    fetch(); // Fetch immediately before starting the interval
    _timer = Timer.periodic(interval, (_) => fetch());
  }

  /// Stops the polling timer if it is running.
  void stopPolling() {
    _timer?.cancel();
    _timer = null;
  }

  /// Called automatically by Riverpod when this notifier is disposed.
  ///
  /// Cancels any running timers to avoid memory leaks.
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
