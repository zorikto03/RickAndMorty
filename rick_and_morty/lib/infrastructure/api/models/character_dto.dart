class CharacterDto {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String originName;
  final String originUrl;
  final String locationName;
  final String locationUrl;

  CharacterDto.fromJson(Map<String, dynamic> map) :
    id = map['id'],
    name = map['name'],
    status = map['status'],
    species = map['species'],
    gender = map['gender'],
    image = map['image'],
    locationName = map['location']['name'],
    locationUrl = map['location']['url'],
    originName = map['origin']['name'],
    originUrl = map['origin']['url'];
}