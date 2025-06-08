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
    DateTime parsedTime;
    try {
      final timeStr = json['odpt:timeOfOrigin'] as String?;
      parsedTime =
          (timeStr != null && timeStr.isNotEmpty)
              ? DateTime.parse(timeStr)
              : DateTime.fromMillisecondsSinceEpoch(0);
    } catch (_) {
      parsedTime = DateTime.fromMillisecondsSinceEpoch(0);
    }

    return TrainInformation(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      valid: json['dct:valid'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      railway: json['odpt:railway'] as String? ?? '',
      operatorName: json['odpt:operator'] as String? ?? '',
      timeOfOrigin: parsedTime,
      trainInformationText:
          (json['odpt:trainInformationText'] != null &&
                  json['odpt:trainInformationText'] is Map)
              ? Map<String, String>.from(json['odpt:trainInformationText'])
              : <String, String>{},
    );
  }
}
