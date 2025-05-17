import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider{
  DbProvider._();
  static final DbProvider db = DbProvider._();

  //static late Database _database;

  Future<Database> get database async => await initDb();

  Future<Database> initDb() async{
    var documentDirectory = join(await getDatabasesPath(), "test_db.db");

    //await deleteDatabase(documentDirectory);

    return await openDatabase(
      documentDirectory,
      onCreate: (db, version) {
        return db.execute("CREATE TABLE Characters("
        "id INTEGER PRIMARY KEY," 
        "name TEXT,"
        "status TEXT,"
        "species TEXT,"
        "gender TEXT,"
        "image TEXT,"
        "isFavorite bit)"
        );
      },
      version: 1
    );
  }
}