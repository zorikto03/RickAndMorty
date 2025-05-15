class CharacterDto {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  CharacterDto.fromJson(Map<String, dynamic> map) :
    id = map["id"],
    name = map["name"],
    status = map["status"],
    species = map["species"],
    gender = map["gender"],
    image = map["image"];
}