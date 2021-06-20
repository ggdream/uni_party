## 一、总览

~~~yaml
/chat/connect		# 建立Websocket连接
~~~



## 二、详明

~~~yaml
GET /chat/connect

# req
signature: 环境验证

# res if it's failed

# Websocket
code: Int			# 消息状态
type: Int			# Ping(心跳监测),FullSync(全量同步),IncrSync(增量同步),Chat(文本消息),Notify(后端通知)
time: Int			# 发送时间
sign: String		# 消息签名
data: String		# 消息内容
~~~

### 1.心跳检测

~~~yaml
Ping

# req
message: "ping"

# res
message: "pong"
~~~

### 2.全量同步

~~~yaml
FullSync

# res
total: Int	# 一共返回消息的数量
result:
	- from_uid: Int
	  datetime: String
	  did: String	  # 消息的id号
	  message: String
~~~

### 3.增量同步

~~~yaml
IncrSync

# req
uid: Int
pointer: String
number: Int

# res
total: Int	# 一共返回消息的数量
result:
	- from_uid: Int
	 datetime: String
	  did: String	  # 消息的id号
	  message: String
~~~

### 4.文本聊天消息

~~~yaml
Chat

# req
message: String
to_uid: Int

# res
datetime: String
message: String
~~~

### 5.后端通知

~~~yaml
Notify

# req
message: String
~~~

