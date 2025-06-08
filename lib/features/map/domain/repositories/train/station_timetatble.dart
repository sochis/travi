class StationTimetable {
  final String id;
  final String type;
  final String context;
  final String date;
  final String issued;
  final String sameAs;
  final String railway;
  final String station;
  final String calendar;
  final String operatorName;
  final String railDirection;
  final List<StationTimetableObject> timetableObjects;

  StationTimetable({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.issued,
    required this.sameAs,
    required this.railway,
    required this.station,
    required this.calendar,
    required this.operatorName,
    required this.railDirection,
    required this.timetableObjects,
  });

  factory StationTimetable.fromJson(Map<String, dynamic> json) {
    return StationTimetable(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      issued: json['dct:issued'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      railway: json['odpt:railway'] as String? ?? '',
      station: json['odpt:station'] as String? ?? '',
      calendar: json['odpt:calendar'] as String? ?? '',
      operatorName: json['odpt:operator'] as String? ?? '',
      railDirection: json['odpt:railDirection'] as String? ?? '',
      timetableObjects:
          (json['odpt:stationTimetableObject'] as List?)
              ?.map((e) => StationTimetableObject.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class StationTimetableObject {
  final String train;
  final String trainType;
  final String trainNumber;
  final String departureTime;
  final List<String> destinationStation;

  StationTimetableObject({
    required this.train,
    required this.trainType,
    required this.trainNumber,
    required this.departureTime,
    required this.destinationStation,
  });

  factory StationTimetableObject.fromJson(Map<String, dynamic> json) {
    return StationTimetableObject(
      train: json['odpt:train'] as String? ?? '',
      trainType: json['odpt:trainType'] as String? ?? '',
      trainNumber: json['odpt:trainNumber'] as String? ?? '',
      departureTime: json['odpt:departureTime'] as String? ?? '',
      destinationStation:
          (json['odpt:destinationStation'] as List?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}
