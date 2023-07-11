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
    CREATE TABLE products (
    id $idType,
    image $textType,
    name $textType,
    price $textType,
    )
    ''');

    // '''
    //  CREATE TABLE toDoTAble (_id INTEGER PRIMARY KEY AUTOINCREMENT, )
    // '''

    // db.query(
    //   ToDoModelFields.toDoTable,
    //   orderBy: "${ToDoModelFields.title} ASC",
    // );
  }

  static Future<int> insertTodo(String image,String name,String price) async {
    final db = await getInstance.database;
    final int id = await db.insert('products', {
      "image":image,
      "name":name,
      "price":price
    });
    return id;
  }

  static Future<List<Map<String, Object?>>> getAllToDos() async {
    List<Map<String,Object?>> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query('products')).toList();
    return allToDos;
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