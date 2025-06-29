import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:travi/core/utils/map_utils.dart';
import 'package:travi/features/map/controllers/map_controller.dart';
import 'package:travi/features/map/presentation/providers/location_provider.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});
  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  MapboxMap? _mapboxMap;
  final _mapFollowController = MapFollowController();

  @override
  void dispose() {
    _mapFollowController.dispose();
    super.dispose();
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
          _mapFollowController.startFollowing(map);
        },
        onScrollListener: (_) => _mapFollowController.stopFollowing(),
        onZoomListener: (_) => _mapFollowController.stopFollowing(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.my_location),
        onPressed: () async {
          await goToCurrentLocation(map: _mapboxMap);
          _mapFollowController.startFollowing(_mapboxMap);
        },
      ),
    );
  }
}
