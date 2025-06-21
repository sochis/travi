import 'package:travi/core/utils/location_service.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationProvider = AsyncNotifierProvider<LocationNotifier, geo.Position>(
  LocationNotifier.new,
);

class LocationNotifier extends AsyncNotifier<geo.Position> {
  @override
  Future<geo.Position> build() => LocationService.getCurrentLocation();

  Future<void> refreshLocation() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => LocationService.getCurrentLocation());
  }
}
