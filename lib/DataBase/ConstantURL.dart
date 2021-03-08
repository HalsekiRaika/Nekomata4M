///
/// Request URL Type
///
class RequestURL {
  static const String RESPONSE_SERVER_URL   = "192.168.0.12:8000";
  static const String _serverPath           = "/nekomata/v1/api/";
  static const String _collectionUrl        = _serverPath  + "upcoming/";
  static const String _collectionCheckUrl   = _serverPath  + "upcoming_liver/";
  static const String CHECK_LIVER_HOLOLIVE  = _collectionCheckUrl + "Hololive";
  static const String CHECK_LIVER_NIJISANJI = _collectionCheckUrl + "Nijisanji";
  static const String CHECK_LIVER_ANIMARE   = _collectionCheckUrl + "Animare";
  static const String DATABASE_HOLOLIVE     = _collectionUrl + "Hololive/";
  static const String DATABASE_NIJISANJI    = _collectionUrl + "Nijisanji/";
  static const String DATABASE_ANIMARE      = _collectionUrl + "Animare/";
}