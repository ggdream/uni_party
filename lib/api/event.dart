import 'package:uni_party/models/models.dart';

import 'client.dart';

class EventAPI {
  /// 获取订阅消息
  static subscribe(EventSubGetReqModel data) =>
      BaseClient.client.get<ResWrapper<EventSubGetResModel>>('/events/sub',
          queryParameters: data.toJson());

  /// 删除消息
  static delete(EventDeleteReqModel data) =>
      BaseClient.client.post<ResWrapper<EventDeleteResModel>>('/events/delete',
          data: data.toJson());


  /// 获取详细通知消息
  static noticeDetail(EventDetailGetReqModel data) => BaseClient.client
      .get<ResWrapper<EventDetailGetNoticeResModel>>('/events/notice/detail',
          queryParameters: data.toJson());

  /// 发布通知消息
  static noticePublish(EventPublishNoticeReqModel data) => BaseClient.client
      .post<ResWrapper<EventPublishResModel>>('/events/notice/publish',
          data: data.toJson());

  /// 修改通知消息
  static noticeRepair(EventRepairNoticeReqModel data) => BaseClient.client
      .post<ResWrapper<EventRepairResModel>>('/events/notice/repair',
          data: data.toJson());


  /// 获取详细投票消息
  static voteDetail(EventDetailGetReqModel data) => BaseClient.client
      .get<ResWrapper<EventDetailGetVoteResModel>>('/events/vote/detail',
          queryParameters: data.toJson());

  /// 发布投票消息
  static votePublish(EventPublishVoteReqModel data) => BaseClient.client
      .post<ResWrapper<EventPublishResModel>>('/events/vote/publish',
          data: data.toJson());

  /// 修改投票消息
  static voteRepair(EventRepairVoteReqModel data) => BaseClient.client
      .post<ResWrapper<EventRepairResModel>>('/events/vote/repair',
          data: data.toJson());


  /// 获取详细随机消息
  static sortitionDetail(EventDetailGetReqModel data) =>
      BaseClient.client.get<ResWrapper<EventDetailGetSortitionResModel>>(
          '/events/sortition/detail',
          queryParameters: data.toJson());

  /// 发布随机消息
  static sortitionPublish(EventPublishSortitionReqModel data) =>
      BaseClient.client.post<ResWrapper<EventPublishResModel>>(
          '/events/sortition/publish',
          data: data.toJson());

  /// 修改随机消息
  static sortitionRepair(EventRepairSortitionReqModel data) => BaseClient.client
      .post<ResWrapper<EventRepairResModel>>('/events/sortition/repair',
          data: data.toJson());


  /// 获取详细报名消息
  static participationDetail(EventDetailGetReqModel data) =>
      BaseClient.client.get<ResWrapper<EventDetailGetParticipationResModel>>(
          '/events/participation/detail',
          queryParameters: data.toJson());

  /// 发布报名消息
  static participationPublish(EventPublishParticipationReqModel data) =>
      BaseClient.client.post<ResWrapper<EventPublishResModel>>(
          '/events/participation/publish',
          data: data.toJson());

  /// 修改报名消息
  static participationRepair(EventRepairParticipationReqModel data) => BaseClient.client
      .post<ResWrapper<EventRepairResModel>>('/events/participation/repair',
          data: data.toJson());
}
