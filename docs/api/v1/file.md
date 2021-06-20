## 一、总览

~~~yaml
/files/images/:yyyymmdd/:hh/{hash}.webp		# 获取图片：固定哈希

# /files/videos/:yyyymmdd/:hh/{hash}.mp4		# 获取视频：动态哈希（未来）
/files/videos/:yyyymmdd/:hh/{hash}.mp4		# 获取视频：固定哈希

/files/others/:yyyymmdd/:hh/{hash}			# 获取文件：固定哈希
~~~



## 二、详明

### 1.获取图片

~~~yaml
GET /files/images/:yyyymmdd/:hh/{hash}.webp

nginx物理映射
~~~

### 2.获取视频

~~~yaml
GET /files/videos/:yyyymmdd/:hh/{hash}.mp4

nginx物理映射
~~~

### 3.获取文件

~~~yaml
GET/files/others/:yyyymmdd/:hh/{hash}

nginx物理映射
~~~

