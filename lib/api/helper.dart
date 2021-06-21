import 'package:uni_party/models/models.dart';

import 'client.dart';

class HelperAPI {
  /// 获取用户协议
  static getUserProtocol(HelperProtocolsUserReqModel data) => BaseClient.client
      .get<ResWrapper<HelperProtocolsUserResModel>>('/helpers/protocols/user',
          queryParameters: data.toJson());

  /// 获取服务协议
  static getServiceProtocol(HelperProtocolsServiceReqModel data) =>
      BaseClient.client.get<ResWrapper<HelperProtocolsServiceResModel>>(
          '/helpers/protocols/service',
          queryParameters: data.toJson());

  /// 获取最新版本信息
  static getAppNewVersion(HelperVersionMostNewReqModel data) =>
      BaseClient.client.get<ResWrapper<HelperVersionMostNewResModel>>(
          '/helpers/version',
          queryParameters: data.toJson());

  /// 获取所有版本信息
  static getAppAllVersion(HelperVersionAllReqModel data) => BaseClient.client
      .get<ResWrapper<HelperVersionAllResModel>>('/helpers/versions',
          queryParameters: data.toJson());

  /// 关于我们
  static aboutUs(HelperAboutUsReqModel data) => BaseClient.client
      .get<ResWrapper<HelperAboutUsResModel>>('/helpers/about/us',
          queryParameters: data.toJson());

  /// 联系我们
  static contactUs(HelperContactUsReqModel data) => BaseClient.client
      .get<ResWrapper<HelperContactUsResModel>>('/helpers/contact/us',
          queryParameters: data.toJson());

  /// 反馈建议
  static feedback(HelperFeedbackReqModel data) => BaseClient.client
      .post<ResWrapper<HelperFeedbackResModel>>('/helpers/feedback',
          data: data.toJson());
}
