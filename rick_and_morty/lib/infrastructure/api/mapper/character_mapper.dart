import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/infrastructure/api/models/character_dto.dart';

class CharacterMapper {
  static Character map(CharacterDto characterApi){
    return Character(
      id: characterApi.id, 
      name: characterApi.name, 
      status: characterApi.status, 
      species: characterApi.species, 
      gender: characterApi.gender,
      image: characterApi.image,
      locationName: characterApi.locationName, 
      locationUrl: characterApi.locationUrl,
      originName: characterApi.originName, 
      originUrl: characterApi.originUrl
    );
  }
}