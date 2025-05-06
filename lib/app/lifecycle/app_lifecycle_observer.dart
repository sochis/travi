import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Add procedure for logs and states as needed.
    if (kDebugMode) {
      print('AppLifecycleState changed to $state');
    }
  }
}
