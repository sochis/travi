class TrainInformation {
  final String id;
  final String type;
  final String context;
  final String date;
  final String valid;
  final String sameAs;
  final String railway;
  final String operatorName;
  final DateTime timeOfOrigin;
  final Map<String, String> trainInformationText;

  TrainInformation({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.valid,
    required this.sameAs,
    required this.railway,
    required this.operatorName,
    required this.timeOfOrigin,
    required this.trainInformationText,
  });

  factory TrainInformation.fromJson(Map<String, dynamic> json) {
    return TrainInformation(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      valid: json['dct:valid'] as String,
      sameAs: json['owl:sameAs'] as String,
      railway: json['odpt:railway'] as String,
      operatorName: json['odpt:operator'] as String,
      timeOfOrigin: DateTime.parse(json['odpt:timeOfOrigin'] as String),
      trainInformationText: Map<String, String>.from(
        json['odpt:trainInformationText'],
      ),
    );
  }
}
