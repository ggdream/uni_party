# 管理员系统

> 不进入微服务体系，在公司内网下运行。
>
> 技术选型：Python - MVC - Sanic



## 一、总览

~~~yaml
/manage/videos/check		# 视频审核
/manage/videos/watch		# 视频查看
/manage/videos/pass			# 审核通过
/manage/videos/lock			# 封锁视频
/manage/videos/delete		# 删除视频

/manage/events/watch		# 消息查看
/manage/events/lock			# 封锁消息
/manage/events/delete		# 删除消息

/manage/users/info			# 查看用户信息
/manage/users/info/update	# 修改用户信息
/manage/users/videos/pub	# 获取用户发表的视频
/manage/users/videos/col	# 获取用户收藏的视频
/manage/users/lock			# 封锁账号
/manage/users/delete		# 删除账号

/manage/rank/info			# 获取当前等级信息

/manage/safety/login		# 密码登录
/manage/safety/reset		# 重置密码
~~~



## 二、详明



