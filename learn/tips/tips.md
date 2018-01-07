## Linux/Unix
### 配置java
```
sudo update-alternatives --config java
```

### 环境变量修改之后需要source一下才会生效
### 查看本机的外网IP:
```shell
curl http://icanhazip.com
```
### zip 压缩文件以及文件夹并排除指定类型的文件/文件夹
```shell
zip -r foo.zip foo #--recurse-paths
zip -r foo foo -x \*.o #--exclude
```

### SQL
###更新表结构：增加列
``` SQL
ALTER TABLE message_private 
  ADD COLUMN cate INT NOT NULL DEFAULT 0 COMMENT '私信类别:(0.默认,收件箱; 1.垃圾箱)', 
  ADD COLUMN back_cate INT NOT NULL DEFAULT 0 COMMENT '私信在后台的类别:(0.默认,收件箱; 1.垃圾箱; 2.后台忽略;3.后台删除)';
```
###更新表
``` SQL
UPDATE bad_word SET `status` = 1 WHERE LEVEL < 100 and STATUS = 0
```


```java
-Dmybatis.generator.overwrite=true mybatis-generator:generate -X
```
