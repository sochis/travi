import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:travi/core/utils/map_utils.dart';
import 'package:travi/features/map/presentation/providers/location_provider.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});
  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  MapboxMap? _mapboxMap;
  bool _isFollowing = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startFollowing() {
    _isFollowing = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (!_isFollowing) return;
      await goToCurrentLocation(map: _mapboxMap);
    });
  }

  void _stopFollowing() {
    if (_isFollowing) debugPrint('🛑 User following disabled');
    _isFollowing = false;
  }

  @override
  Widget build(BuildContext context) {
    final loc = ref.watch(locationProvider);
    final fallbackCam = CameraOptions(
      center: Point(coordinates: Position(138.2529, 36.2048)),
      zoom: 5,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loc.whenOrNull(
        data: (_) async {
          await goToCurrentLocation(map: _mapboxMap, durationMs: 0);
        },
      );
    });

    return Scaffold(
      body: MapWidget(
        key: const ValueKey('map'),
        cameraOptions: fallbackCam,
        onMapCreated: (map) async {
          _mapboxMap = map;
          await map.location.updateSettings(
            LocationComponentSettings(
              enabled: true,
              puckBearingEnabled: true,
              pulsingEnabled: true,
              showAccuracyRing: true,
              locationPuck: LocationPuck(
                locationPuck2D: DefaultLocationPuck2D(),
              ),
            ),
          );
        },
        // Stop following when user interacts with the map by scrolling or zooming.
        onScrollListener: (_) => _stopFollowing(),
        onZoomListener: (_) => _stopFollowing(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.my_location),
        onPressed: () async {
          await goToCurrentLocation(map: _mapboxMap);
          _startFollowing();
        },
      ),
    );
  }
}
