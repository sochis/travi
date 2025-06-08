class FlightStatusTitle {
  final String en;
  final String ja;

  const FlightStatusTitle({required this.en, required this.ja});

  factory FlightStatusTitle.fromJson(Map<String, dynamic> json) {
    return FlightStatusTitle(
      en: json['en'] as String? ?? '',
      ja: json['ja'] as String? ?? '',
    );
  }
}

class FlightStatus {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final FlightStatusTitle flightStatusTitle;

  const FlightStatus({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.flightStatusTitle,
  });

  factory FlightStatus.fromJson(Map<String, dynamic> json) {
    return FlightStatus(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      title: json['dc:title'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      flightStatusTitle: FlightStatusTitle.fromJson(
        (json['odpt:flightStatusTitle'] as Map<String, dynamic>? ?? {}),
      ),
    );
  }
}
