import 'package:uni_party/models/models.dart';

import 'client.dart';

class ArchiveAPI {
  static star(ArchiveStarReqModel data) =>
      BaseClient.client.post<ResWrapper<ArchiveStarResModel>>('/archive/star',
          data: data.toJson());

  static addReply(ArchiveReplyAddReqModel data) => BaseClient.client
      .post<ResWrapper<ArchiveReplyAddResModel>>('/archive/reply/add',
          data: data.toJson());

  static delReply(ArchiveReplyDelReqModel data) => BaseClient.client
      .post<ResWrapper<ArchiveReplyDelResModel>>('/archive/reply/del',
          data: data.toJson());

  static collect(ArchiveCollectReqModel data) => BaseClient.client
      .post<ResWrapper<ArchiveCollectResModel>>('/archive/collect',
          data: data.toJson());

  static behaviorSearch(ArchiveBehaviorSearchReqModel data) =>
      BaseClient.client.post<ResWrapper<ArchiveBehaviorSearchResModel>>(
          '/archive/behavior/search',
          data: data.toJson());

  static behaviorTime(ArchiveBehaviorTimeReqModel data) => BaseClient.client
      .post<ResWrapper<ArchiveBehaviorTimeResModel>>('/archive/behavior/time',
          data: data.toJson());
}
