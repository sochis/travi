import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonState<T> {
  final List<T>? data;
  final String? error;
  final bool isLoading;

  const CommonState({this.data, this.error, this.isLoading = false});

  CommonState<T> copyWith({List<T>? data, String? error, bool? isLoading}) {
    return CommonState(
      data: data ?? this.data,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

abstract class CommonNotifier<T> extends StateNotifier<CommonState<T>> {
  CommonNotifier() : super(CommonState<T>());

  Future<List<T>> fetchFromRepository();

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await fetchFromRepository();
      state = state.copyWith(data: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
