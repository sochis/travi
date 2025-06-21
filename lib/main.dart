import 'package:flutter/material.dart';
import 'package:travi/app/app.dart';
import 'package:travi/core/utils/load_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiKeyProvider.loadKeys();

  // ignore: non_constant_identifier_names
  String ACCESS_TOKEN = const String.fromEnvironment("ACCESS_TOKEN");
  MapboxOptions.setAccessToken(ACCESS_TOKEN);

  runApp(const ProviderScope(child: MyApp()));
}
