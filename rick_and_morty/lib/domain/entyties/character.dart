class Character{
  int id;
  String name;
  String status;
  String species;
  String gender;
  String image;
  String originName;
  String originUrl;
  String locationName;
  String locationUrl;

  bool isFavorite = false;
  
  Character({
    required this.id, 
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.originName,
    required this.originUrl,
    required this.locationName,
    required this.locationUrl
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id, 
      'name': name, 
      'status' : status,
      'species' : species,
      'gender' : gender,
      'image' : image,
      'isFavorite' : isFavorite,
      'locationName' : locationName,
      'locationUrl' : locationUrl,
      'originName' : originName,
      'originUrl' : originUrl
    };
  }

  Character.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    name = map['name'],
    status = map['status'],
    species = map['species'],
    gender = map['gender'],
    image = map['image'],
    isFavorite = map['isFavorite'] == 1,
    locationName = map['location']['name'],
    locationUrl = map['location']['url'],
    originName = map['origin']['name'],
    originUrl = map['origin']['url'];

  @override
  String toString() => 'id: $id, name: $name, status: $status, species: $species';
}
