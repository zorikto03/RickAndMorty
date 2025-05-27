import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/infrastructure/api/mapper/character_mapper.dart';
import 'package:rick_and_morty/infrastructure/api/requests/character_api_requests.dart';

class CharacterService {

  final CharacterApiRequests _apiRequests = CharacterApiRequests();

  Future<Character?> getByIdAsync(int id) 
  async {
    var characterDto = await _apiRequests.getByIdAsync(id);

    if (characterDto != null){
      var character = CharacterMapper.map(characterDto);
      return character;
    }
    
    return null;
  }

  Future<List<Character>?> getRangeAsync(List<int> characterIds) 
  async {
    var charactersDto = await _apiRequests.getMultipleAsync(characterIds);

    if (charactersDto != null){
      var list = List.generate(
        charactersDto.length, 
        (index) => CharacterMapper.map(charactersDto[index]));
      return list;
    }
    return null;
  }
}