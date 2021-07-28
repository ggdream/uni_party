import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储策略
class CacheX {
  CacheX._();

  /// 泛型式储存
  static Future<void> setx<T>(String key, T value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    switch (T) {
      case String:
        preferences.setString(key, value as String);
        break;
      case int:
        preferences.setInt(key, value as int);
        break;
      case double:
        preferences.setDouble(key, value as double);
        break;
      case bool:
        preferences.setBool(key, value as bool);
        break;
      case List:
        preferences.setStringList(key, value as List<String>);
        break;
      default:
        assert(false);
    }
  }

  /// 泛型式获取
  static Future<T?> getx<T>(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    T? value;
    switch (T) {
      case String:
        value = preferences.getString(key) as T?;
        break;
      case int:
        value = preferences.getInt(key) as T?;
        break;
      case double:
        value = preferences.getDouble(key) as T?;
        break;
      case bool:
        value = preferences.getBool(key) as T?;
        break;
      case List:
        value = preferences.getStringList(key) as T?;
        break;
      default:
        assert(false);
    }

    return value;
  }

  /// 根据key删除对应值
  static Future<bool> delete(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(key);
  }

  /// 判断指定key是否存在
  static Future<bool> exist(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.containsKey(key);
  }

  /// 清空所有内容
  static Future<bool> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }

  /// 获取所有的key
  static Future<Set<String>> keys() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getKeys();
  }
}
