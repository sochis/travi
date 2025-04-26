import 'dart:convert';
import 'package:http/http.dart' as http;
import '../exceptions/network_exception.dart';
import '../interfaces/i_network_service.dart';
import '../../config/app_config.dart';

class NetworkService implements INetworkService {
  final http.Client _client = http.Client();
  final String _baseUrl = AppConfig.current.baseUrl;

  @override
  Future<T> get<T>(String endpoint) async {
    final http.Response response = await _client.get(
      Uri.parse('$_baseUrl$endpoint'),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body) as T;
    } else {
      throw NetworkException('Failed to fetch data', code: response.statusCode);
    }
  }

  @override
  Future<T> post<T>(String endpoint, {Map<String, dynamic>? data}) async {
    final http.Response response = await _client.post(
      Uri.parse('$_baseUrl$endpoint'),
      body: json.encode(data),
      headers: <String, String>{'Content-Type': 'application/json'},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body) as T;
    } else {
      throw NetworkException('Failed to post data', code: response.statusCode);
    }
  }
}
