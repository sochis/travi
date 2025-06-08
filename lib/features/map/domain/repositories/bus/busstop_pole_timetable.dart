class BusstopPoleTimetable {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final List<String> busroute;
  final String calendar;
  final String operatorName;
  final String busstopPole;
  final String busDirection;
  final List<BusstopPoleTimetableObject> timetableObjects;

  BusstopPoleTimetable({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.busroute,
    required this.calendar,
    required this.operatorName,
    required this.busstopPole,
    required this.busDirection,
    required this.timetableObjects,
  });

  factory BusstopPoleTimetable.fromJson(Map<String, dynamic> json) {
    return BusstopPoleTimetable(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      title: json['dc:title'] as String,
      sameAs: json['owl:sameAs'] as String,
      busroute: List<String>.from(json['odpt:busroute']),
      calendar: json['odpt:calendar'] as String,
      operatorName: json['odpt:operator'] as String,
      busstopPole: json['odpt:busstopPole'] as String,
      busDirection: json['odpt:busDirection'] as String,
      timetableObjects:
          (json['odpt:busstopPoleTimetableObject'] as List)
              .map((e) => BusstopPoleTimetableObject.fromJson(e))
              .toList(),
    );
  }
}

class BusstopPoleTimetableObject {
  final String note;
  final bool isMidnight;
  final String departureTime;
  final String busroutePattern;
  final String destinationSign;
  final String destinationBusstopPole;

  BusstopPoleTimetableObject({
    required this.note,
    required this.isMidnight,
    required this.departureTime,
    required this.busroutePattern,
    required this.destinationSign,
    required this.destinationBusstopPole,
  });

  factory BusstopPoleTimetableObject.fromJson(Map<String, dynamic> json) {
    return BusstopPoleTimetableObject(
      note: json['odpt:note'] as String,
      isMidnight: json['odpt:isMidnight'] as bool,
      departureTime: json['odpt:departureTime'] as String,
      busroutePattern: json['odpt:busroutePattern'] as String,
      destinationSign: json['odpt:destinationSign'] as String,
      destinationBusstopPole: json['odpt:destinationBusstopPole'] as String,
    );
  }
}
