class AirportTerminalInformation {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final String airport;
  final Map<String, String> terminalTitle;

  const AirportTerminalInformation({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.airport,
    required this.terminalTitle,
  });

  factory AirportTerminalInformation.fromJson(Map<String, dynamic> json) {
    return AirportTerminalInformation(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      title: json['dc:title'] as String,
      sameAs: json['owl:sameAs'] as String,
      airport: json['odpt:airport'] as String,
      terminalTitle: Map<String, String>.from(
        json['odpt:airportTerminalTitle'] as Map,
      ),
    );
  }
}
