///
/// Request URL Type
///
class RequestURL {
  static const String RESPONSE_SERVER_URL  = "ec2-18-210-220-130.compute-1.amazonaws.com:5000";
  static const String _serverPath          = "/api/Raven";
  static const String _collectionCheckUrl  = _serverPath  + "/collections/";
  static const String CHECK_LIVER_HOLOLIVE  = _collectionCheckUrl + "Hololive";
  static const String CHECK_LIVER_NIJISANJI = _collectionCheckUrl + "Nijisanji";
  static const String CHECK_LIVER_ANIMARE   = _collectionCheckUrl + "Animare";
  static const String DATABASE_HOLOLIVE    = _serverPath + "/hololive/";
  static const String DATABASE_NIJISANJI   = _serverPath + "/nijisanji/";
  static const String DATABASE_ANIMARE     = _serverPath + "/animare/";
}