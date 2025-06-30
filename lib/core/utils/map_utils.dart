import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:travi/core/utils/location_service.dart';
import 'package:travi/core/utils/logger.dart';
import 'package:travi/features/map/domain/repositories/bus/bus_information.dart';
import 'package:travi/shared/helpers/common_notifier.dart';

/// Moves the camera to the specified latitude and longitude with animation.
///
/// [map] - The MapboxMap instance.
/// [latitude] - Target latitude.
/// [longitude] - Target longitude.
/// [zoom] - Optional zoom level (default is 14).
/// [durationMs] - Duration of the animation in milliseconds (default is 1000ms).
void moveCameraTo({
  required MapboxMap? map,
  required double latitude,
  required double longitude,
  double zoom = 14,
  int durationMs = 1000,
}) {
  if (map == null) return;

  map.flyTo(
    CameraOptions(
      center: Point(coordinates: Position(longitude, latitude)),
      zoom: zoom,
    ),
    MapAnimationOptions(duration: durationMs),
  );
}

/// Moves the camera to the user's current location and places a marker (symbol) there.
///
/// [map] - The MapboxMap instance.
/// [zoom] - Optional zoom level (default: 14).
/// [durationMs] - Duration of camera animation in milliseconds (default: 1000).
Future<void> goToCurrentLocation({
  required MapboxMap? map,
  double zoom = 14,
  int durationMs = 1000,
}) async {
  if (map == null) return;

  try {
    final position = await LocationService.getCurrentLocation();

    // Move camera to current location
    moveCameraTo(
      map: map,
      latitude: position.latitude,
      longitude: position.longitude,
      zoom: zoom,
      durationMs: durationMs,
    );
  } catch (e) {
    // Handle error (e.g., location permissions denied)
    Logger.error('Error getting current location: $e');
  }
}

/// Adds multiple markers to the map using PointAnnotationManager.
///
/// This function takes a list of marker data—each consisting of geometry and an icon image—and
/// adds them to the provided Mapbox map instance.
///
/// Example usage:
/// ```dart
/// final markers = [
///   {
///     'geometry': Point(coordinates: Position(-122.4194, 37.7749)), // San Francisco
///     'iconImage': 'marker-15',
///   },
///   {
///     'geometry': Point(coordinates: Position(-74.0060, 40.7128)), // New York
///     'iconImage': 'marker-15',
///   },
/// ];
///
/// await addMultipleMarkers(mapboxMap, markers);
/// ```
///
/// Parameters:
/// - [mapboxMap]: The MapboxMap instance to add the markers to.
/// - [markerData]: A list of maps, each containing:
///   - `geometry`: A `Point` representing the location
///   - `iconImage`: A `String?` representing the marker icon image
///      - reference: https://labs.mapbox.com/maki-icons/'
Future<void> addMultipleMarkers(
  MapboxMap mapboxMap,
  List<Map<String, dynamic>> markerData,
) async {
  final manager = await mapboxMap.annotations.createPointAnnotationManager();

  final options = markerData.map((data) {
    return PointAnnotationOptions(
      geometry: data['geometry'] as Point,
      iconImage: data['iconImage'] as String?,
    );
  }).toList();

  await manager.createMulti(options);
}

/// Displays bus markers on the map after clearing existing ones.
///
/// This utility function deletes all existing markers managed by the given
/// [PointAnnotationManager] and adds new markers based on the provided
/// [busState] data. It returns the manager used, which can be stored and reused
/// in future calls to avoid creating multiple managers.
///
/// This function helps prevent memory leaks or duplicate markers by ensuring
/// that previous markers are cleared before adding new ones.
///
/// Parameters:
/// - [mapboxMap]: The MapboxMap instance where markers will be displayed.
/// - [busState]: A CommonState object containing a list of BusInformation.
/// - [currentManager]: The currently active PointAnnotationManager, if any.
///
/// Returns:
/// - A Future that completes with a PointAnnotationManager instance used to
///   manage the newly added markers.
Future<PointAnnotationManager?> showBusMarkersWithClear({
  required MapboxMap mapboxMap,
  required CommonState<BusInformation>? busState,
  required PointAnnotationManager? currentManager,
}) async {
  if (busState?.data == null) return currentManager;

  // Remove all existing markers
  await currentManager?.deleteAll();

  // Create a manager if one doesn't exist
  final manager =
      currentManager ??
      await mapboxMap.annotations.createPointAnnotationManager();

  // Build new marker options from bus data
  final markerData = busState!.data!.map((bus) {
    return PointAnnotationOptions(
      geometry: Point(coordinates: Position(bus.longitude, bus.latitude)),
      iconImage: 'bus',
    );
  }).toList();

  // Add new markers to the map
  await manager.createMulti(markerData);

  return manager;
}
