import 'package:travi/features/map/controllers/map_controller.dart';
import 'package:travi/features/map/presentation/providers/location_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mapProvider = Provider<MapController>((ref) {
  return MapController(
    recenter: () {
      ref.read(locationProvider.notifier).refreshLocation();
    },
  );
});
