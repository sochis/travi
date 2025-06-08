class PassengerSurvey {
  final String id;
  final String type;
  final String context;
  final String date;
  final String sameAs;
  final List<String> railway;
  final List<String> station;
  final String operatorName;
  final bool includeAlighting;
  final List<PassengerSurveyObject> passengerSurveyObject;

  PassengerSurvey({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.sameAs,
    required this.railway,
    required this.station,
    required this.operatorName,
    required this.includeAlighting,
    required this.passengerSurveyObject,
  });

  factory PassengerSurvey.fromJson(Map<String, dynamic> json) {
    return PassengerSurvey(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      railway:
          (json['odpt:railway'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      station:
          (json['odpt:station'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      operatorName: json['odpt:operator'] as String? ?? '',
      includeAlighting: json['odpt:includeAlighting'] as bool? ?? false,
      passengerSurveyObject:
          (json['odpt:passengerSurveyObject'] as List<dynamic>?)
              ?.map((e) => PassengerSurveyObject.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class PassengerSurveyObject {
  final int surveyYear;
  final int passengerJourneys;

  PassengerSurveyObject({
    required this.surveyYear,
    required this.passengerJourneys,
  });

  factory PassengerSurveyObject.fromJson(Map<String, dynamic> json) {
    return PassengerSurveyObject(
      surveyYear: json['odpt:surveyYear'] as int? ?? 0,
      passengerJourneys: json['odpt:passengerJourneys'] as int? ?? 0,
    );
  }
}
