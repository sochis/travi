class RailwayFare {
  final String id;
  final String type;
  final String context;
  final String date;
  final String issued;
  final String sameAs;
  final String operatorName;
  final String toStation;
  final int icCardFare;
  final int ticketFare;
  final String fromStation;
  final int childIcCardFare;
  final int childTicketFare;

  RailwayFare({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.issued,
    required this.sameAs,
    required this.operatorName,
    required this.toStation,
    required this.icCardFare,
    required this.ticketFare,
    required this.fromStation,
    required this.childIcCardFare,
    required this.childTicketFare,
  });

  factory RailwayFare.fromJson(Map<String, dynamic> json) {
    return RailwayFare(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      issued: json['dct:issued'] as String,
      sameAs: json['owl:sameAs'] as String,
      operatorName: json['odpt:operator'] as String,
      toStation: json['odpt:toStation'] as String,
      icCardFare: json['odpt:icCardFare'] as int,
      ticketFare: json['odpt:ticketFare'] as int,
      fromStation: json['odpt:fromStation'] as String,
      childIcCardFare: json['odpt:childIcCardFare'] as int,
      childTicketFare: json['odpt:childTicketFare'] as int,
    );
  }
}
