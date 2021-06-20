class Sight {
  Sight({
    required this.id,
    required this.name,
    required this.lat,
    required this.lon,
    required this.url,
    required this.details,
    required this.type,
  });
  final int id;
  final String name;
  final double lat;
  final double lon;
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
