## 一、总览

~~~sh
/users				# 获取用户信息
/users/followers	# 获取粉丝信息
/users/following	# 获取关注信息
/users/following/act	# 关注用户
/users/events/publications	# 获取发布的消息
/users/videos/publications	# 获取发布的视频
/users/events/collections	# 收藏的消息
/users/videos/collections	# 收藏的视频

/users/search			# 搜索用户

/users/profile/avatar	# 上传头像
/users/profile/update	# 更新个人信息

/users/settings/theme/get		# 获取当前主题色
/users/settings/theme/set		# 设置当前主题色
/users/settings/push			# 获取推送选择项
/users/settings/push/event		# 是否推送消息
/users/settings/push/video		# 是否推送视频
~~~





## 二、详明

### 1.获取用户信息

~~~yaml
GET /users

# req
uid: String

# res
uid: Int
uname: String
birthday: String
sex: String
avatar: String
motto: String
level: Int
sub_level: Int
type: Int	# 用户类型
org_name: String
followers: Int
following: Int
event_counter: Int	# 发表数
video_counter: Int	# 发表数
is_following: Boolean
~~~

### 2.获取粉丝信息

~~~yaml
GET /users/followers

# req
uid: String
offset: Int
number: Int

# res
total: Int
users: Array
	- uid: Int
	  uname: String
	  avatar: String
	  sex: String
	  motto: String
	  type: Int
	  org_name: String
~~~

### 3.获取关注信息

~~~yaml
GET /users/following

# req
uid: String
offset: Int
number: Int

# res
total: Int
users: Array
	- uid: Int
	  uname: String
	  avatar: String
	  sex: String
	  motto: String
	  type: Int
	  org_name: String
~~~

### 4.添加用户关注

~~~yaml
POST /users/following/act

# req
uid: String
type: Int
~~~

### 5.获取发布消息

~~~yaml
GET /users/events/publications

# req
uid: String
offset: Int
number: Int

# res
total: Int	# 用户一共发布数
events:
	- eid: String
	  tags: Array<String>
	  type: Int
	  title: String
	  get_counter: Int
	  watch_counter: Int
	  comment_counter: Int
	  create_time: String
	  update_time: String
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 6.获取发布视频

~~~yaml
GET /users/videos/publications

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
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 7.获取收藏消息

~~~yaml
GET /users/events/collections

# req
uid: String
offset: Int
number: Int

# res
total: Int	# 用户一共收藏数
events:
	- eid: String
	  title: String
	  type: Int
	  tags: Array<String>
	  userinfo:
	  	uid: String
	  	uname: String
	  	avatar: String
	  	motto: String
	  	sex: String
	  	type: Int	# 用户类别
	  	org_name: String
	  get_counter: Int
	  watch_counter: Int
	  comment_counter: Int
	  collect_time: String
	  create_time: String
	  update_time: String
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 8.获取收藏视频

~~~yaml
GET /users/videos/collections

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
	  create_time: String
	  update_time: String
	  	is_get: Boolean
	  is_collect: Boolean
~~~

### 9.搜索用户

~~~yaml
GET /users/search

# req
type: Int		# 查询类型（根据能不能转成uid来确定）
query: String	# 查询内容

# res
total: Int		# 匹配到的数量
match:
	- uid: Int
	  uname: String
	  avatar: String
	  motto: String
	  sex: String
	  type: Int	# 用户类型
	  org_name: String
~~~

### 10.上传头像

~~~yaml
POST /users/profile/avatar

# req
file: String

# res
url: String
~~~

### 11.更新个人信息

~~~yaml
POST /users/profile/update

# req
uname: String
birthday: String
sex: String
motto: String
~~~

### 12.获取主题色

~~~yaml
GET /users/settings/theme/get

# res
color: String
~~~

### 13.设置主题色

~~~yaml
POST /users/settings/theme/

# req
color: String
~~~

### 14.获取推送选择项

~~~yaml
GET /users/settings/push

# res
event: Boolean
video: Boolean
~~~

### 15.消息推送选择项

~~~yaml
POST /users/settings/push/event

# req
status: Boolean
~~~

### 16.视频推送选择项

~~~yaml
POST /users/settings/push/video

# req
status: Boolean
~~~



