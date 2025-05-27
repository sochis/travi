import '../../../../core/network/api_result.dart';
import '../entities/flight_information.dart';

abstract class FlightRepository {
  Future<ApiResult<List<FlightInformation>>> fetchFlightArrivals();
}
