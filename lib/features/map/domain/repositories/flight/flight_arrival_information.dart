class FlightArrivalInformation {
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
  final String originAirport;
  final String arrivalAirport;
  final String? actualArrivalTime;
  final String scheduledArrivalTime;
  final String? terminal;

  const FlightArrivalInformation({
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
    required this.originAirport,
    required this.arrivalAirport,
    required this.actualArrivalTime,
    required this.scheduledArrivalTime,
    required this.terminal,
  });

  factory FlightArrivalInformation.fromJson(Map<String, dynamic> json) {
    return FlightArrivalInformation(
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
      originAirport: json['odpt:originAirport'] as String? ?? '',
      arrivalAirport: json['odpt:arrivalAirport'] as String? ?? '',
      actualArrivalTime: json['odpt:actualArrivalTime'] as String?,
      scheduledArrivalTime: json['odpt:scheduledArrivalTime'] as String? ?? '',
      terminal: json['odpt:arrivalAirportTerminal'] as String?,
    );
  }
}
