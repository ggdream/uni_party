/// WS传输的消息模型
class ChatWrapper {
  final int type;
  final String time;
  final String sign;
  final String message;

  ChatWrapper({
    required this.type,
    required this.time,
    required this.sign,
    required this.message,
  });

  ChatWrapper.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        time = json['time'],
        sign = json['sign'],
        message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['time'] = this.time;
    data['sign'] = this.sign;
    data['message'] = this.message;
    return data;
  }
}
