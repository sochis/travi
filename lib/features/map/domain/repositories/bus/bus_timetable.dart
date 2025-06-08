class BusTimetable {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String note;
  final String sameAs;
  final String calendar;
  final String operator;
  final String busroutePattern;
  final List<BusTimetableObject> busTimetableObject;

  const BusTimetable({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.note,
    required this.sameAs,
    required this.calendar,
    required this.operator,
    required this.busroutePattern,
    required this.busTimetableObject,
  });

  factory BusTimetable.fromJson(Map<String, dynamic> json) {
    return BusTimetable(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      title: json['dc:title'] as String? ?? '',
      note: json['odpt:note'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      calendar: json['odpt:calendar'] as String? ?? '',
      operator: json['odpt:operator'] as String? ?? '',
      busroutePattern: json['odpt:busroutePattern'] as String? ?? '',
      busTimetableObject:
          (json['odpt:busTimetableObject'] as List<dynamic>? ?? [])
              .map(
                (item) =>
                    BusTimetableObject.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}

class BusTimetableObject {
  final String note;
  final int index;
  final bool canGetOn;
  final bool canGetOff;
  final bool isMidnight;
  final String arrivalTime;
  final String departureTime;
  final String busstopPole;
  final bool? isNonStepBus;
  final String? destinationSign;

  const BusTimetableObject({
    required this.note,
    required this.index,
    required this.canGetOn,
    required this.canGetOff,
    required this.isMidnight,
    required this.arrivalTime,
    required this.departureTime,
    required this.busstopPole,
    this.isNonStepBus,
    this.destinationSign,
  });

  factory BusTimetableObject.fromJson(Map<String, dynamic> json) {
    return BusTimetableObject(
      note: json['odpt:note'] as String? ?? '',
      index: json['odpt:index'] as int? ?? 0,
      canGetOn: json['odpt:canGetOn'] as bool? ?? false,
      canGetOff: json['odpt:canGetOff'] as bool? ?? false,
      isMidnight: json['odpt:isMidnight'] as bool? ?? false,
      arrivalTime: json['odpt:arrivalTime'] as String? ?? '',
      departureTime: json['odpt:departureTime'] as String? ?? '',
      busstopPole: json['odpt:busstopPole'] as String? ?? '',
      isNonStepBus: json['odpt:isNonStepBus'] as bool?,
      destinationSign: json['odpt:destinationSign'] as String?,
    );
  }
}
