## 一、总览

~~~yaml
/helpers/protocols/user		# 用户协议
/helpers/protocols/service	# 服务协议

/helpers/app				# 最新更新
/helpers/app/version		# 历史版本

/helpers/about/us			# 关于我们
/helpers/contact			# 联系方式
/helpers/feedback			# 反馈建议

/helpers/qn/finish			# 是否完成
/helpers/qn/submit			# 提交问卷
/helpers/qn/content			# 获取问卷
~~~



## 二、详明

### 1.获取用户协议

~~~yaml
GET /helpers/protocols/user

# req
version: String

# res
content: String
~~~

### 2.获取服务协议

~~~yaml
GET /helpers/protocols/service

# req
version: String

# res
content: String
~~~

### 3.获取最新版本

~~~yaml
GET /helpers/version

# res
version: String	# 最新版本
content: String	# 更新内容
datetime: String # 提交时间
~~~

### 4.获取所有版本

~~~yaml
GET /helpers/versions

# res
version: String
result:
	- version: String
	  content: String
	  datetime: String
~~~

### 5.关于我们

~~~yaml
GET /helpers/about/us

# res
content: String
~~~

### 6.联系我们

~~~yaml
GET /helpers/contact

# res
phone: String
email:
	feedback: String		# 反馈邮箱
	authentication: String	# 认证邮箱
	cooperation: String		# 合作邮箱
~~~

### 7.反馈建议

~~~yaml
POST /helpers/feedback

# req
type: Int
title: String
content: String
email?: String	# 不添加则使用用户默认邮箱
~~~

### 8.是否完成问卷

~~~yaml
GET /helpers/qn/finish

# req
status: Boolean
~~~

### 9.提交问卷

~~~yaml
POST /helpers/qn/submit

# req
answer: Array<Int>
~~~

### 10.获取问卷

~~~yaml
GET /helpers/qn/content

# res
naire:
	- question: String
	  options: 
~~~

