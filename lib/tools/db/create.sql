CREATE TABLE IF NOT EXISTS `chat_message` (
    `id` INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
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
);
CREATE TABLE IF NOT EXISTS `chat_list` (
    `id` INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT,
    `is_group` INTEGER NOT NULL,
    `uid` INTEGER,
    `gid` TEXT,
);

SELECT * FROM `chat_list` AS a LEFT OUTER JOIN `chat_message` AS b ON (a.is_group = 1 AND a.gid = b.group_id) OR (a.is_group = 0 AND (a.uid = b.from_uid OR a.uid = b.to_uid) AND b.group_id is null) GROUP BY a.uid, a.gid ORDER BY b.id DESC LIMIT 0, 1;