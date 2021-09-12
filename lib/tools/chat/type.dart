typedef ReaderCallback = void Function(MessageType type, List<int> data);

/// 消息类型
enum MessageType {
  /// 心跳检测
  Ping,

  /// 确认消息
  Ack,

  /// 要求重发
  Ret,

  /// 文本消息
  Text,

  /// 二进制消息
  Binary,
}

/// 报文字段
class Messager {
  static const int versionLen = 1;
  static const int typeLen = 1;
  static const int dataLen = 2;
  static const int headCRC = 4;
  static const int bodyCRC = 4;

  static final headerLen = versionLen + typeLen + dataLen + headCRC + bodyCRC;
}
