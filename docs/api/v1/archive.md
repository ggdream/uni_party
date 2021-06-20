## 一、总览

~~~yaml
/archive/star		# 点赞（短视频业务）

/archive/reply/add	# 添加评论（短视频业务）
/archive/reply/del	# 删除评论（短视频业务）

/archive/collect	# 收藏（短视频业务）

/archive/behavior/search	# 用户行为收集: 搜索
/archive/behavior/time		# 用户行为收集: 搜索
~~~



## 二、详明

### 1.点赞

~~~yaml
POST /archive/star

# req
vid: String
type: Int

# res
status: Boolean
~~~

### 2.添加评论

~~~yaml
POST /archive/reply/add

# req
vid: String
root?: String
parent?: String
message: String

# res
rid: String
message: String
datetime: Strin
need_captcha: Boolean
~~~

### 3.删除评论

~~~yaml
POST /archive/reply/del

# req
vid: String
rid: String

# res
need_captcha: Boolean
~~~

### 4.收藏

~~~yaml
POST /archive/collect

# req
vid: String
type: Int

# res
status: Boolean
~~~

### 5.用户搜索行为收集

~~~yaml
POST /archive/behavior/search

# req（现在只考虑视频业务）
query: String
~~~

### 6.用户观看时长收集

~~~yaml
POST /archive/behavior/time

# req（现在只考虑视频业务）
vid: String
~~~



