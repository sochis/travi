import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseViewModel extends StateNotifier<void> {
  BaseViewModel() : super(null);

  // Common cleanup logic
  void disposeResources() {}
}
