## 一、总览

~~~yaml
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



## 二、详明

### 1.密码登录

~~~yaml
POST /auth/login/cipher

# req
account: String
password: String

# res
require_captcha: Boolean
token: String
~~~

### 2.验证码登录

~~~yaml
POST /auth/login/code

# req
device_code: String
sms_code: String

# res
require_captcha: Boolean
token: String
~~~

### 3.发送手机验证码

~~~yaml
GET /auth/login/code/phone

# req
phone: String

# res
device_code: String
~~~

### 4.发送邮箱验证码

~~~yaml
GET /auth/login/code/email

# req
email: String

# res
device_code: String
~~~

### 5.学生认证

~~~yaml
POST /auth/verify/student
~~~

### 6.公司认证

~~~yaml
POST /auth/verify/company
~~~

### 7.高校认证

~~~yaml
POST /auth/verify/university
~~~

### 8.机构认证

~~~yaml
POST /auth/verify/institution
~~~

### 9.环境审核

~~~yaml
GET /auth/safety/environment

# req
signature: String
~~~

