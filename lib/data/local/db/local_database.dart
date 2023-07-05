import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/product_model/product_model.dart';


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
      _database = await _initDB("my_shop.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 1";

    await db.execute('''
    CREATE TABLE ${ProductModelFields.productsTable} (
    ${ProductModelFields.id} $idType,
    ${ProductModelFields.name} $textType,
    ${ProductModelFields.image} $textType,
    ${ProductModelFields.count} $intType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<ProductModelSql> insertProduct(
      ProductModelSql productsModelSql) async {
    final db = await getInstance.database;
    final int id = await db.insert(
        ProductModelFields.productsTable, productsModelSql.toJson());
    return productsModelSql.copyWith(id: id);
  }

  static Future<List<ProductModelSql>> getAllProducts() async {
    List<ProductModelSql> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(ProductModelFields.productsTable))
        .map((e) => ProductModelSql.fromJson(e))
        .toList();

    return allToDos;
  }

  static updateProductName({required int id, required String name}) async {
    final db = await getInstance.database;
    db.update(
      ProductModelFields.productsTable,
      {ProductModelFields.name: name},
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    );
  }
  static updateProductCount({required int id, required int count}) async {
    final db = await getInstance.database;
    db.update(
      ProductModelFields.productsTable,
      {ProductModelFields.count: count},
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    );
  }

  static updateProduct({required ProductModelSql contactsModelSql}) async {
    final db = await getInstance.database;
    db.update(
      ProductModelFields.productsTable,
      contactsModelSql.toJson(),
      where: "${ProductModelFields.id} = ?",
      whereArgs: [contactsModelSql.id],
    );
  }

  static deleteProduct(int id) async {
    final db = await getInstance.database;
    db.delete(
      ProductModelFields.productsTable,
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    );
  }
  static deleteAll() async {
    final db = await getInstance.database;
    db.delete(
      ProductModelFields.productsTable,
    );
  }

  static Future<List<ProductModelSql>> getProductsByLimit(int limit) async {
    List<ProductModelSql> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(ProductModelFields.productsTable,
            limit: limit, orderBy: "${ProductModelFields.name} ASC"))
        .map((e) => ProductModelSql.fromJson(e))
        .toList();

    return allToDos;
  }

  static Future<ProductModelSql?> getSingleContact(int id) async {
    List<ProductModelSql> contacts = [];
    final db = await getInstance.database;
    contacts = (await db.query(
      ProductModelFields.productsTable,
      where: "${ProductModelFields.id} = ?",
      whereArgs: [id],
    ))
        .map((e) => ProductModelSql.fromJson(e))
        .toList();

    if (contacts.isNotEmpty) {
      return contacts.first;
    }
  }
}
