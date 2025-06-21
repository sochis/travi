import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:travi/core/utils/location_service.dart';
import 'package:travi/features/map/presentation/providers/location_provider.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  MapboxMap? _mapboxMap;

  void _moveCameraTo(double latitude, double longitude) {
    _mapboxMap?.flyTo(
      CameraOptions(
        center: Point(coordinates: Position(longitude, latitude)),
        zoom: 14,
      ),
      MapAnimationOptions(duration: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationAsync = ref.watch(locationProvider);

    // Fallback camera position (e.g., center of Japan)
    final fallbackCamera = CameraOptions(
      center: Point(coordinates: Position(138.2529, 36.2048)),
      zoom: 5,
    );

    // Move camera if location data is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locationAsync.whenOrNull(
        data: (position) {
          _moveCameraTo(position.latitude, position.longitude);
        },
      );
    });

    return Scaffold(
      body: MapWidget(
        cameraOptions: fallbackCamera,
        onMapCreated: (map) => _mapboxMap = map,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final position = await LocationService.getCurrentLocation();
          _moveCameraTo(position.latitude, position.longitude);
        },
        tooltip: 'Move to current location',
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
