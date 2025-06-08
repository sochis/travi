class BusstopPole {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final double? lat;
  final double? long;
  final String kana;
  final String? region;
  final String sameAs;
  final List<String> operator;
  final List<String> busroutePattern;
  final String busstopPoleNumber;
  final List<dynamic> busstopPoleTimetable;

  const BusstopPole({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.lat,
    required this.long,
    required this.kana,
    required this.region,
    required this.sameAs,
    required this.operator,
    required this.busroutePattern,
    required this.busstopPoleNumber,
    required this.busstopPoleTimetable,
  });

  factory BusstopPole.fromJson(Map<String, dynamic> json) {
    return BusstopPole(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      title: json['dc:title'] as String,
      lat: json['geo:lat'] != null ? (json['geo:lat'] as num).toDouble() : null,
      long:
          json['geo:long'] != null
              ? (json['geo:long'] as num).toDouble()
              : null,
      kana: json['odpt:kana'] as String,
      region: json['ug:region'] as String?,
      sameAs: json['owl:sameAs'] as String,
      operator: List<String>.from(json['odpt:operator']),
      busroutePattern: List<String>.from(json['odpt:busroutePattern']),
      busstopPoleNumber: json['odpt:busstopPoleNumber'] as String,
      busstopPoleTimetable: json['odpt:busstopPoleTimetable'] as List<dynamic>,
    );
  }
}
