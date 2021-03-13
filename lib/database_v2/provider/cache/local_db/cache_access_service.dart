

import 'package:Nekomata/Logger/NekomataLogger.dart';
import 'package:Nekomata/database_v2/provider/cache/cache_service.dart';
import 'package:Nekomata/database_v2/structures/structures.dart';

class CacheAccessService {
  final csProvider  = CacheProvider.cacheProvider;
  final _tableName  = CacheProvider.tableName;
  final _directions = "database_id";

  //Future<Database> get csdb async => await csProvider.getDatabase;

  Future<int> insert(CachedObject cacheObj) async {
    final csdb = await csProvider.getDatabase;
    return await csdb.insert(_tableName, cacheObj.toJson());
  }

  Future<int> insertAll(List<CachedObject> cacheObj) async {
    final csdb = await csProvider.getDatabase;
    List<int> resultArray;
    for (CachedObject value in cacheObj) {
      resultArray.add(await csdb.insert(_tableName, value.toJson()));
    }
    return resultArray.where((code) => code != 0).toList().isEmpty ? 0 : 1;
  }

  Future<int> delete(String id) async {
    final csdb = await csProvider.getDatabase;
    Logger.printInfo("s_db_access", "Delete coll: [$id]");
    return await csdb.delete(_tableName, where: "$_directions = ?", whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final csdb = await csProvider.getDatabase;
    Logger.printInfo("s_db_access", "Delete table.");
    return csdb.delete(_tableName);
  }

  Future<CachedObject> get(int id) async {
    final csdb = await csProvider.getDatabase;
    List<Map<String, dynamic>> result
    = await csdb.query(_tableName, where: "$_directions = ?", whereArgs: [id]);
    return result.isNotEmpty
        ? result.map((i) => CachedObject.fromJson(i))
        : Future.error("not_found");
  }

  Future<List<CachedObject>> getAll() async {
    final csdb = await csProvider.getDatabase;
    List<Map<String, dynamic>> result = await csdb.query(_tableName);
    return result.isNotEmpty
        ? result.map((i) => CachedObject.fromJson(i)).toList()
        : [];
  }

  Future<int> update(CachedObject cacheObj) async {
    final csdb = await csProvider.getDatabase;
    return await csdb.update(_tableName, cacheObj.toJson(),
        where: "$_directions = ?", whereArgs: [cacheObj.databaseId]);
  }
}
