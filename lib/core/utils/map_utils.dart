import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:travi/core/utils/location_service.dart';
import 'package:travi/core/utils/logger.dart';

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
    Logger.log('Error getting current location: $e');
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
