import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:travi/core/utils/map_utils.dart';

class MapController {
  final void Function() recenter;

  MapController({required this.recenter});
}

class MapFollowController {
  bool isFollowing = false;
  Timer? _timer;

  void startFollowing(MapboxMap? map) {
    isFollowing = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (!isFollowing) return;
      await goToCurrentLocation(map: map);
    });
  }

  void stopFollowing() {
    if (isFollowing) debugPrint('🛑 User following disabled');
    isFollowing = false;
  }

  void dispose() {
    _timer?.cancel();
  }
}
