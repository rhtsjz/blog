### 9. 数据库
#### 1. 过期是如何实现的
redisDb中有一个 `expire`字典记录了具有过期时间的键的过期时间 key为键 value为过期时间
过期键删除策略定时删除(内存友好)/惰性删除(CPU友好)/定期删除(权衡CPU与内存) expireIfNeeded activeExpireRecycle

### 17. 集群
#### 1. `MOVED` 和 `ASK`的异同
#### 2. 常见消息