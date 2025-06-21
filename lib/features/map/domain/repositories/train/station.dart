class Station {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final String railway;
  final String operatorName;
  final StationTitle stationTitle;

  Station({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.railway,
    required this.operatorName,
    required this.stationTitle,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      title: json['dc:title'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      railway: json['odpt:railway'] as String? ?? '',
      operatorName: json['odpt:operator'] as String? ?? '',
      stationTitle: json['odpt:stationTitle'] != null
          ? StationTitle.fromJson(
              json['odpt:stationTitle'] as Map<String, dynamic>,
            )
          : StationTitle(en: '', ja: ''),
    );
  }
}

class StationTitle {
  final String en;
  final String ja;

  StationTitle({required this.en, required this.ja});

  factory StationTitle.fromJson(Map<String, dynamic> json) {
    return StationTitle(
      en: json['en'] as String? ?? '',
      ja: json['ja'] as String? ?? '',
    );
  }
}
