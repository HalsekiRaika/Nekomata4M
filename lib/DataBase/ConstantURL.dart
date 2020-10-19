///
/// Request URL Type
///
class RequestURL {
  static const String _responseServerUrl   = "http://ec2-18-210-220-130.compute-1.amazonaws.com:5000/api/Raven";
  static const String _collectionCheckUrl  = _responseServerUrl  + "/collections/";
  static const String COLLECTION_HOLOLIVE  = _collectionCheckUrl +      "Hololive";
  static const String COLLECTION_NIJISANJI = _collectionCheckUrl +     "Nijisanji";
  static const String COLLECTION_ANIMARE   = _collectionCheckUrl +       "Animare";
  static const String DATABASE_HOLOLIVE    = _responseServerUrl  +    "/hololive/";
  static const String DATABASE_NIJISANJI   = _responseServerUrl  +   "/nijisanji/";
  static const String DATABASE_ANIMARE     = _responseServerUrl  +     "/animare/";
}