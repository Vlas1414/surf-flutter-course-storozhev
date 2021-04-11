class Sight {
  Sight({
    required this.name,
    required this.url,
    required this.details,
    required this.type,
    this.lat,
    this.lon,
  });
  final String name;
  final double? lat;
  final double? lon;
  final String url;
  final String details;
  final TypeOfSight type;
}

class TypeOfSight {
  TypeOfSight({
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;
}
