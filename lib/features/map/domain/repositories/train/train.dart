class Train {
  final String id;
  final String type;
  final String context;
  final String date;
  final String valid;
  final int delay;
  final String sameAs;
  final String railway;
  final String operatorName;
  final String? toStation; // nullable
  final String trainType;
  final String trainOwner;
  final String fromStation;
  final String trainNumber;
  final List<String> originStation;
  final String railDirection;
  final List<String> destinationStation;

  Train({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.valid,
    required this.delay,
    required this.sameAs,
    required this.railway,
    required this.operatorName,
    this.toStation,
    required this.trainType,
    required this.trainOwner,
    required this.fromStation,
    required this.trainNumber,
    required this.originStation,
    required this.railDirection,
    required this.destinationStation,
  });

  factory Train.fromJson(Map<String, dynamic> json) {
    int parseDelay(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) {
        return int.tryParse(value) ?? 0;
      }
      return 0;
    }

    return Train(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      valid: json['dct:valid'] as String? ?? '',
      delay: parseDelay(json['odpt:delay']),
      sameAs: json['owl:sameAs'] as String? ?? '',
      railway: json['odpt:railway'] as String? ?? '',
      operatorName: json['odpt:operator'] as String? ?? '',
      toStation: json['odpt:toStation'] as String?,
      trainType: json['odpt:trainType'] as String? ?? '',
      trainOwner: json['odpt:trainOwner'] as String? ?? '',
      fromStation: json['odpt:fromStation'] as String? ?? '',
      trainNumber: json['odpt:trainNumber'] as String? ?? '',
      originStation:
          (json['odpt:originStation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      railDirection: json['odpt:railDirection'] as String? ?? '',
      destinationStation:
          (json['odpt:destinationStation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}
