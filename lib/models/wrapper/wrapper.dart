/// 网络响应外层元数据包裹模型
class ResWrapper<T> {
  int code;
  String message;
  int ttl;
  T data;

  ResWrapper({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  ResWrapper.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        ttl = json['ttl'],
        data = json['data'];

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['code'] = this.code;
  //   data['message'] = this.message;
  //   data['ttl'] = this.ttl;
  //   data['data'] = this.data;
  //   return data;
  // }
}
