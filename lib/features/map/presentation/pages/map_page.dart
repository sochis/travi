import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:travi/core/utils/map_utils.dart';
import 'package:travi/features/map/controllers/map_controller.dart';
import 'package:travi/features/map/domain/repositories/bus/bus_information.dart';
import 'package:travi/features/map/presentation/providers/location_provider.dart';
import 'package:travi/features/map/presentation/providers/bus_provider.dart';
import 'package:travi/shared/helpers/common_notifier.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});
  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  MapboxMap? _mapboxMap;
  final _mapFollowController = MapFollowController();
  PointAnnotationManager? _busMarkerManager;

  @override
  void initState() {
    super.initState();

    // Start bus location polling
    Future.microtask(() {
      ref.read(busProvider.notifier).startPolling();
    });
  }

  @override
  void dispose() {
    _busMarkerManager?.deleteAll();
    _mapFollowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = ref.watch(locationProvider);
    final fallbackCam = CameraOptions(
      center: Point(coordinates: Position(138.2529, 36.2048)),
      zoom: 14,
    );

    // Listen to changes in bus state and update markers
    ref.listen<CommonState<BusInformation>>(busProvider, (prev, next) async {
      if (_mapboxMap != null) {
        _busMarkerManager = await showBusMarkersWithClear(
          mapboxMap: _mapboxMap!,
          busState: next,
          currentManager: _busMarkerManager,
        );
      }
    });

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
