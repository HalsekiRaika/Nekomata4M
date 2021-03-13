import 'package:nekomata/database/provider/cache/cache_service.dart';
import 'package:nekomata/database/structures/structures.dart';

class CacheInterface {
  final accessService = CacheAccessService();

  Future<List<CachedObject>> getAll() => accessService.getAll();
  Future<int> insert(CachedObject cacheObj) => accessService.insert(cacheObj);
  Future<int> update(CachedObject cacheObj) => accessService.update(cacheObj);
  Future<int> deleteByDbId(String id) => accessService.delete(id);
  Future<int> deleteAll() => accessService.deleteAll();
}