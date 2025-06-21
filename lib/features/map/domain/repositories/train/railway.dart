class Railway {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String color;
  final String sameAs;
  final String lineCode;
  final String operatorName;
  final Map<String, String> railwayTitle;
  final List<StationOrder> stationOrder;

  Railway({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.color,
    required this.sameAs,
    required this.lineCode,
    required this.operatorName,
    required this.railwayTitle,
    required this.stationOrder,
  });

  factory Railway.fromJson(Map<String, dynamic> json) {
    final stationOrderList =
        (json['odpt:stationOrder'] as List?)
            ?.map((e) => StationOrder.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];

    return Railway(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      title: json['dc:title'] as String? ?? '',
      color: json['odpt:color'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      lineCode: json['odpt:lineCode'] as String? ?? '',
      operatorName: json['odpt:operator'] as String? ?? '',
      railwayTitle: (json['odpt:railwayTitle'] is Map)
          ? Map<String, String>.from(json['odpt:railwayTitle'] as Map)
          : {},
      stationOrder: stationOrderList,
    );
  }
}

class StationOrder {
  final int index;
  final String station;
  final Map<String, String> stationTitle;

  StationOrder({
    required this.index,
    required this.station,
    required this.stationTitle,
  });

  factory StationOrder.fromJson(Map<String, dynamic> json) {
    return StationOrder(
      index: json['odpt:index'] as int? ?? 0,
      station: json['odpt:station'] as String? ?? '',
      stationTitle: (json['odpt:stationTitle'] is Map)
          ? Map<String, String>.from(json['odpt:stationTitle'] as Map)
          : {},
    );
  }
}
