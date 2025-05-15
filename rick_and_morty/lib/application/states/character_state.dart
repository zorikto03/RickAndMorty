import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/infrastructure/api/services/character_service.dart';
import 'package:rick_and_morty/infrastructure/persistence/repositories/character_repository_imp.dart';

class CharacterState {
  // common principe of state class
  // 1. try get data from network source. if we can`t get data, then point 3.
  // 2. if we take data from network we need to save to local database. 
  // 3. try get data from local database. 

  late CharacterRepository _characterRepository;
  late CharacterService _characterService;

  bool isLoading = false;

  CharacterState() {
    _characterRepository = CharacterRepositoryImp();
    _characterService = CharacterService();
  }

  Future<Character?> getByIdAsync(int id) 
  async {
    isLoading = true;

    var character = await _characterService.getByIdAsync(id);
    if (character != null){
      _characterRepository.Add(character);
    }
    else{
      character = await _characterRepository.getByIdAsync(id);
    }

    isLoading = false;

    return character;
  }

  Future<List<Character>?> getRangeAsync(List<int> characterIds) 
  async {
    isLoading = true;

    var character = await _characterService.getRangeAsync(characterIds);
    if (character != null){
      _characterRepository.AddRange(character);
    }
    else{
      character = await _characterRepository.getMultiple(characterIds);
    }

    isLoading = false;

    return character;
  }
}