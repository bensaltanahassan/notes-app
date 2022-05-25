import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    _db ??= await initialDb(); // if _db is null, then create a new database
    return _db; //else return the existing database
  }

  Future<Database> initialDb() async {
    String databasesPath =
        await getDatabasesPath(); // get the path to the databases directory
    String path =
        join(databasesPath, 'hassan.db'); // join the path and the file name
    Database mydb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onCreate(Database database, int version) async {
    Batch batch = database.batch();
    batch.execute('''
      CREATE TABLE "notes" (
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "title" TEXT NOT NULL,
        "note" TEXT NOT NULL,
        "color" TEXT NOT NULL
      )
    ''');
    await batch.commit();
    print("Create DATABASE AND TABLE ============ ");

    //methode pour un tableau =>
    // await database.execute('''
    //   CREATE TABLE "notes" (
    //     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    //     "title" TEXT NOT NULL,
    //     "note" TEXT NOT NULL,
    //     "color" TEXT NOT NULL
    //   )
    // ''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print("Upgrade DATABASE AND TABLE ============ ");
  }

  Future<List<Map>> readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  } // readData

  Future<int> insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response; // return the id of the new row
  } // insertData

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response; // return the number of rows affected
  } // updateData

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response; // return the number of rows affected
  } // deleteData

  deleteDataBase() async {
    String databasesPath =
        await getDatabasesPath(); // get the path to the databases directory
    String path =
        join(databasesPath, 'hassan.db'); // join the path and the file name
    await deleteDatabase(path);
  } // delete All the DataBase
}
