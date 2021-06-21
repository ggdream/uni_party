import 'package:dio/dio.dart';
import 'package:uni_party/models/models.dart';

import 'client.dart';

class UserAPI {
  /// 获取用户信息
  static getUserInfo(UserInfoGetReqModel data) =>
      BaseClient.client.get<ResWrapper<UserInfoGetResModel>>('/users',
          queryParameters: data.toJson());

  /// 获取用户的粉丝信息
  static getUserFollowers(UserFollowersGetReqModel data) => BaseClient.client
      .get<ResWrapper<UserFollowersGetResModel>>('/users/followers',
          queryParameters: data.toJson());

  /// 获取用户的关注信息
  static getUserFollowing(UserFollowingGetReqModel data) => BaseClient.client
      .get<ResWrapper<UserFollowingGetResModel>>('/users/following',
          queryParameters: data.toJson());

  /// 关注某个用户
  static followOneUser(UserFollowingActionReqModel data) => BaseClient.client
      .post<ResWrapper<UserFollowingActionResModel>>('/users/following/act',
          data: data.toJson());

  /// 获取发布的消息
  static getPublishedEvents(UserEventCollectionsGetReqModel data) =>
      BaseClient.client.get<ResWrapper<UserEventCollectionsGetResModel>>(
          '/users/events/publications',
          queryParameters: data.toJson());

  /// 获取收藏的消息
  static getCollectedEvents(UserEventCollectionsGetReqModel data) =>
      BaseClient.client.get<ResWrapper<UserEventCollectionsGetResModel>>(
          '/users/events/collections',
          queryParameters: data.toJson());

  /// 获取发布的视频
  static getPublishedVideos(UserVideoPublicationsGetReqModel data) =>
      BaseClient.client.get<ResWrapper<UserVideoPublicationsGetResModel>>(
          '/users/videos/publications',
          queryParameters: data.toJson());

  /// 获取收藏的视频
  static getCollectedVideos(UserVideoCollectionsGetReqModel data) =>
      BaseClient.client.get<ResWrapper<UserVideoCollectionsGetResModel>>(
          '/users/videos/collections',
          queryParameters: data.toJson());

  /// 搜索用户
  static searchUser(UserSearchReqModel data) =>
      BaseClient.client.get<ResWrapper<UserSearchResModel>>('/users/search',
          queryParameters: data.toJson());

  /// 上传头像
  static uploadAvatar(UserAvatarUploadReqModel data) async {
    final form = data.toJson();
    form['file'] = await MultipartFile.fromFile(form['file']);
    return BaseClient.client.post<ResWrapper<UserAvatarUploadResModel>>(
        '/users/profile/avatar',
        data: form);
  }

  /// 更新个人信息
  static updateUserInfo(UserInfoUpdateReqModel data) => BaseClient.client
      .post<ResWrapper<UserInfoUpdateResModel>>('/users/profile/update',
          data: data.toJson());

  /// 获取当前主题色
  static getSettingsTheme(UserSettingsThemeColorGetReqModel data) =>
      BaseClient.client.get<ResWrapper<UserSettingsThemeColorGetResModel>>(
          '/users/settings/theme/get',
          queryParameters: data.toJson());

  /// 设置当前主题色
  static setSettingsTheme(UserSettingsThemeColorSetReqModel data) =>
      BaseClient.client.post<ResWrapper<UserSettingsThemeColorSetResModel>>(
          '/users/settings/theme/set',
          data: data.toJson());

  /// 获取邮件推送状态
  static getSettingsMailPush(UserSettingsMailPushGetReqModel data) =>
      BaseClient.client.get<ResWrapper<UserSettingsMailPushGetResModel>>(
          '/users/settings/push',
          queryParameters: data.toJson());

  /// 设置邮件推送消息
  static setSettingsMailPushEvent(UserSettingsMailPushEventSetReqModel data) =>
      BaseClient.client.post<ResWrapper<UserSettingsMailPushEventSetResModel>>(
          '/users/settings/push/event',
          data: data.toJson());

  /// 设置邮件推送视频
  static setSettingsMailPushVideo(UserSettingsMailPushVideoSetReqModel data) =>
      BaseClient.client.post<ResWrapper<UserSettingsMailPushVideoSetResModel>>(
          '/users/settings/push/video',
          data: data.toJson());
}
