import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:idb_sqflite/idb_sqflite.dart' as idb_sqflite;

class DB {
  //abrindo o banco de dados local
  static const _storeName = "data";

  static Future<idb_sqflite.Database> open() async {
    var factory = idb_sqflite.getIdbFactorySqflite(sqflite.databaseFactory);

    // String path = join(databasePath, 'befree.db');
    idb_sqflite.Database database = await factory.open("myhero.db", version: 1,
        onUpgradeNeeded: (idb_sqflite.VersionChangeEvent event) async {
      idb_sqflite.Database db = event.database;

      db.createObjectStore(_storeName, autoIncrement: true);
    });
    return database;
  }

  /*  static Future<void> save(String jsonData, String key) async {
    var db = await open();
    await db.delete('Configuration',
        where: 'configName =?', whereArgs: [key.toLowerCase()]);

    await db.insert(
      'Configuration',
      {'configName': key.toLowerCase(), 'configValue': jsonData},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } */

  static Future<void> save(String jsonData, String keyName) async {
    var db = await open();
    var transaction = db.transaction(_storeName, idb_sqflite.idbModeReadWrite);
    var store = transaction.objectStore(_storeName);
    var key = await store.put({keyName: jsonData});

    await transaction.completed;
    db.close();
  }

  static Future<dynamic> getByKey(String key) async {
    var db = await open();
    const storeName = "data";
    var txn = db.transaction(storeName, idb_sqflite.idbModeReadOnly);
    var store = txn.objectStore(storeName);
    var value = await store.getObject(key);
    await txn.completed;

    return value ?? null;
  }

  static Future<void> delete(String storeName) async {
    final db = await open();
/*     await db.delete('Configuration',
        where: 'configName =?', whereArgs: [key.toLowerCase()]); */
    db.deleteObjectStore(storeName);
    db.close();
  }

  static Future<void> deleteAllData() async {
    final db = await open();
    db.factory.deleteDatabase("myhero.db");
    db.close();
  }

  /* static Future<void> deleteLike(String key) async {
    final Database db = await open();
    await db.delete('Configuration',
        where: "configName LIKE ?", whereArgs: ['%${key.toLowerCase()}']);
  } */

  /* static Future<void> deleteAll() async {
    final Database db = await open();
    await db.delete('Configuration');
  } */
}



/* import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'base.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("DROP TABLE IF EXISTS Configuration");
      // When creating the db, create the table
      await db.execute(
        "CREATE TABLE Configuration (id INTEGER PRIMARY KEY, configName TEXT, configValue TEXT)",
      );
    });

    return database;
  }

  static Future<void> save(String stringJsonValue, String key) async {
    var db = await open();
    await db.delete('Configuration',
        where: 'configName =?', whereArgs: [key.toLowerCase()]);

    await db.insert(
      'Configuration',
      {'configName': key.toLowerCase(), 'configValue': stringJsonValue},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<dynamic> getByKey(String key) async {
    var db = await open();
    var list = await db.rawQuery(
        'SELECT configValue FROM Configuration WHERE configName = ?',
        [key.toLowerCase()]);

    return list.isEmpty ? null : list.first.values.last;
  }

  static Future<void> delete(String key) async {
    final Database db = await open();
    await db.delete('Configuration',
        where: 'configName =?', whereArgs: [key.toLowerCase()]);
    return true;
  }

  static Future<void> deleteLike(String key) async {
    final Database db = await open();
    await db.delete('Configuration',
        where: "configName LIKE ?", whereArgs: ['%${key.toLowerCase()}']);
    return true;
  }

  static Future<void> deleteAll() async {
    final Database db = await open();
    await db.delete('Configuration');
    return true;
  }

  static Future<void> hasCacheExpired() async {
    var cacheTime = await getByKey('cache');
    DateTime currentTime = DateTime.now().add(Duration(hours: -1));

    if (cacheTime != null) {
      DateTime currentCacheTime = DateTime.parse(cacheTime);
      if (currentTime.isBefore(currentCacheTime)) {
        await deleteLike('classifications');
        await deleteLike('matches');
        await deleteLike('red');
        await deleteLike('yellow');
        await deleteLike('topscorers');

        await save(currentTime.toIso8601String(), 'cache');
      }
    } else {
      await save(currentTime.toIso8601String(), 'cache');
    }
  }
} */

