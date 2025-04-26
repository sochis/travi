import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 必要に応じてログやステート処理を追加
    if (kDebugMode) {
      print('AppLifecycleState changed to $state');
    }
  }
}
