class AirportInformation {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final Map<String, String> airportTitle;

  const AirportInformation({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.airportTitle,
  });

  factory AirportInformation.fromJson(Map<String, dynamic> json) {
    return AirportInformation(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      title: json['dc:title'] as String,
      sameAs: json['owl:sameAs'] as String,
      airportTitle: Map<String, String>.from(json['odpt:airportTitle'] as Map),
    );
  }
}
