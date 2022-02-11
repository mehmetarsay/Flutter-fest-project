
class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    if (_instance != null) return _instance;
    _instance = NetworkManager.init();
    return _instance;
  }


  NetworkManager.init() {

  }
}