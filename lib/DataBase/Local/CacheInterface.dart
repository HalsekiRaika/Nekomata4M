import 'package:Nekomata/DataBase/Local/CacheAccessService.dart';

import '../Structure.dart';

class CacheInterface {
  final accessService = CacheAccessService();

  Future<List<CacheStructure>> getAll() => accessService.getAll();
  Future<int> insert(CacheStructure cacheObj) => accessService.insert(cacheObj);
  Future<int> update(CacheStructure cacheObj) => accessService.update(cacheObj);
  Future<int> deleteByDbId(int id) => accessService.delete(id);
  Future<int> deleteAll() => accessService.deleteAll();
}