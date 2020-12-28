class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String details;
  String type;
  Sight({
    this.name,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
  }) : assert(name != null && url != null && details != null && type != null);
}
