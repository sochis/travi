import 'dart:convert';
import 'package:flutter/services.dart';

class ApiKeyProvider {
  static Map<String, dynamic>? _keys;

  static Future<void> loadKeys() async {
    final jsonStr = await rootBundle.loadString('assets/config/api_keys.json');
    _keys = json.decode(jsonStr);
  }

  static String get odptApiKey {
    if (_keys == null) {
      throw Exception(
        'API keys not loaded. Call ApiKeyProvider.loadKeys() first.',
      );
    }
    return _keys!['odpt_api_key'];
  }
}
