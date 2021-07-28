import 'core.dart';

class CacheName {
  static const uid = 'uid';
  static const token = 'token';
  static const refreshToken = 'refreshToken';
  static const expireTime = 'expireTime';
  static const primaryColor = 'primaryColor';
}

/// 对本应用场景的三次封装
class CacheImpl {
  // 添加
  static setUID(int uid) => CacheX.setx<int>(CacheName.uid, uid);
  static setToken(String token) => CacheX.setx<String>(CacheName.token, token);
  static setRefreshToken(String refreshToken) =>
      CacheX.setx<String>(CacheName.refreshToken, refreshToken);
  static setExpireTime(int expireTime) =>
      CacheX.setx<int>(CacheName.expireTime, expireTime);
  static setPrimaryColor(String primaryColor) =>
      CacheX.setx<String>(CacheName.primaryColor, primaryColor);

  // 获取
  static Future<int?> getUID() => CacheX.getx<int>(CacheName.uid);
  static Future<String?> getToken() => CacheX.getx<String>(CacheName.token);
  static Future<String?> getRefreshToken() =>
      CacheX.getx<String>(CacheName.refreshToken);
  static Future<int?> getExpireTime() => CacheX.getx<int>(CacheName.expireTime);
  static Future<String?> getPrimaryColor() =>
      CacheX.getx<String>(CacheName.primaryColor);
}
