class LocationDto {
  final int id;
  final String name;
  final String url;
  final String type;
  final String dimension;

  LocationDto.fromJson(Map<String, dynamic> map) :
    id = map['id'],
    name = map['name'],
    url = map['url'],
    type = map['type'],
    dimension = map['dimension'];
}