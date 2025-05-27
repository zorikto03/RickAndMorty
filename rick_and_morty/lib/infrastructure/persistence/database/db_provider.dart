import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider{
  DbProvider._();
  static final DbProvider db = DbProvider._();

  static late Database _database;

  Future<Database> get database async => _database;

  Future initDb() async{
    var documentDirectory = join(await getDatabasesPath(), 'test_db.db');

    await deleteDatabase(documentDirectory);

    _database = await openDatabase(
      documentDirectory,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Characters('
          'id INTEGER PRIMARY KEY,' 
          'name TEXT,'
          'status TEXT,'
          'species TEXT,'
          'gender TEXT,'
          'image TEXT,'
          'locationName TEXT,'
          'locationUrl TEXT,'
          'originName TEXT,'
          'originUrl TEXT,'
          'isFavorite bit)'
        );

        await db.execute(
          'CREATE TABLE Episodes('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'url TEXT,'
          'air_date TEXT,'
          'episode TEXT'
          ')'
        );

        await db.execute(
          'CREATE TABLE Locations('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'type TEXT,'
          'dimension TEXT,'
          'url TEXT'
          ')'
        );
      },
      version: 1
    );
  }
}