import 'package:amaliy/model/dog_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("todos.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE dogs (id $idType, name $textType, age $intType)
    ''');

    // '''
    //  CREATE TABLE toDoTAble (_id INTEGER PRIMARY KEY AUTOINCREMENT, )
    // '''

    // db.query(
    //   ToDoModelFields.toDoTable,
    //   orderBy: "${ToDoModelFields.title} ASC",
    // );
  }

  static Future<int> insertDog(Dog dog) async {
    final db = await getInstance.database;
    final int id = await db.insert('dogs',
      dog.toMap(),
    );
    return id;
  }

  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  // static updateToDoStatus({required int id, required int statusIndex}) async {
  //   final db = await getInstance.database;
  //   db.update(
  //     ToDoModelFields.toDoTable,
  //     {ToDoModelFields.status: statusIndex},
  //     where: "${ToDoModelFields.id} = ?",
  //     whereArgs: [id],
  //   );
  // }

  static deleteToDo(int id) async {
    final db = await getInstance.database;
    db.delete(
      'products',
      where: "$id = ?",
      whereArgs: [id],
    );
  }
}