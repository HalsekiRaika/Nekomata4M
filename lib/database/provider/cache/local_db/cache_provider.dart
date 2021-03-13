import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CacheProvider {
  static final int _databaseVersion = 1;
  static final String _databaseName = "nekomata_local.db";
  static final String tableName     = "scheduled_live";

  static final CacheProvider cacheProvider = new CacheProvider();

  Database _database;

  Future<Database> get getDatabase async => _database = (_database != null ? _database : await createDatabase());

  Future<Database> createDatabase() async {
    Directory current = await getApplicationDocumentsDirectory();
    String    dbPath  = current.path + _databaseName;
    return await openDatabase(dbPath, version: _databaseVersion, onCreate: initDataBase);
  }

  /// NotifyCount | Is Notify | LiveData <br></br>
  /// INTEGER     | INTEGER   | TEXT
  void initDataBase(Database database, int dbVersion) async {
    await database.execute(
        "CREATE TABLE"       + " $tableName" + "(" +
            "database_id"        + " TEXT"    + " NOT NULL," +
            "notify_count"       + " INTEGER" + " NOT NULL," +
            "can_notify"         + " TEXT"    + " NOT NULL," +
            "product_type"       + " TEXT"    + " NOT NULL," +
            "raw_upcoming_model" + " TEXT"    + " NOT NULL)"
    );
  }
}