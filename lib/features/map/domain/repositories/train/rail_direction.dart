class RailDirection {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final String operatorName;
  final Map<String, String> railDirectionTitle;

  RailDirection({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.operatorName,
    required this.railDirectionTitle,
  });

  factory RailDirection.fromJson(Map<String, dynamic> json) {
    return RailDirection(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      title: json['dc:title'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      operatorName: json['odpt:operator'] as String? ?? '',
      railDirectionTitle: (json['odpt:railDirectionTitle'] as Map?) != null
          ? Map<String, String>.from(json['odpt:railDirectionTitle'] as Map)
          : {},
    );
  }
}
