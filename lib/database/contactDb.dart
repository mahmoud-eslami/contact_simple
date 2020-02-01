import 'dart:io';
import 'package:contact_simple/Model/contact.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactDatabase {
  static final ContactDatabase _instance = ContactDatabase._();
  static Database _database;

  ContactDatabase._();

  factory ContactDatabase() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await init();
    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'database.db');
    var database = openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
    CREAT TABLE contact(
      name TEXT,
      phone TEXT,
      is_fav INTEGER)
    ''');
    print('Database was created!');

    Future<int> insert(Item item) async {
      var client = await database;
      client.insert('contact', item.toMapForDb(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    Future<Item> fetchItem(String name) async {
      var client = await database;
      final Future<List<Map<String, dynamic>>> futureMaps =
          client.query('contact', where: 'name = ?', whereArgs: [name]);
      var maps = await futureMaps;
      if (maps.length != 0) {
        return Item.fromDb(maps.first);
      }
    }

    Future<List<Item>> fetchAllItem() async {
      var client = await database;
      var res = await client.query('contact');

      if (res.isNotEmpty) {
        var items = res.map((item) => Item.fromDb(item)).toList();
        return items;
      }
      return [];
    }

    Future<int> updateItem(Item item) async {
      var client = await database;
      return client.update('contact', item.toMapForDb(),
          where: 'name = ?',
          whereArgs: [item.name],
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    Future<void> delete(String name) async {
      var client = await database;
      return client.delete('contact', where: 'name = ?', whereArgs: [name]);
    }
    Future closeDb() async {
      var client = await database;
      client.close();
    }
  }
}
