class FlightDepartureInformation {
  final String id;
  final String type;
  final String context;
  final String date;
  final String valid;
  final String sameAs;
  final String airline;
  final String operator;
  final String? aircraftType;
  final List<String> flightNumber;
  final String? flightStatus;
  final String? departureGate;
  final String departureAirport;
  final String destinationAirport;
  final String? actualDepartureTime;
  final String scheduledDepartureTime;
  final String? terminal;

  const FlightDepartureInformation({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.valid,
    required this.sameAs,
    required this.airline,
    required this.operator,
    required this.aircraftType,
    required this.flightNumber,
    required this.flightStatus,
    required this.departureGate,
    required this.departureAirport,
    required this.destinationAirport,
    required this.actualDepartureTime,
    required this.scheduledDepartureTime,
    required this.terminal,
  });

  factory FlightDepartureInformation.fromJson(Map<String, dynamic> json) {
    return FlightDepartureInformation(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      valid: json['dct:valid'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      airline: json['odpt:airline'] as String? ?? '',
      operator: json['odpt:operator'] as String? ?? '',
      aircraftType: json['odpt:aircraftType'] as String?,
      flightNumber:
          (json['odpt:flightNumber'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      flightStatus: json['odpt:flightStatus'] as String?,
      departureGate: json['odpt:departureGate'] as String?,
      departureAirport: json['odpt:departureAirport'] as String? ?? '',
      destinationAirport: json['odpt:destinationAirport'] as String? ?? '',
      actualDepartureTime: json['odpt:actualDepartureTime'] as String?,
      scheduledDepartureTime:
          json['odpt:scheduledDepartureTime'] as String? ?? '',
      terminal: json['odpt:departureAirportTerminal'] as String?,
    );
  }
}
