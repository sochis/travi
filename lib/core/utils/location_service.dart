// location_service.dart

import 'package:geolocator/geolocator.dart';

/// A utility class to handle location-related operations using the geolocator package.
class LocationService {
  /// Returns the user's current location as a [Position] object.
  ///
  /// This method checks if location services are enabled and permissions are granted.
  /// If permissions are not yet granted, it will request them.
  ///
  /// Throws an [Exception] if location services are disabled, permission is denied,
  /// or permanently denied.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   final position = await LocationService.getCurrentLocation();
  ///   print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  /// } catch (e) {
  ///   print('Error: $e');
  /// }
  /// ```
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled on the device
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check and request location permission if needed
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission was denied.');
      }
    }

    // Handle case when permission is permanently denied
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission is permanently denied.');
    }

    // Get the current position using LocationSettings
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
    );

    return await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
  }
}
