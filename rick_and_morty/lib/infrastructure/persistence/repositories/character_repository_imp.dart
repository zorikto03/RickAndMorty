import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';

class CharacterRepositoryImp extends CharacterRepository{

  @override
  Future<Character?> getByIdAsync(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<Character>?> getMultiple(List<int> characterIds) {
    // TODO: implement getMultiple
    throw UnimplementedError();
  }
  
  @override
  void Add(Character character) {
    // TODO: implement Add
  }
  
  @override
  void DeleteById(int id) {
    // TODO: implement DeleteById
  }
  
  @override
  void AddRange(List<Character> characters) {
    // TODO: implement AddRange
  }
  
  @override
  void Delete(Character character) {
    // TODO: implement Delete
  }

}