import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define providers for services or repositories that are used throughout the app

final Provider<String> exampleServiceProvider = Provider<String>((Ref ref) {
  // Inject a mock service
  return 'Injected Service';
});
