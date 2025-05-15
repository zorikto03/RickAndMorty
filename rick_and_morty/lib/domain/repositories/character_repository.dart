import 'package:rick_and_morty/domain/entyties/character.dart';

abstract class CharacterRepository {
  Future<Character?> getByIdAsync(int id);

  Future<List<Character>?> getMultiple(List<int> characterIds);

  void Add(Character character);
  void AddRange(List<Character> characters);

  void DeleteById(int id);
  void Delete(Character character);
}