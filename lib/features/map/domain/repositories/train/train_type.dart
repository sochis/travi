class TrainType {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final String operatorName;
  final Map<String, String> trainTypeTitle;

  TrainType({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.operatorName,
    required this.trainTypeTitle,
  });

  factory TrainType.fromJson(Map<String, dynamic> json) {
    return TrainType(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      title: json['dc:title'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      operatorName: json['odpt:operator'] as String? ?? '',
      trainTypeTitle:
          (json['odpt:trainTypeTitle'] != null &&
              json['odpt:trainTypeTitle'] is Map)
          ? Map<String, String>.from(json['odpt:trainTypeTitle'])
          : <String, String>{},
    );
  }
}
