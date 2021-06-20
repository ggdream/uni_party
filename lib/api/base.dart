import 'package:dio/dio.dart';

import 'package:uni_party/global/global.dart';

import 'interceptor.dart';

/// 封装的http低级接口
class BaseClient {
  static final BaseOptions _options = BaseOptions(
    baseUrl: NetworkConfig.baseURL,
    connectTimeout: NetworkConfig.connectTime,
    sendTimeout: NetworkConfig.sendTimeout,
    receiveTimeout: NetworkConfig.receiveTimeout,
  );

  static final Dio client = Dio(_options);

  static init() {
    client.interceptors.add(CustomInterceptor());
  }
}
