## 一、总览

~~~yaml
/events/sub			# 获取订阅消息

/events/delete	# 删除消息
/events/detail	# 获取详情

/events/notice/{create,update}
/events/vote/{create,update}
/events/sortition/{create,update}
/events/participation/{create,update}
# 新建消息、修改消息

/events/search		# 搜索消息

/events/users/:/publications	# 获取发布消息
/events/users/:uid/collections	# 获取收藏消息

/events/archive/star		# 点赞（短视频业务）
/events/archive/reply/add	# 添加评论（短视频业务）
/events/archive/reply/del	# 删除评论（短视频业务）
/events/archive/collect		# 收藏（短视频业务）
~~~



## 二、详明

### 1.获取订阅消息

~~~yaml
GET /events/sub

# req
offset: Int
number: Int

# res
unread: Int		# 总未读消息数
events:
	- eid: String
	  title: String
	  type: Int		# 消息类别
	  tags: Array<String>
	  userinfo:
	  	uid: String
	  	uname: String
	  	avatar_url: String
	  	motto: String
	  	sex: String
	  	type: Int	# 用户类别
	  	org_name: String
	  create_time: String
	  update_time: String
	  get_counter: Int
	  watch_counter: Int
	  comment_counter: Int
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 2.删除消息

~~~yaml
POST /events/delete

# req
type: Int
eid: String
~~~

### 3.获取详情

~~~~yaml
GET /events/{1,2,3,4}/detail

# req
type: Int
eid: String

# res
# common area
eid: String
title: String
content: String
type: Int		# 消息类别
tags: Array<String>
create_time: String
update_time: String
get_counter: Int
watch_counter: Int
comment_counter: Int
is_get: Boolean
is_collect: Boolean
event_detail:
	********************
userinfo:
    uid: String
    uname: String
    avatar_url: String
    motto: String
    sex: String
    type: Int	# 用户类别
    org_name: String

# notice
files:
	- name: String
	  type: String
	  location: String

# vote
multiple: Boolean
allowed_number: Int			# 允许选择的数量，开启`multiple`时生效
is_over: Boolean
deadline: String
options: [""]
participated_number: Int	# 参与的人数
is_participated: Boolean
selected_no: [0]			# 选择的编号，当`is_participated`为true时生效
result: [0]					# 动态，根据具体情况而定。长度等于options数量

# sortition
required_number: Int
allowed_cancel: Boolean
is_over: Boolean
deadline: String
is_participated: Boolean
is_selected: Boolean		# 是否被选中
participated_number: Int	# 参与的人数
result: [0]					# 动态，根据具体情况而定。长度等于required_number

# participation
required_number: Int
allowed_cancel: Boolean
is_over: Boolean
deadline: String
is_participated: Boolean
participated_number: Int	# 参与的人数
result: [0]					# 动态，根据具体情况而定。长度等于required_number
~~~~

### 4.发布通知类消息

~~~yaml
POST /events/notice/create

# req
title: String
content: String
tags: Array<String>
files: Array<File>

# res
eid: String
type: Int
~~~

### 5.修改通知类消息

~~~yaml
POST /events/notice/update

# req
eid: String
title: String
content: String
tags: Array<String>
files: Array<File>

# res
eid: String
frequency: Int	# 看做 第几次修改 或者一共修改了几次
~~~

### 6.发布投票类消息

~~~yaml
POST /events/vote/create

# req
title: String
content: String
tags: Array<String>
allowed_number: Int
deadline: String
options: Array<String>

# res
eid: String
type: Int
~~~

### 7.修改投票类消息

~~~yaml
POST /events/vote/update

# req
eid: String
title: String
content: String
tags: Array<String>
allowed_number: Int
deadline: String
options: Array<String>

# res
eid: String
frequency: Int	# 看做 第几次修改 或者一共修改了几次
~~~

### 8.发布随机类消息

~~~yaml
POST /events/sortition/create

# req
title: String
content: String
tags: Array<String>
required_number: Int
allowed_cancel: Boolean
deadline: String

# res
eid: String
type: Int
~~~

### 9.修改随机类消息

~~~yaml
POST /events/sortition/update

# req
eid: String
title: String
content: String
tags: Array<String>
required_number: Int
allowed_cancel: Boolean
deadline: String

# res
eid: String
frequency: Int	# 看做 第几次修改 或者一共修改了几次
~~~

### 10.发布报名类消息

~~~yaml
POST /events/participation/create

# req
title: String
content: String
tags: Array<String>
required_number: Int
allowed_cancel: Boolean
deadline: String

# res
eid: String
type: Int
~~~

### 11.修改报名类消息

~~~yaml
POST /events/participation/update

# req
eid: String
title: String
content: String
tags: Array<String>
required_number: Int
allowed_cancel: Boolean
deadline: String

# res
eid: String
frequency: Int	# 看做 第几次修改 或者一共修改了几次
~~~

### 12.搜索消息

~~~yaml
GET /events/search

# req
type: Int			# 消息类型
start_time:	String	# 起始时间
end_time: String	# 结束时间
query: String		# 消息字段

# res
total: Int			# 一共匹配数量
match:
	- eid: String
	  title: String
	  type: Int		# 消息类别
	  tags: Array<String>
	  userinfo:
	  	uid: String
	  	uname: String
	  	avatar_url: String
	  	motto: String
	  	sex: String
	  	type: Int	# 用户类别
	  	org_name: String
	  create_time: String
	  update_time: String
	  get_counter: Int
	  watch_counter: Int
	  comment_counter: Int
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 13.获取发布消息

~~~yaml
GET /events/users/publications

# req
uid: Int
offset: Int
number: Int

# res
total: Int	# 用户一共发布数
result:
	- e
id: String
	  title: String
	  type: Int
	  tags: Array<String>
	  watch_counter: Int
	  star_counter: Int
	  comment_counter: Int
	  create_time: String
	  update_time: String
	  is_get: Boolean
	  is_collect: Boolean
~~~

### 14.获取收藏消息

~~~yaml
GET /events/users/collections

# req
uid: String
offset: Int
number: Int

# res
total: Int	# 用户一共收藏数
result:
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

### 15.点赞

~~~yaml
POST /events/archive/star

# req
vid: String
type: Int

# res
status: Boolean
~~~

### 16.添加评论

~~~yaml
POST /events/archive/reply/add

# req
vid: String
root?: String
parent?: String
message: String

# res
rid: String
message: String
datetime: String
need_captcha: Boolean
~~~

### 17.删除评论

~~~yaml
POST /events/archive/reply/del

# req
vid: String
rid: String

# res
need_captcha: Boolean
~~~

### 18.收藏

~~~yaml
POST /events/archive/collect

# req
vid: String
type: Int

# res
status: Boolean
~~~

