// /// Ping 请求
// class ChatWrapperPingReqModel {
//   final String message;

//   ChatWrapperPingReqModel({
//     required this.message,
//   });

//   ChatWrapperPingReqModel.fromJson(Map<String, dynamic> json)
//       : message = json['message'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     return data;
//   }
// }

// /// Ping 响应
// class ChatWrapperPingResModel {
//   final String message;

//   ChatWrapperPingResModel({
//     required this.message,
//   });

//   ChatWrapperPingResModel.fromJson(Map<String, dynamic> json)
//       : message = json['message'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     return data;
//   }
// }

// /// FullSync 请求
// class ChatWrapperFullSyncReqModel {
//   ChatWrapperFullSyncReqModel();

//   ChatWrapperFullSyncReqModel.fromJson(Map<String, dynamic> json);

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     return data;
//   }
// }

// /// FullSync 响应
// class ChatWrapperFullSyncResModel {
//   late final int total;
//   late final List<_Result> result;

//   ChatWrapperFullSyncResModel({
//     required this.total,
//     required this.result,
//   });

//   ChatWrapperFullSyncResModel.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     result = [];
//     json['result'].forEach((v) {
//       result.add(new _Result.fromJson(v));
//     });
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['result'] = this.result.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

// class _Result {
//   final int fromUid;
//   final String datetime;
//   final String did;
//   final String message;

//   _Result({
//     required this.fromUid,
//     required this.datetime,
//     required this.did,
//     required this.message,
//   });

//   _Result.fromJson(Map<String, dynamic> json)
//       : fromUid = json['from_uid'],
//         datetime = json['datetime'],
//         did = json['did'],
//         message = json['message'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['from_uid'] = this.fromUid;
//     data['datetime'] = this.datetime;
//     data['did'] = this.did;
//     data['message'] = this.message;
//     return data;
//   }
// }

// /// IncrSync 请求
// class ChatWrapperIncrSyncReqModel {
//   final String uid;
//   final String pointer;
//   final String number;

//   ChatWrapperIncrSyncReqModel({
//     required this.uid,
//     required this.pointer,
//     required this.number,
//   });

//   ChatWrapperIncrSyncReqModel.fromJson(Map<String, dynamic> json)
//       : uid = json['uid'],
//         pointer = json['pointer'],
//         number = json['number'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uid'] = this.uid;
//     data['pointer'] = this.pointer;
//     data['number'] = this.number;
//     return data;
//   }
// }

// /// IncrSync 响应
// class ChatWrapperIncrSyncResModel {
//   late final int total;
//   late final List<_Result> result;

//   ChatWrapperIncrSyncResModel({
//     required this.total,
//     required this.result,
//   });

//   ChatWrapperIncrSyncResModel.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     result = [];
//     json['result'].forEach((v) {
//       result.add(new _Result.fromJson(v));
//     });
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['result'] = this.result.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

// /// Chat 请求
// class ChatWrapperChatReqModel {
//   final String message;
//   final String toUid;

//   ChatWrapperChatReqModel({
//     required this.message,
//     required this.toUid,
//   });

//   ChatWrapperChatReqModel.fromJson(Map<String, dynamic> json)
//       : message = json['message'],
//         toUid = json['to_uid'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['to_uid'] = this.toUid;
//     return data;
//   }
// }

// /// Chat 响应
// class ChatWrapperChatResModel {
//   final String datetime;
//   final String message;

//   ChatWrapperChatResModel({
//     required this.datetime,
//     required this.message,
//   });

//   ChatWrapperChatResModel.fromJson(Map<String, dynamic> json)
//       : datetime = json['datetime'],
//         message = json['message'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['datetime'] = this.datetime;
//     data['message'] = this.message;
//     return data;
//   }
// }

// /// Notify 请求
// class ChatWrapperNotifyReqModel {
//   final String message;

//   ChatWrapperNotifyReqModel({
//     required this.message,
//   });

//   ChatWrapperNotifyReqModel.fromJson(Map<String, dynamic> json)
//       : message = json['message'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     return data;
//   }
// }

// /// Notify 响应
// class ChatWrapperNotifyResModel {
//   ChatWrapperNotifyResModel();

//   ChatWrapperNotifyResModel.fromJson(Map<String, dynamic> json);

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     return data;
//   }
// }
