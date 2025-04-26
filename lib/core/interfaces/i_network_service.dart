abstract class INetworkService {
  Future<T> get<T>(String endpoint);
  Future<T> post<T>(String endpoint, {Map<String, dynamic>? data});
}
