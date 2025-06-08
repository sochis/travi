class BusInformation {
  final String id;
  final String type;
  final String context;
  final String date;
  final double latitude;
  final double longitude;
  final String valid;
  final String sameAs;
  final double azimuth;
  final String busRoute;
  final String operator;
  final String busNumber;
  final int frequency;
  final String busTimetable;
  final String toBusstopPole;
  final String busRoutePattern;
  final String fromBusstopPole;
  final String occupancyStatus;
  final String startingBusstopPole;
  final String terminalBusstopPole;

  const BusInformation({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.latitude,
    required this.longitude,
    required this.valid,
    required this.sameAs,
    required this.azimuth,
    required this.busRoute,
    required this.operator,
    required this.busNumber,
    required this.frequency,
    required this.busTimetable,
    required this.toBusstopPole,
    required this.busRoutePattern,
    required this.fromBusstopPole,
    required this.occupancyStatus,
    required this.startingBusstopPole,
    required this.terminalBusstopPole,
  });

  factory BusInformation.fromJson(Map<String, dynamic> json) {
    return BusInformation(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      latitude: (json['geo:lat'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['geo:long'] as num?)?.toDouble() ?? 0.0,
      valid: json['dct:valid'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      azimuth: (json['odpt:azimuth'] as num?)?.toDouble() ?? 0.0,
      busRoute: json['odpt:busroute'] as String? ?? '',
      operator: json['odpt:operator'] as String? ?? '',
      busNumber: json['odpt:busNumber'].toString(),
      frequency: json['odpt:frequency'] as int? ?? 0,
      busTimetable: json['odpt:busTimetable'] as String? ?? '',
      toBusstopPole: json['odpt:toBusstopPole'] as String? ?? '',
      busRoutePattern: json['odpt:busroutePattern'] as String? ?? '',
      fromBusstopPole: json['odpt:fromBusstopPole'] as String? ?? '',
      occupancyStatus: json['odpt:occupancyStatus'] as String? ?? '',
      startingBusstopPole: json['odpt:startingBusstopPole'] as String? ?? '',
      terminalBusstopPole: json['odpt:terminalBusstopPole'] as String? ?? '',
    );
  }
}
