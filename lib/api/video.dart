import 'package:uni_party/models/models.dart';

import 'client.dart';

class VideoAPI {
  /// 获取推送的视频
  static getVideos(VideoGetReqModel data) =>
      BaseClient.client.get<ResWrapper<VideoGetResModel>>('/videos/get',
          queryParameters: data.toJson());

  /// 上传视频
  static uploadVideo(VideoUploadReqModel data) =>
      BaseClient.client.post<ResWrapper<VideoUploadResModel>>('/videos/upload',
          data: data.toJson());

  /// 删除视频
  static deleteVideo(VideoDeleteReqModel data) =>
      BaseClient.client.post<ResWrapper<VideoDeleteResModel>>('/videos/delete',
          data: data.toJson());

  /// 搜索视频
  static searchVideo(VideoSearchReqModel data) =>
      BaseClient.client.get<ResWrapper<VideoSearchResModel>>('/videos/search',
          queryParameters: data.toJson());

  /// 获取用户发布的视频
  static getPublishedVideos(VideoPublicationsGetReqModel data) =>
      BaseClient.client.get<ResWrapper<VideoPublicationsGetResModel>>(
          '/videos/users/publications',
          queryParameters: data.toJson());

  /// 获取用户收藏的视频
  static getCollectedVideos(VideoCollectionsGetReqModel data) =>
      BaseClient.client.get<ResWrapper<VideoCollectionsGetResModel>>(
          '/videos/users/collections',
          queryParameters: data.toJson());
}
