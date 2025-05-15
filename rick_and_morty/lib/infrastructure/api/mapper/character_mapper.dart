import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/infrastructure/api/models/character_dto.dart';

class CharacterMapper {
  static Character Map(CharacterDto characterApi){
    return Character(
      id: characterApi.id, 
      name: characterApi.name, 
      status: characterApi.status, 
      species: characterApi.species, 
      gender: characterApi.gender,
      image: characterApi.image);
  }
}