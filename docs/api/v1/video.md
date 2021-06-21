## 一、总览

~~~yaml
/videos/get			# 获取推送视频

/videos/upload		# 上传视频
/videos/delete		# 删除视频

/videos/search		# 搜索视频

/videos/users/publications	# 获取发布视频
/videos/users/collections	# 获取收藏视频
~~~



## 二、详明

### 1.获取推送视频

~~~yaml
GET /videos/get

# req
number: Int
pointer?: String

# res
pointer: String		# 视频推送指针
captcha: Boolean	# 是否需要验证
result:
	- vid: String
	  userinfo:
	  	uid: String
	  	uname: String
	  	avatar: String
	  	motto: String
	  	sex: String
	  	type: Int	# 用户类别
	  	org_name: String
	  title: String
	  cover: String		# 封面图地址
	  tags: Array<String>
	  watch_counter: Int
	  star_counter: Int
	  comment_counter: Int
	  collect_time: String
	  create_time: String
	  update_time: String
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 2.上传视频

~~~yaml
POST /videos/upload

# req
title: String
tags?: Array<String>
file: String
location?: String

# res
vid: String
~~~

### 3.删除视频

~~~yaml
POST /videos/delete

# req
vid: String
~~~

### 4.搜索视频

~~~yaml
GET /videos/search

# req
sort_type: Int		# 按点赞量、时间正、时间反、匹配度（默认）
query: String
offset: Int
number: Int

# res
captcha: Boolean	# 是否需要验证
result:
	- vid: String
	  userinfo:
	  	uid: String
	  	uname: String
	  	avatar: String
	  	motto: String
	  	sex: String
	  	type: Int	# 用户类别
	  	org_name: String
	  title: String
	  cover: String		# 封面图地址
	  tags: Array<String>
	  watch_counter: Int
	  star_counter: Int
	  comment_counter: Int
	  collect_time: String
	  create_time: String
	  update_time: String
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 5.获取发布视频

~~~yaml
GET /videos/users/publications

# req
uid: String
offset: Int
number: Int

# res
total: Int	# 用户一共发布数
result:
	- vid: String
	  title: String
	  cover: String		# 封面图地址
	  tags: Array<String>
	  watch_counter: Int
	  star_counter: Int
	  comment_counter: Int
	  create_time: String
	  update_time: String
~~~

### 6.获取收藏视频

~~~yaml
GET /videos/users/collections

# req
uid: String
offset: Int
number: Int

# res
total: Int	# 用户一共收藏数
result:
	- vid: String
	  userinfo:
	  	uid: String
	  	uname: String
	  	avatar: String
	  	motto: String
	  	sex: String
	  	type: Int	# 用户类别
	  	org_name: String
	  title: String
	  cover: String		# 封面图地址
	  tags: Array<String>
	  watch_counter: Int
	  star_counter: Int
	  comment_counter: Int
	  collect_time: String
	  video_create_time: String
	  video_update_time: String
~~~

