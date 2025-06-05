class FlightScheduleObject {
  final String airline;
  final String isValidTo;
  final String isValidFrom;
  final String originTime;
  final String destinationTime;
  final String aircraftType;
  final List<String> flightNumber;

  const FlightScheduleObject({
    required this.airline,
    required this.isValidTo,
    required this.isValidFrom,
    required this.originTime,
    required this.destinationTime,
    required this.aircraftType,
    required this.flightNumber,
  });

  factory FlightScheduleObject.fromJson(Map<String, dynamic> json) {
    return FlightScheduleObject(
      airline: json['odpt:airline'] as String,
      isValidTo: json['odpt:isValidTo'] as String,
      isValidFrom: json['odpt:isValidFrom'] as String,
      originTime: json['odpt:originTime'] as String,
      destinationTime: json['odpt:destinationTime'] as String,
      aircraftType: json['odpt:aircraftType'] as String,
      flightNumber:
          (json['odpt:flightNumber'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
    );
  }
}

class FlightSchedule {
  final String id;
  final String type;
  final String context;
  final String date;
  final String sameAs;
  final String calendar;
  final String operator;
  final String originAirport;
  final String destinationAirport;
  final List<FlightScheduleObject> flightScheduleObjects;

  const FlightSchedule({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.sameAs,
    required this.calendar,
    required this.operator,
    required this.originAirport,
    required this.destinationAirport,
    required this.flightScheduleObjects,
  });

  factory FlightSchedule.fromJson(Map<String, dynamic> json) {
    return FlightSchedule(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      sameAs: json['owl:sameAs'] as String,
      calendar: json['odpt:calendar'] as String,
      operator: json['odpt:operator'] as String,
      originAirport: json['odpt:originAirport'] as String,
      destinationAirport: json['odpt:destinationAirport'] as String,
      flightScheduleObjects:
          (json['odpt:flightScheduleObject'] as List<dynamic>)
              .map(
                (e) => FlightScheduleObject.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}
