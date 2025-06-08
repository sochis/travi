class Operator {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final OperatorTitle operatorTitle;

  Operator({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.operatorTitle,
  });

  factory Operator.fromJson(Map<String, dynamic> json) {
    return Operator(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      title: json['dc:title'] as String,
      sameAs: json['owl:sameAs'] as String,
      operatorTitle: OperatorTitle.fromJson(json['odpt:operatorTitle']),
    );
  }
}

class OperatorTitle {
  final String en;
  final String ja;

  OperatorTitle({required this.en, required this.ja});

  factory OperatorTitle.fromJson(Map<String, dynamic> json) {
    return OperatorTitle(en: json['en'] as String, ja: json['ja'] as String);
  }
}
