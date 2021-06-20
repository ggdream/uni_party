# 后端接口设计稿（v1）



[admin](./admin.md)

[auth](./auth.md)

[chat](./chat.md)

[comment](./comment.md)

[event](./event.md)

[file](./file.md)

[helper](./helper.md)

[open](./open.md)

[user](./user.md)

[video](./video.md)

# 



> https://127.0.0.1:443/{scope}/v1/...

## 一、common

### (一)用户信息类





~~~sh
/auth/login/cipher		# 密码登录
/auth/login/code		# 验证码登录
/auth/login/code/phone	# 发送手机验证码
/auth/login/code/email	# 发送邮箱验证码

/auth/verify/student		# 学生认证
/auth/verify/company		# 公司认证
/auth/verify/university		# 高校认证
/auth/verify/institution	# 机构认证

/auth/safety/environment	# 环境审核
~~~

~~~sh
/helpers/protocols/user		# 用户协议
/helpers/protocols/service	# 服务协议

/helpers/apps				# 最新更新
/helpers/apps/versions		# 历史版本

/helpers/about				# 关于我们
/helpers/contact			# 联系方式
/helpers/feedback			# 反馈建议
~~~

~~~sh
/events				# 获取订阅的消息
/events/:eid		# 获取消息的数据
/events/:eid/repair	# 修复消息
/events/:eid/delete	# 删除消息
/events/:eid/detail	# 获取消息详细数据

/events/publish		# 发布消息
/events/search		# 搜索消息
/events/users/:uid	# 获取发布的消息
~~~

~~~sh
/videos				# 获取推送的视频
/videos/upload		# 上传视频
/videos/delete		# 删除视频
/videos/search		# 搜索视频
/videos/users/:uid	# 获取发布的视频
~~~

~~~sh
/blob/images/:yyyymm/:dd/{hash}@{width}*{height}.webp	# 图片：像素

/blob/videos/:yyyymm/:dd/{hash}@{width}*{height}.mp4	# 视频：分辨率
~~~

~~~yaml
/chat/connect			# 建立WebSocket连接
/chat/messages/clear	# 清除消息

type: msgType		# 数据类型
time: pubTime		# 发送时间
sign: signature		# 安全签名
data: coreData		# 核心数据

# type对应data字段的结构体
# 1.ping 心跳检测
[]

# 2.chatPull 拉取离线消息
[]

# 3.chatMsgText	聊天文本消息
[to, text]

# 4.chatMsgBinray 聊天二进制消息
[to, data]

~~~





## 二、open

~~~
/open/
~~~







## 三、admin(内网)

~~~sh
/super/auth/
~~~

