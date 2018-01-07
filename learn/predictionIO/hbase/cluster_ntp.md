集群机器时间不一致问题  
解决方法  
[http://blog.csdn.net/rzhzhz/article/details/7660611](http://blog.csdn.net/rzhzhz/article/details/7660611)  
[官方文档 Basic Prerequisites NTP](http://hbase.apache.org/book.html#basic.prerequisites)
[NTP - Network Time Protocol](http://www.tldp.org/LDP/sag/html/ntp.html)
[国内NTP服务器](http://www.douban.com/note/171309770/)

```Java
2015-11-17 18:05:34,903 INFO  [main] zookeeper.ZooKeeper: Client environment:java.library.path=/usr/java/packages/lib/amd64:/usr/lib64:/lib64:/lib:/usr/lib
2015-11-17 18:05:34,903 INFO  [main] zookeeper.ZooKeeper: Client environment:java.io.tmpdir=/tmp
2015-11-17 18:05:34,903 INFO  [main] zookeeper.ZooKeeper: Client environment:java.compiler=<NA>
2015-11-17 18:05:34,903 INFO  [main] zookeeper.ZooKeeper: Client environment:os.name=Linux
2015-11-17 18:05:34,903 INFO  [main] zookeeper.ZooKeeper: Client environment:os.arch=amd64
2015-11-17 18:05:34,903 INFO  [main] zookeeper.ZooKeeper: Client environment:os.version=2.6.32-504.23.4.el6.x86_64
2015-11-17 18:05:34,903 INFO  [main] zookeeper.ZooKeeper: Client environment:user.name=root
2015-11-17 18:05:34,904 INFO  [main] zookeeper.ZooKeeper: Client environment:user.home=/root
2015-11-17 18:05:34,904 INFO  [main] zookeeper.ZooKeeper: Client environment:user.dir=/opt/recommender/PredictionIO-0.9.5/vendors/hbase-1.0.0
2015-11-17 18:05:34,904 INFO  [main] zookeeper.ZooKeeper: Initiating client connection, connectString=localhost:2181 sessionTimeout=90000 watcher=regionserver:160200x0, quorum=localhost:2181, baseZNode=/hbase
2015-11-17 18:05:34,923 INFO  [main-SendThread(localhost:2181)] zookeeper.ClientCnxn: Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
2015-11-17 18:05:35,020 INFO  [main-SendThread(localhost:2181)] zookeeper.ClientCnxn: Socket connection established to localhost/127.0.0.1:2181, initiating session
2015-11-17 18:05:35,035 INFO  [main-SendThread(localhost:2181)] zookeeper.ClientCnxn: Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x15114e80f380001, negotiated timeout = 90000
2015-11-17 18:05:35,048 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: starting
2015-11-17 18:05:35,049 INFO  [RpcServer.listener,port=16020] ipc.RpcServer: RpcServer.listener,port=16020: starting
2015-11-17 18:05:35,114 INFO  [main] mortbay.log: Logging to org.slf4j.impl.Log4jLoggerAdapter(org.mortbay.log) via org.mortbay.log.Slf4jLog
2015-11-17 18:05:35,118 INFO  [main] http.HttpRequestLog: Http request log for http.requests.regionserver is not defined
2015-11-17 18:05:35,129 INFO  [main] http.HttpServer: Added global filter 'safety' (class=org.apache.hadoop.hbase.http.HttpServer$QuotingInputFilter)
2015-11-17 18:05:35,137 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context regionserver
2015-11-17 18:05:35,137 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context static
2015-11-17 18:05:35,137 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context logs
2015-11-17 18:05:35,156 INFO  [main] http.HttpServer: Jetty bound to port 16030
2015-11-17 18:05:35,156 INFO  [main] mortbay.log: jetty-6.1.26
2015-11-17 18:05:35,564 INFO  [main] mortbay.log: Started SelectChannelConnector@0.0.0.0:16030
2015-11-17 18:05:35,648 INFO  [regionserver/zcooldev2/172.16.0.7:16020] zookeeper.RecoverableZooKeeper: Process identifier=hconnection-0x1c2be475 connecting to ZooKeeper ensemble=localhost:2181
2015-11-17 18:05:35,648 INFO  [regionserver/zcooldev2/172.16.0.7:16020] zookeeper.ZooKeeper: Initiating client connection, connectString=localhost:2181 sessionTimeout=90000 watcher=hconnection-0x1c2be4750x0, quorum=localhost:2181, baseZNode=/hbase
2015-11-17 18:05:35,656 INFO  [regionserver/zcooldev2/172.16.0.7:16020-SendThread(localhost:2181)] zookeeper.ClientCnxn: Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
2015-11-17 18:05:35,656 INFO  [regionserver/zcooldev2/172.16.0.7:16020-SendThread(localhost:2181)] zookeeper.ClientCnxn: Socket connection established to localhost/127.0.0.1:2181, initiating session
2015-11-17 18:05:35,672 INFO  [regionserver/zcooldev2/172.16.0.7:16020-SendThread(localhost:2181)] zookeeper.ClientCnxn: Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x15114e80f380002, negotiated timeout = 90000
2015-11-17 18:05:35,759 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: ClusterId : 9d60c40f-bd23-47ac-952d-ba936be00281
2015-11-17 18:05:35,798 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.MemStoreFlusher: globalMemStoreLimit=768.5 M, globalMemStoreLimitLowMark=730.1 M, maxHeap=1.9 G
2015-11-17 18:05:35,801 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: CompactionChecker runs every 10sec
2015-11-17 18:05:35,838 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: reportForDuty to master=zsj-zcool,16020,1447754865604 with port=16020, startcode=1447754734222
2015-11-17 18:05:36,061 FATAL [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: Master rejected startup because clock is out of sync
org.apache.hadoop.hbase.ClockOutOfSyncException: org.apache.hadoop.hbase.ClockOutOfSyncException: Server zcooldev2,16020,1447754734222 has been rejected; Reported time is too far out of sync with master.  Time difference of 132877ms > max allowed of 30000ms
	at org.apache.hadoop.hbase.master.ServerManager.checkClockSkew(ServerManager.java:357)
	at org.apache.hadoop.hbase.master.ServerManager.regionServerStartup(ServerManager.java:250)
	at org.apache.hadoop.hbase.master.MasterRpcServices.regionServerStartup(MasterRpcServices.java:298)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$2.callBlockingMethod(RegionServerStatusProtos.java:7910)
	at org.apache.hadoop.hbase.ipc.RpcServer.call(RpcServer.java:2031)
	at org.apache.hadoop.hbase.ipc.CallRunner.run(CallRunner.java:107)
	at org.apache.hadoop.hbase.ipc.RpcExecutor.consumerLoop(RpcExecutor.java:130)
	at org.apache.hadoop.hbase.ipc.RpcExecutor$1.run(RpcExecutor.java:107)
	at java.lang.Thread.run(Thread.java:745)

	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:408)
	at org.apache.hadoop.ipc.RemoteException.instantiateException(RemoteException.java:106)
	at org.apache.hadoop.ipc.RemoteException.unwrapRemoteException(RemoteException.java:95)
	at org.apache.hadoop.hbase.protobuf.ProtobufUtil.getRemoteException(ProtobufUtil.java:313)
	at org.apache.hadoop.hbase.regionserver.HRegionServer.reportForDuty(HRegionServer.java:2134)
	at org.apache.hadoop.hbase.regionserver.HRegionServer.run(HRegionServer.java:826)
	at java.lang.Thread.run(Thread.java:745)
Caused by: org.apache.hadoop.hbase.ipc.RemoteWithExtrasException(org.apache.hadoop.hbase.ClockOutOfSyncException): org.apache.hadoop.hbase.ClockOutOfSyncException: Server zcooldev2,16020,1447754734222 has been rejected; Reported time is too far out of sync with master.  Time difference of 132877ms > max allowed of 30000ms
	at org.apache.hadoop.hbase.master.ServerManager.checkClockSkew(ServerManager.java:357)
	at org.apache.hadoop.hbase.master.ServerManager.regionServerStartup(ServerManager.java:250)
	at org.apache.hadoop.hbase.master.MasterRpcServices.regionServerStartup(MasterRpcServices.java:298)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$2.callBlockingMethod(RegionServerStatusProtos.java:7910)
	at org.apache.hadoop.hbase.ipc.RpcServer.call(RpcServer.java:2031)
	at org.apache.hadoop.hbase.ipc.CallRunner.run(CallRunner.java:107)
	at org.apache.hadoop.hbase.ipc.RpcExecutor.consumerLoop(RpcExecutor.java:130)
	at org.apache.hadoop.hbase.ipc.RpcExecutor$1.run(RpcExecutor.java:107)
	at java.lang.Thread.run(Thread.java:745)

	at org.apache.hadoop.hbase.ipc.RpcClientImpl.call(RpcClientImpl.java:1199)
	at org.apache.hadoop.hbase.ipc.AbstractRpcClient.callBlockingMethod(AbstractRpcClient.java:216)
	at org.apache.hadoop.hbase.ipc.AbstractRpcClient$BlockingRpcChannelImplementation.callBlockingMethod(AbstractRpcClient.java:300)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$BlockingStub.regionServerStartup(RegionServerStatusProtos.java:8277)
	at org.apache.hadoop.hbase.regionserver.HRegionServer.reportForDuty(HRegionServer.java:2132)
	... 2 more
2015-11-17 18:05:36,063 FATAL [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: ABORTING region server zcooldev2,16020,1447754734222: Unhandled: org.apache.hadoop.hbase.ClockOutOfSyncException: Server zcooldev2,16020,1447754734222 has been rejected; Reported time is too far out of sync with master.  Time difference of 132877ms > max allowed of 30000ms
	at org.apache.hadoop.hbase.master.ServerManager.checkClockSkew(ServerManager.java:357)
	at org.apache.hadoop.hbase.master.ServerManager.regionServerStartup(ServerManager.java:250)
	at org.apache.hadoop.hbase.master.MasterRpcServices.regionServerStartup(MasterRpcServices.java:298)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$2.callBlockingMethod(RegionServerStatusProtos.java:7910)
	at org.apache.hadoop.hbase.ipc.RpcServer.call(RpcServer.java:2031)
	at org.apache.hadoop.hbase.ipc.CallRunner.run(CallRunner.java:107)
	at org.apache.hadoop.hbase.ipc.RpcExecutor.consumerLoop(RpcExecutor.java:130)
	at org.apache.hadoop.hbase.ipc.RpcExecutor$1.run(RpcExecutor.java:107)
	at java.lang.Thread.run(Thread.java:745)

org.apache.hadoop.hbase.ClockOutOfSyncException: org.apache.hadoop.hbase.ClockOutOfSyncException: Server zcooldev2,16020,1447754734222 has been rejected; Reported time is too far out of sync with master.  Time difference of 132877ms > max allowed of 30000ms
	at org.apache.hadoop.hbase.master.ServerManager.checkClockSkew(ServerManager.java:357)
	at org.apache.hadoop.hbase.master.ServerManager.regionServerStartup(ServerManager.java:250)
	at org.apache.hadoop.hbase.master.MasterRpcServices.regionServerStartup(MasterRpcServices.java:298)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$2.callBlockingMethod(RegionServerStatusProtos.java:7910)
	at org.apache.hadoop.hbase.ipc.RpcServer.call(RpcServer.java:2031)
	at org.apache.hadoop.hbase.ipc.CallRunner.run(CallRunner.java:107)
	at org.apache.hadoop.hbase.ipc.RpcExecutor.consumerLoop(RpcExecutor.java:130)
	at org.apache.hadoop.hbase.ipc.RpcExecutor$1.run(RpcExecutor.java:107)
	at java.lang.Thread.run(Thread.java:745)

	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:408)
	at org.apache.hadoop.ipc.RemoteException.instantiateException(RemoteException.java:106)
	at org.apache.hadoop.ipc.RemoteException.unwrapRemoteException(RemoteException.java:95)
	at org.apache.hadoop.hbase.protobuf.ProtobufUtil.getRemoteException(ProtobufUtil.java:313)
	at org.apache.hadoop.hbase.regionserver.HRegionServer.reportForDuty(HRegionServer.java:2134)
	at org.apache.hadoop.hbase.regionserver.HRegionServer.run(HRegionServer.java:826)
	at java.lang.Thread.run(Thread.java:745)
Caused by: org.apache.hadoop.hbase.ipc.RemoteWithExtrasException(org.apache.hadoop.hbase.ClockOutOfSyncException): org.apache.hadoop.hbase.ClockOutOfSyncException: Server zcooldev2,16020,1447754734222 has been rejected; Reported time is too far out of sync with master.  Time difference of 132877ms > max allowed of 30000ms
	at org.apache.hadoop.hbase.master.ServerManager.checkClockSkew(ServerManager.java:357)
	at org.apache.hadoop.hbase.master.ServerManager.regionServerStartup(ServerManager.java:250)
	at org.apache.hadoop.hbase.master.MasterRpcServices.regionServerStartup(MasterRpcServices.java:298)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$2.callBlockingMethod(RegionServerStatusProtos.java:7910)
	at org.apache.hadoop.hbase.ipc.RpcServer.call(RpcServer.java:2031)
	at org.apache.hadoop.hbase.ipc.CallRunner.run(CallRunner.java:107)
	at org.apache.hadoop.hbase.ipc.RpcExecutor.consumerLoop(RpcExecutor.java:130)
	at org.apache.hadoop.hbase.ipc.RpcExecutor$1.run(RpcExecutor.java:107)
	at java.lang.Thread.run(Thread.java:745)

	at org.apache.hadoop.hbase.ipc.RpcClientImpl.call(RpcClientImpl.java:1199)
	at org.apache.hadoop.hbase.ipc.AbstractRpcClient.callBlockingMethod(AbstractRpcClient.java:216)
	at org.apache.hadoop.hbase.ipc.AbstractRpcClient$BlockingRpcChannelImplementation.callBlockingMethod(AbstractRpcClient.java:300)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$BlockingStub.regionServerStartup(RegionServerStatusProtos.java:8277)
	at org.apache.hadoop.hbase.regionserver.HRegionServer.reportForDuty(HRegionServer.java:2132)
	... 2 more
2015-11-17 18:05:36,064 FATAL [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: RegionServer abort: loaded coprocessors are: []
2015-11-17 18:05:36,080 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: Dump of metrics as JSON on abort: {
  "beans" : [ {
    "name" : "java.lang:type=Memory",
    "modelerType" : "sun.management.MemoryImpl",
    "ObjectPendingFinalizationCount" : 0,
    "NonHeapMemoryUsage" : {
      "committed" : 38567936,
      "init" : 2555904,
      "max" : -1,
      "used" : 37997312
    },
    "Verbose" : false,
    "HeapMemoryUsage" : {
      "committed" : 123666432,
      "init" : 127926272,
      "max" : 2014707712,
      "used" : 24177272
    },
    "ObjectName" : "java.lang:type=Memory"
  } ],
  "beans" : [ {
    "name" : "Hadoop:service=HBase,name=RegionServer,sub=IPC",
    "modelerType" : "RegionServer,sub=IPC",
    "tag.Context" : "regionserver",
    "tag.Context" : "regionserver",
    "tag.Hostname" : "zcooldev2",
    "queueSize" : 0,
    "numCallsInGeneralQueue" : 0,
    "numCallsInReplicationQueue" : 0,
    "numCallsInPriorityQueue" : 0,
    "numOpenConnections" : 0,
    "numActiveHandler" : 0,
    "receivedBytes" : 0,
    "authenticationSuccesses" : 0,
    "authorizationFailures" : 0,
    "ProcessCallTime_num_ops" : 0,
    "ProcessCallTime_min" : 0,
    "ProcessCallTime_max" : 0,
    "ProcessCallTime_mean" : 0.0,
    "ProcessCallTime_median" : 0.0,
    "ProcessCallTime_75th_percentile" : 0.0,
    "ProcessCallTime_95th_percentile" : 0.0,
    "ProcessCallTime_99th_percentile" : 0.0,
    "authorizationSuccesses" : 0,
    "sentBytes" : 0,
    "QueueCallTime_num_ops" : 0,
    "QueueCallTime_min" : 0,
    "QueueCallTime_max" : 0,
    "QueueCallTime_mean" : 0.0,
    "QueueCallTime_median" : 0.0,
    "QueueCallTime_75th_percentile" : 0.0,
    "QueueCallTime_95th_percentile" : 0.0,
    "QueueCallTime_99th_percentile" : 0.0,
    "authenticationFailures" : 0
  } ],
  "beans" : [ ],
  "beans" : [ ]
}
2015-11-17 18:05:36,096 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: STOPPED: Unhandled: org.apache.hadoop.hbase.ClockOutOfSyncException: Server zcooldev2,16020,1447754734222 has been rejected; Reported time is too far out of sync with master.  Time difference of 132877ms > max allowed of 30000ms
	at org.apache.hadoop.hbase.master.ServerManager.checkClockSkew(ServerManager.java:357)
	at org.apache.hadoop.hbase.master.ServerManager.regionServerStartup(ServerManager.java:250)
	at org.apache.hadoop.hbase.master.MasterRpcServices.regionServerStartup(MasterRpcServices.java:298)
	at org.apache.hadoop.hbase.protobuf.generated.RegionServerStatusProtos$RegionServerStatusService$2.callBlockingMethod(RegionServerStatusProtos.java:7910)
	at org.apache.hadoop.hbase.ipc.RpcServer.call(RpcServer.java:2031)
	at org.apache.hadoop.hbase.ipc.CallRunner.run(CallRunner.java:107)
	at org.apache.hadoop.hbase.ipc.RpcExecutor.consumerLoop(RpcExecutor.java:130)
	at org.apache.hadoop.hbase.ipc.RpcExecutor$1.run(RpcExecutor.java:107)
	at java.lang.Thread.run(Thread.java:745)

2015-11-17 18:05:36,096 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: Stopping infoServer
2015-11-17 18:05:36,099 INFO  [regionserver/zcooldev2/172.16.0.7:16020] mortbay.log: Stopped SelectChannelConnector@0.0.0.0:16030
2015-11-17 18:05:36,199 INFO  [regionserver/zcooldev2/172.16.0.7:16020] flush.RegionServerFlushTableProcedureManager: Stopping region server flush procedure manager abruptly.
2015-11-17 18:05:36,200 INFO  [regionserver/zcooldev2/172.16.0.7:16020] snapshot.RegionServerSnapshotManager: Stopping RegionServerSnapshotManager abruptly.
2015-11-17 18:05:36,200 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: aborting server zcooldev2,16020,1447754734222
2015-11-17 18:05:36,200 INFO  [regionserver/zcooldev2/172.16.0.7:16020] client.ConnectionManager$HConnectionImplementation: Closing zookeeper sessionid=0x15114e80f380002
2015-11-17 18:05:36,217 INFO  [regionserver/zcooldev2/172.16.0.7:16020-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-17 18:05:36,217 INFO  [regionserver/zcooldev2/172.16.0.7:16020] zookeeper.ZooKeeper: Session: 0x15114e80f380002 closed
2015-11-17 18:05:36,218 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: stopping server zcooldev2,16020,1447754734222; all regions closed.
2015-11-17 18:05:36,318 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.Leases: regionserver/zcooldev2/172.16.0.7:16020 closing leases
2015-11-17 18:05:36,318 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.Leases: regionserver/zcooldev2/172.16.0.7:16020 closed leases
2015-11-17 18:05:36,319 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.CompactSplitThread: Waiting for Split Thread to finish...
2015-11-17 18:05:36,319 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.CompactSplitThread: Waiting for Merge Thread to finish...
2015-11-17 18:05:36,319 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.CompactSplitThread: Waiting for Large Compaction Thread to finish...
2015-11-17 18:05:36,319 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.CompactSplitThread: Waiting for Small Compaction Thread to finish...
2015-11-17 18:05:36,320 INFO  [regionserver/zcooldev2/172.16.0.7:16020] ipc.RpcServer: Stopping server on 16020
2015-11-17 18:05:36,320 INFO  [RpcServer.listener,port=16020] ipc.RpcServer: RpcServer.listener,port=16020: stopping
2015-11-17 18:05:36,321 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopped
2015-11-17 18:05:36,321 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopping
2015-11-17 18:05:36,342 INFO  [regionserver/zcooldev2/172.16.0.7:16020] zookeeper.ZooKeeper: Session: 0x15114e80f380001 closed
2015-11-17 18:05:36,342 INFO  [main-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-17 18:05:36,342 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: stopping server zcooldev2,16020,1447754734222; zookeeper connection closed.
2015-11-17 18:05:36,342 INFO  [regionserver/zcooldev2/172.16.0.7:16020] regionserver.HRegionServer: regionserver/zcooldev2/172.16.0.7:16020 exiting
2015-11-17 18:05:36,342 ERROR [main] regionserver.HRegionServerCommandLine: Region server exiting
java.lang.RuntimeException: HRegionServer Aborted
	at org.apache.hadoop.hbase.regionserver.HRegionServerCommandLine.start(HRegionServerCommandLine.java:68)
	at org.apache.hadoop.hbase.regionserver.HRegionServerCommandLine.run(HRegionServerCommandLine.java:87)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:70)
	at org.apache.hadoop.hbase.util.ServerCommandLine.doMain(ServerCommandLine.java:126)
	at org.apache.hadoop.hbase.regionserver.HRegionServer.main(HRegionServer.java:2502)
2015-11-17 18:05:36,343 INFO  [Thread-5] regionserver.ShutdownHook: Shutdown hook starting; hbase.shutdown.hook=true; fsShutdownHook=org.apache.hadoop.fs.FileSystem$Cache$ClientFinalizer@74bf1791
2015-11-17 18:05:36,343 INFO  [Thread-5] regionserver.ShutdownHook: Starting fs shutdown hook thread.
2015-11-17 18:05:36,345 INFO  [Thread-5] regionserver.ShutdownHook: Shutdown hook finished.

```
