class Character{
  int id;
  String name;
  String status;
  String species;
  String gender;
  String image;
  // Origin origin;
  // Location location;

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