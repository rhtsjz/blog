### 9. 数据库
#### 1. 过期是如何实现的
redisDb中有一个 `expire`字典记录了具有过期时间的键的过期时间 key为键 value为过期时间
过期键删除策略定时删除(内存友好)/惰性删除(CPU友好)/定期删除(权衡CPU与内存) expireIfNeeded activeExpireRecycle

### 17. 集群
#### 1. `MOVED` 和 `ASK`的异同
#### 2. 常见消息

### 21. SORT
sort命令通过将被排序的键包含的元素载入到数组里面,然后对数组进行排序来完成对键进行排序的工作,(数字值/字符串值)快速排序算法
SORT多个选项时的执行顺序:SORT(ALPHA/ASC/DESC/BY)-->LIMIT-->GET-->STORE-->SEND
除了GET外,其他选项的摆放位置不会影响SORT命令排序的结果

### 22. bit array
todo [How to count the number of set bits in a 32-bit integer?](https://stackoverflow.com/questions/109023/how-to-count-the-number-of-set-bits-in-a-32-bit-integer)