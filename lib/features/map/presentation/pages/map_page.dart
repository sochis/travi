import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  CameraOptions camera = CameraOptions(
    center: Point(coordinates: Position(-98.0, 39.5)),
    zoom: 2,
    bearing: 0,
    pitch: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('グルメマップ')),
      body: MapWidget(cameraOptions: camera),
    );
  }
}
