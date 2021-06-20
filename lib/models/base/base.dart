class _DataModel {
  _DataModel.from(Map<String, dynamic> json);
  Map<String, dynamic> toJson() => {};
}

class ResModel<T extends _DataModel> {
  int code;
  String message;
  int ttl;
  T data;

  ResModel({
    required this.code,
    required this.message,
    required this.ttl,
    required this.data,
  });

  ResModel.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'],
        ttl = json['ttl'],
        data = json['data'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['ttl'] = this.ttl;
    data['data'] = this.data.toJson();
    return data;
  }
}
