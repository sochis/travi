class TrainTimetable {
  final String id;
  final String type;
  final String context;
  final String date;
  final String issued;
  final String train;
  final String sameAs;
  final String railway;
  final String calendar;
  final String operatorName;
  final String trainType;
  final String trainNumber;
  final List<String> originStation;
  final String railDirection;
  final List<String> destinationStation;
  final List<TrainTimetableObject> trainTimetableObject;

  TrainTimetable({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.issued,
    required this.train,
    required this.sameAs,
    required this.railway,
    required this.calendar,
    required this.operatorName,
    required this.trainType,
    required this.trainNumber,
    required this.originStation,
    required this.railDirection,
    required this.destinationStation,
    required this.trainTimetableObject,
  });

  factory TrainTimetable.fromJson(Map<String, dynamic> json) {
    return TrainTimetable(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      issued: json['dct:issued'] as String,
      train: json['odpt:train'] as String,
      sameAs: json['owl:sameAs'] as String,
      railway: json['odpt:railway'] as String,
      calendar: json['odpt:calendar'] as String,
      operatorName: json['odpt:operator'] as String,
      trainType: json['odpt:trainType'] as String,
      trainNumber: json['odpt:trainNumber'] as String,
      originStation:
          (json['odpt:originStation'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      railDirection: json['odpt:railDirection'] as String,
      destinationStation:
          (json['odpt:destinationStation'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      trainTimetableObject:
          (json['odpt:trainTimetableObject'] as List<dynamic>)
              .map(
                (e) => TrainTimetableObject.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}

class TrainTimetableObject {
  final String? departureTime;
  final String? departureStation;
  final String? arrivalStation;

  TrainTimetableObject({
    this.departureTime,
    this.departureStation,
    this.arrivalStation,
  });

  factory TrainTimetableObject.fromJson(Map<String, dynamic> json) {
    return TrainTimetableObject(
      departureTime: json['odpt:departureTime'] as String?,
      departureStation: json['odpt:departureStation'] as String?,
      arrivalStation: json['odpt:arrivalStation'] as String?,
    );
  }
}
