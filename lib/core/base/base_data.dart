


class BaseData {
  static BaseData? _instance;

  static BaseData? get instance {
    _instance ??= BaseData._init();
    return _instance;
  }

  BaseData._init();



}