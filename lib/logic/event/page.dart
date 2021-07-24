import 'package:uni_party/router/namespace.dart';

import 'publish.dart';

class EventTypePage {
  static String? getPageByEnum(EventPublishType type) {
    switch (type) {
      case EventPublishType.notice:
        return RoutesNamespace.EventSubscribeNotify;
      case EventPublishType.vote:
        return RoutesNamespace.EventSubscribeVote;
      case EventPublishType.sortition:
        return RoutesNamespace.EventSubscribeRandom;
      case EventPublishType.participation:
        return RoutesNamespace.EventSubscribeApply;
      default:
        return null;
    }
  }
}
