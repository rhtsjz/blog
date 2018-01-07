[hbase 基于 hdfs 的分布式配置](http://hbase.apache.org/book.html#quickstart_pseudo)

文档中给的代码片段如下
``` XML
conf/hbase-site.xml

<property>
  <name>hbase.cluster.distributed</name>
  <value>true</value>
</property>

<property>
  <name>hbase.rootdir</name>
  <value>hdfs://localhost:8020/hbase</value>
</property>
```
但是 hbase 在启动时候报错

```Java
logs/hbase-root-master-zsj-zcol.log

2015-11-17 14:30:58,916 WARN  [regionserver/JC.com.cn/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: reportForDuty failed; sleeping and then retrying.
2015-11-17 14:31:01,916 INFO  [regionserver/JC.com.cn/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: reportForDuty to master=zsj-zcool,16020,1447741491911 with port=16020, startcode=1447741493329
2015-11-17 14:31:01,920 WARN  [regionserver/JC.com.cn/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: error telling master we are up
com.google.protobuf.ServiceException: java.net.SocketException: Network is unreachable
    at org.apache.hadoop.hbase.ipc.AbstractRpcClient.callBlockingMethod(AbstractRpcClient.java:231)
    at org.apache.hadoop.hbase.ipc.AbstractRpcClient$BlockingRpcChannelImplementation.callBlockingMethod(AbstractRpcClient.java:300)
    at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$BlockingStub.regionServerStartup(RegionServerStatusProtos.java:8277)
    at org.apache.hadoop.hbase.regionserver.HRegionServer.reportForDuty(HRegionServer.java:2132)
    at org.apache.hadoop.hbase.regionserver.HRegionServer.run(HRegionServer.java:826)
    at java.lang.Thread.run(Thread.java:745)
Caused by: java.net.SocketException: Network is unreachable
    at sun.nio.ch.Net.connect0(Native Method)
    at sun.nio.ch.Net.connect(Net.java:457)
    at sun.nio.ch.Net.connect(Net.java:449)
    at sun.nio.ch.SocketChannelImpl.connect(SocketChannelImpl.java:647)
    at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:192)
    at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:529)
    at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:493)
    at org.apache.hadoop.hbase.ipc.RpcClientImpl$Connection.setupConnection(RpcClientImpl.java:403)
    at org.apache.hadoop.hbase.ipc.RpcClientImpl$Connection.setupIOstreams(RpcClientImpl.java:709)
    at org.apache.hadoop.hbase.ipc.RpcClientImpl$Connection.writeRequest(RpcClientImpl.java:880)
    at org.apache.hadoop.hbase.ipc.RpcClientImpl$Connection.tracedWriteRequest(RpcClientImpl.java:849)
    at org.apache.hadoop.hbase.ipc.RpcClientImpl.call(RpcClientImpl.java:1173)
    at org.apache.hadoop.hbase.ipc.AbstractRpcClient.callBlockingMethod(AbstractRpcClient.java:216)
    ... 5 more
```
官方解释链接 [http://wiki.apache.org/hadoop/ConnectionRefused](http://wiki.apache.org/hadoop/ConnectionRefused)

根据链接中的解释修改了 /etc/hosts 将主机名 映射到了 ::1
::1 zsj-zcool
同时在 [Hadoo的webUI](http://localhost:50070/dfshealth.html#tab-overview)中看到了hdfs的端口为9000
于是同过 telnet localhost 9000 做了测试(成功)
并把Hbase的配置文件改成了下面
```` XML
conf/hbase-site.xml

<property>
  <name>hbase.cluster.distributed</name>
  <value>true</value>
</property>

<property>
  <name>hbase.rootdir</name>
  <value>hdfs://localhost:9000/hbase</value>
</property>
```
通过

