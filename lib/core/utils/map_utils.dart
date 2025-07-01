import 'package:flutter/services.dart';
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

/// A utility class for loading and caching images from the asset bundle.
///
/// This class helps avoid redundant image decoding by caching loaded images
/// in memory, indexed by their asset path. This is especially useful when
/// the same image is used multiple times in the UI (e.g., for map markers).
class ImageCacheLoader {
  /// Internal cache that maps asset paths to their loaded image data.
  static final Map<String, Uint8List> _cache = {};

  /// Loads an image from the asset bundle and caches it in memory.
  ///
  /// If the image has already been loaded before, the cached version
  /// is returned immediately without reloading from the asset bundle.
  ///
  /// Example:
  /// ```dart
  /// final busImage = await ImageCacheLoader.load('assets/images/bus.png');
  /// ```
  ///
  /// [assetPath] - The asset path of the image to load.
  /// Returns a [Uint8List] representing the image data.
  static Future<Uint8List> load(String assetPath) async {
    if (_cache.containsKey(assetPath)) return _cache[assetPath]!;

    final bytes = await rootBundle.load(assetPath);
    final imageData = bytes.buffer.asUint8List();
    _cache[assetPath] = imageData;
    return imageData;
  }

  /// Clears all cached image data from memory.
  ///
  /// This can be useful if you want to manually free up memory
  /// or reload images with updated content.
  static void clearCache() {
    _cache.clear();
  }
}

/// Adds multiple custom image markers to a Mapbox map using PointAnnotationManager.
///
/// This function takes a list of marker data where each entry includes a geometry (location)
/// and an image (as a Uint8List) to be used as the icon for the marker. It then creates
/// and adds these markers to the provided MapboxMap instance.
///
/// Each item in [markerData] should be a map containing:
/// - `geometry`: a `Point` object representing the geographic location of the marker
/// - `image`: a `Uint8List` containing the image data to be used as the marker icon
///
/// Example:
/// ```dart
/// final ByteData imageData = await rootBundle.load('assets/icons/bus.png');
/// final markers = [
///   {
///     'geometry': Point(coordinates: Position(139.7671, 35.6812)),
///     'image': imageData.buffer.asUint8List(),
///   },
/// ];
/// await addMultipleMarkers(mapboxMap, markers);
/// ```
///
/// [mapboxMap] - The MapboxMap instance to which the markers will be added.
/// [markerData] - A list of maps containing marker geometry and icon image.
Future<void> addMultipleMarkers(
  MapboxMap mapboxMap,
  List<Map<String, dynamic>> markerData,
) async {
  final manager = await mapboxMap.annotations.createPointAnnotationManager();

  final options = markerData.map((data) {
    return PointAnnotationOptions(
      geometry: data['geometry'] as Point,
      image: data['image'] as Uint8List?,
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
/// - [image]: The image data (Uint8List) to be used as the marker icon.
///
/// Returns:
/// - A Future that completes with a PointAnnotationManager instance used to
///   manage the newly added markers.
Future<PointAnnotationManager?> showBusMarkersWithClear({
  required MapboxMap mapboxMap,
  required CommonState<BusInformation>? busState,
  required PointAnnotationManager? currentManager,
  required Uint8List image,
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
      image: image,
    );
  }).toList();

  // Add new markers to the map
  await manager.createMulti(markerData);

  return manager;
}
