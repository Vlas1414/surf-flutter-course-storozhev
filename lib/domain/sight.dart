class Sight {
  Sight({
    required this.name,
    this.lat,
    this.lon,
    required this.url,
    required this.details,
    required this.type,
  })  : assert(
          name != null,
          '`name` must not be null',
        ),
        assert(
          url != null,
          '`url` must not be null',
        ),
        assert(
          details != null,
          '`details` must not be null',
        ),
        assert(
          type != null,
          '`type` must not be null',
        );
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
  })  : assert(
          text != null,
          '`text` must not be null',
        ),
        assert(
          icon != null,
          '`text` must not be null',
        );
  final String text;
  final String icon;
}
