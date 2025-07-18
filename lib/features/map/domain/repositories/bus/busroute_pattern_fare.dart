class BusroutePatternFare {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String note;
  final String sameAs;
  final String pattern;
  final String busroute;
  final String operator;
  final String? direction;
  final Region region;
  final List<BusstopPoleOrder> busstopPoleOrder;

  const BusroutePatternFare({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.note,
    required this.sameAs,
    required this.pattern,
    required this.busroute,
    required this.operator,
    required this.direction,
    required this.region,
    required this.busstopPoleOrder,
  });

  factory BusroutePatternFare.fromJson(Map<String, dynamic> json) {
    return BusroutePatternFare(
      id: json['@id'] as String? ?? '',
      type: json['@type'] as String? ?? '',
      context: json['@context'] as String? ?? '',
      date: json['dc:date'] as String? ?? '',
      title: json['dc:title'] as String? ?? '',
      note: json['odpt:note'] as String? ?? '',
      sameAs: json['owl:sameAs'] as String? ?? '',
      pattern: json['odpt:pattern'] as String? ?? '',
      busroute: json['odpt:busroute'] as String? ?? '',
      operator: json['odpt:operator'] as String? ?? '',
      direction: json['odpt:direction'] as String?,
      region: Region.fromJson(json['ug:region'] ?? {}),
      busstopPoleOrder: (json['odpt:busstopPoleOrder'] as List<dynamic>? ?? [])
          .map(
            (item) => BusstopPoleOrder.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class Region {
  final String type;
  final List<List<double>> coordinates;

  const Region({required this.type, required this.coordinates});

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      type: json['type'] as String? ?? '',
      coordinates: (json['coordinates'] as List<dynamic>? ?? [])
          .map(
            (coord) => (coord as List<dynamic>)
                .map((e) => (e as num).toDouble())
                .toList(),
          )
          .toList(),
    );
  }
}

class BusstopPoleOrder {
  final String note;
  final int index;
  final String busstopPole;

  const BusstopPoleOrder({
    required this.note,
    required this.index,
    required this.busstopPole,
  });

  factory BusstopPoleOrder.fromJson(Map<String, dynamic> json) {
    return BusstopPoleOrder(
      note: json['odpt:note'] as String? ?? '',
      index: json['odpt:index'] as int? ?? 0,
      busstopPole: json['odpt:busstopPole'] as String? ?? '',
    );
  }
}
