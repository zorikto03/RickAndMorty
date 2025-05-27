class Location {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final String url;

  Location({
    required this.id, 
    required this.name, 
    required this.type, 
    required this.dimension, 
    required this.url});

  Location.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    name = map['name'],
    type = map['type'],
    dimension = map['dimension'],
    url = map['url'];

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'name' : name,
      'type' : type,
      'dimension' : dimension,
      'url' : url
    };
  }
}