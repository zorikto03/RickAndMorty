import 'package:rick_and_morty/domain/entyties/character.dart';
import 'package:rick_and_morty/domain/repositories/character_repository.dart';
import 'package:rick_and_morty/infrastructure/persistence/database/db_provider.dart';

class CharacterRepositoryImp extends CharacterRepository{
  static const String tableName = "Characters"; 

  @override
  getByIdAsync(int id) async {
    final db = await DbProvider.db.database;

    var result = await db.query(tableName, where: "id = ?", whereArgs: [id]);
    
    return result.isNotEmpty ? 
      Character.fromMap(result.first) : 
      Null;
  }

  @override
  Future<List<Character>?> getMultiple(List<int> characterIds) 
  async {
    final db = await DbProvider.db.database;

    var queryRes = await db.rawQuery("SELECT "
      "id, "
      "name, "
      "status, "
      "species, "
      "gender, "
      "image, "
      "isFavorite " 
      "from Characters where id in (${characterIds.map((_) => "?").join(", ")})", characterIds);
    
    if (queryRes.isNotEmpty){
      return queryRes.map((c) => Character.fromMap(c)).toList(); 
    }

    return [];
  }
  
  @override
  add(Character character) async {
    final db = await DbProvider.db.database;
    
    await db.insert(tableName, character.toMap());
  }
  
  @override
  deleteById(int id) async {
    final db = await DbProvider.db.database;

    await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
  
  @override
  Future<bool> contains(Character character) async {
    final db = await DbProvider.db.database;

    var result = await db.query(tableName, where: "id = ?", whereArgs: [character.id]);
    return result.isNotEmpty;
  }
  
  @override
  update(Character character) async {
    final db = await DbProvider.db.database;

    await db.update(tableName, character.toMap());
  }
    
}