import 'package:Nekomata/DataBase/Local/CacheProvider.dart';
import 'package:Nekomata/DataBase/Structure.dart';

class CacheAccessService {
  final csProvider  = CacheProvider.cacheProvider;
  final _tableName  = CacheProvider.tableName;
  final _directions = "database_id";

  //Future<Database> get csdb async => await csProvider.getDatabase;

  Future<int> insert(CacheStructure cacheObj) async {
    final csdb = await csProvider.getDatabase;
    return await csdb.insert(_tableName, cacheObj.toJson());
  }

  Future<int> insertAll(List<CacheStructure> cacheObj) async {
    final csdb = await csProvider.getDatabase;
    List<int> resultArray;
    for (CacheStructure value in cacheObj) {
      resultArray.add(await csdb.insert(_tableName, value.toJson()));
    }
    return resultArray.where((code) => code != 0).toList().isEmpty ? 0 : 1;
  }

  Future<int> delete(int id) async {
    final csdb = await csProvider.getDatabase;
    return await csdb.delete(_tableName, where: "$_directions = ?", whereArgs: [id]);
  }
  
  Future<int> deleteAll() async {
    final csdb = await csProvider.getDatabase;
    return csdb.delete(_tableName);
  }

  Future<CacheStructure> get(int id) async {
    final csdb = await csProvider.getDatabase;
    List<Map<String, dynamic>> result
      = await csdb.query(_tableName, where: "$_directions = ?", whereArgs: [id]);
    return result.isNotEmpty
        ? result.map((i) => CacheStructure.fromJson(i))
        : Future.error("not_found");
  }

  Future<List<CacheStructure>> getAll() async {
    final csdb = await csProvider.getDatabase;
    List<Map<String, dynamic>> result = await csdb.query(_tableName);
    return result.isNotEmpty
        ? result.map((i) => CacheStructure.fromJson(i)).toList()
        : [];
  }

  Future<int> update(CacheStructure cacheObj) async {
    final csdb = await csProvider.getDatabase;
    return await csdb.update(_tableName, cacheObj.toJson(),
        where: "$_directions = ?", whereArgs: [cacheObj.databaseId]);
  }
}
