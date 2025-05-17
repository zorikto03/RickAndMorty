import 'package:rick_and_morty/domain/entyties/character.dart';

abstract class CharacterRepository {
  getByIdAsync(int id);

  Future<List<Character>?> getMultiple(List<int> characterIds);

  Future<bool> contains(Character character);

  add(Character character);

  deleteById(int id);

  update(Character character);
}