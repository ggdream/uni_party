import 'dart:async';

import 'package:sqflite/sqflite.dart';

/// SQLite 数据库管理器
class DBManager {
  static const _VERSION = 3;
  static const _DB_NAME = 'store.db';

  static const _CHAT_MESSAGE_NAME = 'chat_message';
  static const _CHAT_LIST_NAME = 'chat_list';

  static Database? _database;

  /// 初始化数据库，获得连接句柄
  static init() async {
    _database = await openDatabase(
      _DB_NAME,
      version: _VERSION,
      onCreate: _onCreate,
    );
  }

  /// 关闭数据库连接
  static close() {
    if (_database == null) return;

    _database!.close();
    _database = null;
  }

  /// 获取数据库连接实例
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database!;
  }

  /// 创建表
  static FutureOr<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute('''CREATE TABLE IF NOT EXISTS $_CHAT_MESSAGE_NAME (
    `id`  INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
    `mid` TEXT NOT NULL,
    `type` INTEGER NOT NULL,
    `from_uid` INTEGER NOT NULL,
    `to_uid` INTEGER,
    `group_id` TEXT,
    `message` TEXT,
    `url` TEXT,
    `other` TEXT,
    `datetime` INTEGER NOT NULL,
    `version` TEXT NOT NULL,
    `signature` TEXT NOT NULL,
)''');
    batch.execute('''CREATE TABLE IF NOT EXISTS $_CHAT_LIST_NAME (
    `id`  INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
    `is_group` INTEGER NOT NULL,
    `uid` INTEGER,
    `gid` TEXT,
)''');
    await batch.commit();
  }

  /// 插入新聊天消息
  static Future<int> insertChatMessage(Map<String, dynamic> values) async {
    return await _database!.insert(_CHAT_MESSAGE_NAME, values);
  }

  /// 删除聊天消息
  static Future<int> deleteChatMessages(int myUID, dynamic uidORgid) async {
    var whereStr = '';
    List<dynamic>? whereArgs;
    switch (uidORgid.runtimeType) {
      case int:
        whereStr =
            '(from_uid = $myUID AND to_uid = $uidORgid) OR (from_uid = $uidORgid AND to_uid = $myUID)';
        break;
      case String:
        whereStr = 'group_id = ?';
        whereArgs = [uidORgid];
        break;
      default:
        throw 'type error';
    }

    return await _database!.delete(
      _CHAT_MESSAGE_NAME,
      where: whereStr,
      whereArgs: whereArgs,
    );
  }

  /// 分页查询聊天消息
  static Future<List<Map<String, dynamic>>> queryChatMessages(
      int uid, int offset, int number) async {
    return await _database!.query(
      _CHAT_MESSAGE_NAME,
      where: '(from_uid = ? OR to_uid = ?) AND group_id = \'\'',
      whereArgs: [uid, uid],
      limit: number,
      offset: offset,
    );
  }

  /// 聊天列表添新
  static insertChatList(int myUID, Map<String, dynamic> _data) async {
    // 更新了
    final data = new Map<String, dynamic>();
    if (_data.containsKey('group_id')) {
      data['is_group'] = 1; // 是群聊
      data['gid'] = _data['group_id'];
    } else {
      data['is_group'] = 0;
      data['uid'] =
          myUID == _data['from_uid'] ? _data['to_uid'] : _data['from_uid'];
    }

    return await _database!.insert(_CHAT_LIST_NAME, data);
  }

  /// 将某个移除聊天列表
  static removeChatList(bool isGroup, dynamic uidORgid) async {
    var whereStr = '';
    if (isGroup) {
      whereStr = 'gid = ?';
    } else {
      whereStr = 'uid = ?';
    }

    return await _database!.delete(
      _CHAT_LIST_NAME,
      where: whereStr,
      whereArgs: [uidORgid],
    );
  }

  static Future<List<Map<String, dynamic>>> queryChatList() async {
    return await _database!.rawQuery(
        'SELECT * FROM `chat_list` AS a LEFT OUTER JOIN `chat_message` AS b ON (a.is_group = 1 AND a.gid = b.group_id) OR (a.is_group = 0 AND (a.uid = b.from_uid OR a.uid = b.to_uid) AND b.group_id is null) GROUP BY a.uid, a.gid ORDER BY b.id DESC LIMIT 0, 1;');
  }
}
