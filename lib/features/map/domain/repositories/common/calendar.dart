class Calendar {
  final String id;
  final String type;
  final String context;
  final String date;
  final String title;
  final String sameAs;
  final CalendarTitle calendarTitle;

  Calendar({
    required this.id,
    required this.type,
    required this.context,
    required this.date,
    required this.title,
    required this.sameAs,
    required this.calendarTitle,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      id: json['@id'] as String,
      type: json['@type'] as String,
      context: json['@context'] as String,
      date: json['dc:date'] as String,
      title: json['dc:title'] as String,
      sameAs: json['owl:sameAs'] as String,
      calendarTitle: CalendarTitle.fromJson(json['odpt:calendarTitle']),
    );
  }
}

class CalendarTitle {
  final String en;
  final String ja;

  CalendarTitle({required this.en, required this.ja});

  factory CalendarTitle.fromJson(Map<String, dynamic> json) {
    return CalendarTitle(en: json['en'] as String, ja: json['ja'] as String);
  }
}
