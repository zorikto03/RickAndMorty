import 'package:rick_and_morty/domain/entyties/location.dart';
import 'package:rick_and_morty/domain/repositories/location_repository.dart';
import 'package:rick_and_morty/infrastructure/persistence/database/db_provider.dart';

class LocationRepositoryImp extends LocationRepository{
  static const String tableName = 'Locations'; 

  @override
  add(Location location) async {
    var db = await DbProvider.db.database;
    await db.insert(tableName, location.toMap());
  }

  @override
  Future<bool> contains(Location location) async {
    var db = await DbProvider.db.database;

    var result = await db.query(tableName, where: 'id = ?', whereArgs: [location.id]);
    return result.isNotEmpty;
  }

  @override
  deleteById(int id) async {
    final db = await DbProvider.db.database;

    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  getByName(String name) async {
    final db = await DbProvider.db.database;

    var result = await db.query(tableName, where: 'name LIKE ?', whereArgs: [name]);
    
    return result.isNotEmpty ? 
      Location.fromMap(result.first) : 
      null;
  }

  @override
  update(Location location) async {
    final db = await DbProvider.db.database;

    await db.update(
      tableName, 
      location.toMap(),
      where: 'id = ?',
      whereArgs: [location.id]);
  }
  
  @override
  getAll() async {
    final db = await DbProvider.db.database;

    var result = await db.query(tableName);

    return result.isNotEmpty ? 
      result.map((c) => Location.fromMap(c)).toList() :
      [];    
  }
}