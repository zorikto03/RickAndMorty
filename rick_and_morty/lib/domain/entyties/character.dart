class Character{
  int id;
  String name;
  String status;
  String species;
  String gender;
  String image;
  // Origin origin;
  // Location location;

  bool isFavorite = false;
  
  Character({
    required this.id, 
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    // required this.origin,
    // required this.location
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id, 
      "name": name, 
      "status" : status,
      "species" : species,
      "gender" : gender,
      "image" : image,
      "isFavorite" : isFavorite
    };
  }

  Character.fromMap(Map<String, dynamic> map) :
    id = map["id"],
    name = map["name"],
    status = map["status"],
    species = map["species"],
    gender = map["gender"],
    image = map["image"],
    isFavorite = map["isFavorite"] == 1;

  @override
  String toString() => "id: $id, name: $name, status: $status, species: $species";
}


class Origin{
  String name;
  String url;

  Origin({
    required this.name,
    required this.url
  });
}

class Location{
  String name;
  String url;

  Location({
    required this.name,
    required this.url
  });
}