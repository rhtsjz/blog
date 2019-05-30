解决方式
```shell
bin/hdfs namenode -format CID-9a168a78-b351-4a50-a580-416808efdb0a
bin/hdfs namenode -format CID-60f8fb5c-1101-4d38-aeea-3abab19a973b
rm -rf /tmp/hadoop-root/*
```  
参考：
[Hadoop Multinode cluster. Data node not working properly](http://stackoverflow.com/questions/26907878/hadoop-multinode-cluster-data-node-not-working-properly)  

报错信息如下
```Java
2015-12-16 17:03:13,860 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: registered UNIX signal handlers for [TERM, HUP, INT]
2015-12-16 17:03:14,203 INFO org.apache.hadoop.metrics2.impl.MetricsConfig: loaded properties from hadoop-metrics2.properties
2015-12-16 17:03:14,244 INFO org.apache.hadoop.metrics2.impl.MetricsSystemImpl: Scheduled snapshot period at 10 second(s).
2015-12-16 17:03:14,244 INFO org.apache.hadoop.metrics2.impl.MetricsSystemImpl: DataNode metrics system started
2015-12-16 17:03:14,248 INFO org.apache.hadoop.hdfs.server.datanode.BlockScanner: Initialized block scanner with targetBytesPerSec 1048576
2015-12-16 17:03:14,249 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Configured hostname is zcool01-500-552cn
2015-12-16 17:03:14,253 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Starting DataNode with maxLockedMemory = 0
2015-12-16 17:03:14,268 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Opened streaming server at /0.0.0.0:50010
2015-12-16 17:03:14,269 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Balancing bandwith is 1048576 bytes/s
2015-12-16 17:03:14,269 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Number threads for balancing is 5
2015-12-16 17:03:14,320 INFO org.mortbay.log: Logging to org.slf4j.impl.Log4jLoggerAdapter(org.mortbay.log) via org.mortbay.log.Slf4jLog
2015-12-16 17:03:14,325 INFO org.apache.hadoop.security.authentication.server.AuthenticationFilter: Unable to initialize FileSignerSecretProvider, falling back to use random secrets.
2015-12-16 17:03:14,328 INFO org.apache.hadoop.http.HttpRequestLog: Http request log for http.requests.datanode is not defined
2015-12-16 17:03:14,332 INFO org.apache.hadoop.http.HttpServer2: Added global filter 'safety' (class=org.apache.hadoop.http.HttpServer2$QuotingInputFilter)
2015-12-16 17:03:14,333 INFO org.apache.hadoop.http.HttpServer2: Added filter static_user_filter (class=org.apache.hadoop.http.lib.StaticUserWebFilter$StaticUserFilter) to context datanode
2015-12-16 17:03:14,333 INFO org.apache.hadoop.http.HttpServer2: Added filter static_user_filter (class=org.apache.hadoop.http.lib.StaticUserWebFilter$StaticUserFilter) to context logs
2015-12-16 17:03:14,333 INFO org.apache.hadoop.http.HttpServer2: Added filter static_user_filter (class=org.apache.hadoop.http.lib.StaticUserWebFilter$StaticUserFilter) to context static
2015-12-16 17:03:14,341 INFO org.apache.hadoop.http.HttpServer2: Jetty bound to port 40465
2015-12-16 17:03:14,341 INFO org.mortbay.log: jetty-6.1.26
2015-12-16 17:03:14,463 INFO org.mortbay.log: Started HttpServer2$SelectChannelConnectorWithSafeStartup@localhost:40465
2015-12-16 17:03:14,524 INFO org.apache.hadoop.hdfs.server.datanode.web.DatanodeHttpServer: Listening HTTP traffic on /0.0.0.0:50075
2015-12-16 17:03:14,611 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: dnUserName = root
2015-12-16 17:03:14,611 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: supergroup = supergroup
2015-12-16 17:03:14,635 INFO org.apache.hadoop.ipc.CallQueueManager: Using callQueue class java.util.concurrent.LinkedBlockingQueue
2015-12-16 17:03:14,645 INFO org.apache.hadoop.ipc.Server: Starting Socket Reader #1 for port 50020
2015-12-16 17:03:14,661 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Opened IPC server at /0.0.0.0:50020
2015-12-16 17:03:14,668 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Refresh request received for nameservices: null
2015-12-16 17:03:14,681 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Starting BPOfferServices for nameservices: <default>
2015-12-16 17:03:14,688 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Block pool <registering> (Datanode Uuid unassigned) service to zsj-zcool/172.16.4.175:9000 starting to offer service
2015-12-16 17:03:14,691 INFO org.apache.hadoop.ipc.Server: IPC Server Responder: starting
2015-12-16 17:03:14,692 INFO org.apache.hadoop.ipc.Server: IPC Server listener on 50020: starting
2015-12-16 17:03:14,976 INFO org.apache.hadoop.hdfs.server.common.Storage: Lock on /tmp/hadoop-root/dfs/data/in_use.lock acquired by nodename 27177@zcool01-500-552cn
2015-12-16 17:03:14,978 WARN org.apache.hadoop.hdfs.server.common.Storage: java.io.IOException: Incompatible clusterIDs in /tmp/hadoop-root/dfs/data: namenode clusterID = CID-dc911fb8-d3f3-4abe-8c51-ff4812d3e70a; datanode clusterID = CID-60f8fb5c-1101-4d38-aeea-3abab19a973b
2015-12-16 17:03:14,978 FATAL org.apache.hadoop.hdfs.server.datanode.DataNode: Initialization failed for Block pool <registering> (Datanode Uuid unassigned) service to zsj-zcool/172.16.4.175:9000. Exiting. 
java.io.IOException: All specified directories are failed to load.
	at org.apache.hadoop.hdfs.server.datanode.DataStorage.recoverTransitionRead(DataStorage.java:477)
	at org.apache.hadoop.hdfs.server.datanode.DataNode.initStorage(DataNode.java:1361)
	at org.apache.hadoop.hdfs.server.datanode.DataNode.initBlockPool(DataNode.java:1326)
	at org.apache.hadoop.hdfs.server.datanode.BPOfferService.verifyAndSetNamespaceInfo(BPOfferService.java:316)
	at org.apache.hadoop.hdfs.server.datanode.BPServiceActor.connectToNNAndHandshake(BPServiceActor.java:223)
	at org.apache.hadoop.hdfs.server.datanode.BPServiceActor.run(BPServiceActor.java:801)
	at java.lang.Thread.run(Thread.java:745)
2015-12-16 17:03:14,979 WARN org.apache.hadoop.hdfs.server.datanode.DataNode: Ending block pool service for: Block pool <registering> (Datanode Uuid unassigned) service to zsj-zcool/172.16.4.175:9000
2015-12-16 17:03:15,080 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: Removed Block pool <registering> (Datanode Uuid unassigned)
2015-12-16 17:03:17,080 WARN org.apache.hadoop.hdfs.server.datanode.DataNode: Exiting Datanode
2015-12-16 17:03:17,081 INFO org.apache.hadoop.util.ExitUtil: Exiting with status 0
2015-12-16 17:03:17,082 INFO org.apache.hadoop.hdfs.server.datanode.DataNode: SHUTDOWN_MSG: 
/************************************************************
SHUTDOWN_MSG: Shutting down DataNode at zcool01-500-552cn/172.16.4.191
************************************************************/

```
