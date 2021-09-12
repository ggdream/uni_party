import 'generated/protocol.pb.dart';
import 'tcp.dart';
import 'type.dart';

class Chat {
  static late final TcpConntect tcpConnect;

  static Future<void> initialize() async {
    tcpConnect = await TcpConntect.connect();
  }

  /// 注册读取回调
  static void read(ReaderCallback callback) =>
      tcpConnect.read(callback);

  /// 心跳检测
  static void ping() {
    final msg = PingMessage();
    tcpConnect.write(msg, type: MessageType.Ping.index);
  }

  /// 确认响应
  static void ack() {
    final msg = AckMessage();
    tcpConnect.write(msg, type: MessageType.Ack.index);
  }

  /// 请求重发
  static void ret() {
    final msg = RetMessage();
    tcpConnect.write(msg, type: MessageType.Ret.index);
  }

  /// 文本消息
  static void writeText(String data, {int version = 1}) {
    final msg = TextMessage(data: data);
    tcpConnect.write(msg, version: version, type: MessageType.Text.index);
  }

  /// 二进制消息
  static void writeBinray(String sign, {int version = 1}) {
    final msg = BinaryMessage(sign: sign);
    tcpConnect.write(msg, version: version, type: MessageType.Binary.index);
  }
}
