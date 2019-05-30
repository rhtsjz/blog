HBase Meta 问题  
解决方法  
[http://stackoverflow.com/questions/28563167/hbase-master-not-starting-correctly](http://stackoverflow.com/questions/28563167/hbase-master-not-starting-correctly)  
[http://stackoverflow.com/questions/24333183/hbase-master-keeps-dying-claims-a-hbasenamespace-already-exists](http://stackoverflow.com/questions/24333183/hbase-master-keeps-dying-claims-a-hbasenamespace-already-exists)
```Java
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:java.library.path=/opt/recommender/PredictionIO-0.9.5/vendors/hadoop-2.7.1/lib/native
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:java.io.tmpdir=/tmp
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:java.compiler=<NA>
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:os.name=Linux
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:os.arch=amd64
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:os.version=3.16.0-43-generic
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:user.name=root
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:user.home=/root
2015-11-18 10:06:16,266 INFO  [main] zookeeper.ZooKeeper: Client environment:user.dir=/opt/recommender/PredictionIO-0.9.5/vendors/hbase-1.0.0
2015-11-18 10:06:16,267 INFO  [main] zookeeper.ZooKeeper: Initiating client connection, connectString=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181 sessionTimeout=90000 watcher=master:160200x0, quorum=
172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181, baseZNode=/hbase
2015-11-18 10:06:16,286 INFO  [main-SendThread(172.16.0.7:2181)] zookeeper.ClientCnxn: Opening socket connection to server 172.16.0.7/172.16.0.7:2181. Will not attempt to authenticate using SASL (unknown e
rror)
2015-11-18 10:06:16,289 INFO  [main-SendThread(172.16.0.7:2181)] zookeeper.ClientCnxn: Socket connection established to 172.16.0.7/172.16.0.7:2181, initiating session
2015-11-18 10:06:16,464 INFO  [main-SendThread(172.16.0.7:2181)] zookeeper.ClientCnxn: Session establishment complete on server 172.16.0.7/172.16.0.7:2181, sessionid = 0x25118579e230000, negotiated timeout
 = 90000
2015-11-18 10:06:16,536 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: starting
2015-11-18 10:06:16,536 INFO  [RpcServer.listener,port=16020] ipc.RpcServer: RpcServer.listener,port=16020: starting
2015-11-18 10:06:16,578 INFO  [main] mortbay.log: Logging to org.slf4j.impl.Log4jLoggerAdapter(org.mortbay.log) via org.mortbay.log.Slf4jLog
2015-11-18 10:06:16,580 INFO  [main] http.HttpRequestLog: Http request log for http.requests.master is not defined
2015-11-18 10:06:16,588 INFO  [main] http.HttpServer: Added global filter 'safety' (class=org.apache.hadoop.hbase.http.HttpServer$QuotingInputFilter)
2015-11-18 10:06:16,590 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context master
2015-11-18 10:06:16,590 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context static
2015-11-18 10:06:16,590 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context logs
2015-11-18 10:06:16,601 INFO  [main] http.HttpServer: Jetty bound to port 16030
2015-11-18 10:06:16,601 INFO  [main] mortbay.log: jetty-6.1.26
2015-11-18 10:06:16,860 INFO  [main] mortbay.log: Started SelectChannelConnector@0.0.0.0:16030
2015-11-18 10:06:16,862 INFO  [main] master.HMaster: hbase.rootdir=hdfs://172.16.4.175:9000/hbase, hbase.cluster.distributed=true
2015-11-18 10:06:16,870 INFO  [main] mortbay.log: jetty-6.1.26
2015-11-18 10:06:16,871 INFO  [main] mortbay.log: Started SelectChannelConnector@0.0.0.0:16010
2015-11-18 10:06:16,871 INFO  [main] master.HMaster: Adding backup master ZNode /hbase/backup-masters/zsj-zcool,16020,1447812375640
2015-11-18 10:06:16,956 INFO  [zsj-zcool:16020.activeMasterManager] master.ActiveMasterManager: Deleting ZNode for /hbase/backup-masters/zsj-zcool,16020,1447812375640 from backup master directory
2015-11-18 10:06:16,969 INFO  [zsj-zcool:16020.activeMasterManager] master.ActiveMasterManager: Registered Active Master=zsj-zcool,16020,1447812375640
2015-11-18 10:06:16,993 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.RecoverableZooKeeper: Process identifier=hconnection-0x1b3ee89c connecting to ZooKeeper ensemble=172.16.4.7:2181,172.16.4.175:2
181,172.16.0.7:2181
2015-11-18 10:06:16,993 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.ZooKeeper: Initiating client connection, connectString=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181 sessionTimeout=90000 w
atcher=hconnection-0x1b3ee89c0x0, quorum=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181, baseZNode=/hbase
2015-11-18 10:06:16,998 INFO  [master/zsj-zcool/172.16.4.175:16020-SendThread(172.16.0.7:2181)] zookeeper.ClientCnxn: Opening socket connection to server 172.16.0.7/172.16.0.7:2181. Will not attempt to aut
henticate using SASL (unknown error)
2015-11-18 10:06:16,999 INFO  [master/zsj-zcool/172.16.4.175:16020-SendThread(172.16.0.7:2181)] zookeeper.ClientCnxn: Socket connection established to 172.16.0.7/172.16.0.7:2181, initiating session
2015-11-18 10:06:17,009 INFO  [master/zsj-zcool/172.16.4.175:16020-SendThread(172.16.0.7:2181)] zookeeper.ClientCnxn: Session establishment complete on server 172.16.0.7/172.16.0.7:2181, sessionid = 0x2511
8579e230001, negotiated timeout = 90000
2015-11-18 10:06:17,027 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: ClusterId : 9d60c40f-bd23-47ac-952d-ba936be00281
2015-11-18 10:06:17,502 INFO  [zsj-zcool:16020.activeMasterManager] fs.HFileSystem: Added intercepting call to namenode#getBlockLocations so can do block reordering using class class org.apache.hadoop.hbas
e.fs.HFileSystem$ReorderWALBlocks
2015-11-18 10:06:17,530 INFO  [zsj-zcool:16020.activeMasterManager] coordination.SplitLogManagerCoordination: Found 0 orphan tasks and 0 rescan nodes
2015-11-18 10:06:17,555 INFO  [zsj-zcool:16020.activeMasterManager] zookeeper.RecoverableZooKeeper: Process identifier=hconnection-0x7a73b2ae connecting to ZooKeeper ensemble=172.16.4.7:2181,172.16.4.175:2
181,172.16.0.7:2181
2015-11-18 10:06:17,555 INFO  [zsj-zcool:16020.activeMasterManager] zookeeper.ZooKeeper: Initiating client connection, connectString=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181 sessionTimeout=90000 w
atcher=hconnection-0x7a73b2ae0x0, quorum=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181, baseZNode=/hbase
2015-11-18 10:06:17,555 INFO  [zsj-zcool:16020.activeMasterManager-SendThread(172.16.4.175:2181)] zookeeper.ClientCnxn: Opening socket connection to server 172.16.4.175/172.16.4.175:2181. Will not attempt to authenticate using SASL (unknown error)
2015-11-18 10:06:17,556 INFO  [zsj-zcool:16020.activeMasterManager-SendThread(172.16.4.175:2181)] zookeeper.ClientCnxn: Socket connection established to 172.16.4.175/172.16.4.175:2181, initiating session
2015-11-18 10:06:17,571 INFO  [zsj-zcool:16020.activeMasterManager-SendThread(172.16.4.175:2181)] zookeeper.ClientCnxn: Session establishment complete on server 172.16.4.175/172.16.4.175:2181, sessionid = 0x511857a0660000, negotiated timeout = 90000
2015-11-18 10:06:17,589 INFO  [zsj-zcool:16020.activeMasterManager] balancer.StochasticLoadBalancer: loading config
2015-11-18 10:06:17,619 INFO  [zsj-zcool:16020.activeMasterManager] master.HMaster: Server active/primary master=zsj-zcool,16020,1447812375640, sessionid=0x25118579e230000, setting cluster-up flag (Was=true)
2015-11-18 10:06:17,639 INFO  [zsj-zcool:16020.activeMasterManager] procedure.ZKProcedureUtil: Clearing all procedure znodes: /hbase/flush-table-proc/acquired /hbase/flush-table-proc/reached /hbase/flush-table-proc/abort
2015-11-18 10:06:17,652 INFO  [zsj-zcool:16020.activeMasterManager] procedure.ZKProcedureUtil: Clearing all procedure znodes: /hbase/online-snapshot/acquired /hbase/online-snapshot/reached /hbase/online-snapshot/abort
2015-11-18 10:06:17,673 INFO  [zsj-zcool:16020.activeMasterManager] zookeeper.RecoverableZooKeeper: Process identifier=replicationLogCleaner connecting to ZooKeeper ensemble=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181
2015-11-18 10:06:17,673 INFO  [zsj-zcool:16020.activeMasterManager] zookeeper.ZooKeeper: Initiating client connection, connectString=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181 sessionTimeout=90000 watcher=replicationLogCleaner0x0, quorum=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181, baseZNode=/hbase
2015-11-18 10:06:17,673 INFO  [zsj-zcool:16020.activeMasterManager-SendThread(172.16.4.175:2181)] zookeeper.ClientCnxn: Opening socket connection to server 172.16.4.175/172.16.4.175:2181. Will not attempt to authenticate using SASL (unknown error)
2015-11-18 10:06:17,673 INFO  [zsj-zcool:16020.activeMasterManager-SendThread(172.16.4.175:2181)] zookeeper.ClientCnxn: Socket connection established to 172.16.4.175/172.16.4.175:2181, initiating session
2015-11-18 10:06:17,684 INFO  [zsj-zcool:16020.activeMasterManager-SendThread(172.16.4.175:2181)] zookeeper.ClientCnxn: Session establishment complete on server 172.16.4.175/172.16.4.175:2181, sessionid = 0x511857a0660001, negotiated timeout = 90000
2015-11-18 10:06:17,708 INFO  [zsj-zcool:16020.activeMasterManager] master.ServerManager: Waiting for region servers count to settle; currently checked in 0, slept for 0 ms, expecting minimum of 1, maximum of 2147483647, timeout of 4500 ms, interval of 1500 ms.
2015-11-18 10:06:18,639 INFO  [B.defaultRpcServer.handler=1,queue=1,port=16020] master.ServerManager: Registering server=zcooldev2,16020,1447812376145
2015-11-18 10:06:18,660 INFO  [zsj-zcool:16020.activeMasterManager] master.ServerManager: Waiting for region servers count to settle; currently checked in 1, slept for 952 ms, expecting minimum of 1, maximum of 2147483647, timeout of 4500 ms, interval of 1500 ms.
2015-11-18 10:06:19,016 INFO  [B.defaultRpcServer.handler=2,queue=2,port=16020] master.ServerManager: Registering server=JC.com.cn,16020,1447812377050
2015-11-18 10:06:19,061 INFO  [zsj-zcool:16020.activeMasterManager] master.ServerManager: Waiting for region servers count to settle; currently checked in 2, slept for 1353 ms, expecting minimum of 1, maximum of 2147483647, timeout of 4500 ms, interval of 1500 ms.
2015-11-18 10:06:20,565 INFO  [zsj-zcool:16020.activeMasterManager] master.ServerManager: Waiting for region servers count to settle; currently checked in 2, slept for 2857 ms, expecting minimum of 1, maximum of 2147483647, timeout of 4500 ms, interval of 1500 ms.
2015-11-18 10:06:22,069 INFO  [zsj-zcool:16020.activeMasterManager] master.ServerManager: Waiting for region servers count to settle; currently checked in 2, slept for 4361 ms, expecting minimum of 1, maximum of 2147483647, timeout of 4500 ms, interval of 1500 ms.
2015-11-18 10:06:22,219 INFO  [zsj-zcool:16020.activeMasterManager] master.ServerManager: Finished waiting for region servers count to settle; checked in 2, slept for 4511 ms, expecting minimum of 1, maximum of 2147483647, master is running
2015-11-18 10:06:22,224 INFO  [zsj-zcool:16020.activeMasterManager] master.MasterFileSystem: Log folder hdfs://172.16.4.175:9000/hbase/WALs/JC.com.cn,16020,1447764266910 doesn't belong to a known region server, splitting
2015-11-18 10:06:22,226 INFO  [zsj-zcool:16020.activeMasterManager] master.MasterFileSystem: Log folder hdfs://172.16.4.175:9000/hbase/WALs/JC.com.cn,16020,1447812377050 belongs to an existing region server
2015-11-18 10:06:22,228 INFO  [zsj-zcool:16020.activeMasterManager] master.MasterFileSystem: Log folder hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943 doesn't belong to a known region server, splitting
2015-11-18 10:06:22,229 INFO  [zsj-zcool:16020.activeMasterManager] master.MasterFileSystem: Log folder hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447812376145 belongs to an existing region server
2015-11-18 10:06:22,259 INFO  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: dead splitlog workers [zcooldev2,16020,1447764266943]
2015-11-18 10:06:22,262 INFO  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: started splitting 1 logs in [hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting] for [zcooldev2,16020,1447764266943]
2015-11-18 10:06:22,335 INFO  [main-EventThread] coordination.SplitLogManagerCoordination: task /hbase/splitWAL/WALs%2Fzcooldev2%2C16020%2C1447764266943-splitting%2Fzcooldev2%252C16020%252C1447764266943..meta.1447764273380.meta acquired by zcooldev2,16020,1447812376145
2015-11-18 10:06:22,532 INFO  [zsj-zcool,16020,1447812375640.splitLogManagerTimeoutMonitor] master.SplitLogManager: total tasks = 1 unassigned = 0 tasks={/hbase/splitWAL/WALs%2Fzcooldev2%2C16020%2C1447764266943-splitting%2Fzcooldev2%252C16020%252C1447764266943..meta.1447764273380.meta=last_update = 1447812382387 last_version = 2 cur_worker_name = zcooldev2,16020,1447812376145 status = in_progress incarnation = 0 resubmits = 0 batch = installed = 1 done = 0 error = 0}
2015-11-18 10:06:26,496 INFO  [main-EventThread] coordination.SplitLogManagerCoordination: task /hbase/splitWAL/WALs%2Fzcooldev2%2C16020%2C1447764266943-splitting%2Fzcooldev2%252C16020%252C1447764266943..meta.1447764273380.meta entered state: DONE zcooldev2,16020,1447812376145
2015-11-18 10:06:26,561 INFO  [main-EventThread] wal.WALSplitter: Archived processed log hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting/zcooldev2%2C16020%2C1447764266943..meta.1447764273380.meta to hdfs://172.16.4.175:9000/hbase/oldWALs/zcooldev2%2C16020%2C1447764266943..meta.1447764273380.meta
2015-11-18 10:06:26,562 INFO  [main-EventThread] coordination.SplitLogManagerCoordination: Done splitting /hbase/splitWAL/WALs%2Fzcooldev2%2C16020%2C1447764266943-splitting%2Fzcooldev2%252C16020%252C1447764266943..meta.1447764273380.meta
2015-11-18 10:06:26,571 WARN  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: returning success without actually splitting and deleting all the log files in path hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting
2015-11-18 10:06:26,571 INFO  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: finished splitting (more than or equal to) 83 bytes in 1 log files in [hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting] in 4309ms
2015-11-18 10:06:26,642 INFO  [zsj-zcool:16020.activeMasterManager] zookeeper.MetaTableLocator: Failed verification of hbase:meta,,1 at address=zcooldev2,16020,1447764266943, exception=org.apache.hadoop.hbase.NotServingRegionException: Region hbase:meta,,1 is not online on zcooldev2,16020,1447812376145
        at org.apache.hadoop.hbase.regionserver.HRegionServer.getRegionByEncodedName(HRegionServer.java:2740)
        at org.apache.hadoop.hbase.regionserver.RSRpcServices.getRegion(RSRpcServices.java:859)
        at org.apache.hadoop.hbase.regionserver.RSRpcServices.getRegionInfo(RSRpcServices.java:1137)
        at org.apache.hadoop.hbase.protobuf.generated.AdminProtos$AdminService$2.callBlockingMethod(AdminProtos.java:20862)
        at org.apache.hadoop.hbase.ipc.RpcServer.call(RpcServer.java:2031)
        at org.apache.hadoop.hbase.ipc.CallRunner.run(CallRunner.java:107)
        at org.apache.hadoop.hbase.ipc.RpcExecutor.consumerLoop(RpcExecutor.java:130)
        at org.apache.hadoop.hbase.ipc.RpcExecutor$1.run(RpcExecutor.java:107)
        at java.lang.Thread.run(Thread.java:745)

2015-11-18 10:06:26,644 INFO  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: dead splitlog workers [zcooldev2,16020,1447764266943]
2015-11-18 10:06:26,646 INFO  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting is empty dir, no logs to split
2015-11-18 10:06:26,647 INFO  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: started splitting 0 logs in [hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting] for [zcooldev2,16020,1447764266943]
2015-11-18 10:06:26,650 WARN  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: returning success without actually splitting and deleting all the log files in path hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting
2015-11-18 10:06:26,650 INFO  [zsj-zcool:16020.activeMasterManager] master.SplitLogManager: finished splitting (more than or equal to) 0 bytes in 0 log files in [hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting] in 3ms
2015-11-18 10:06:26,650 INFO  [zsj-zcool:16020.activeMasterManager] zookeeper.MetaTableLocator: Deleting hbase:meta region location in ZooKeeper
2015-11-18 10:06:26,704 INFO  [zsj-zcool:16020.activeMasterManager] master.AssignmentManager: Assigning hbase:meta,,1.1588230740 to JC.com.cn,16020,1447812377050
2015-11-18 10:06:26,704 INFO  [zsj-zcool:16020.activeMasterManager] master.RegionStates: Transition {1588230740 state=OFFLINE, ts=1447812386690, server=null} to {1588230740 state=PENDING_OPEN, ts=1447812386704, server=JC.com.cn,16020,1447812377050}
2015-11-18 10:06:26,761 INFO  [zsj-zcool:16020.activeMasterManager] master.ServerManager: AssignmentManager hasn't finished failover cleanup; waiting
2015-11-18 10:06:26,785 INFO  [AM.ZK.Worker-pool2-t1] master.RegionStates: Transition {1588230740 state=PENDING_OPEN, ts=1447812386704, server=JC.com.cn,16020,1447812377050} to {1588230740 state=OPENING, ts=1447812386785, server=JC.com.cn,16020,1447812377050}
2015-11-18 10:06:27,316 INFO  [AM.ZK.Worker-pool2-t2] master.RegionStates: Transition {1588230740 state=OPENING, ts=1447812386785, server=JC.com.cn,16020,1447812377050} to {1588230740 state=OPEN, ts=1447812387316, server=JC.com.cn,16020,1447812377050}
2015-11-18 10:06:27,347 INFO  [AM.ZK.Worker-pool2-t2] coordination.ZkOpenRegionCoordination: Handling OPENED of 1588230740 from zsj-zcool,16020,1447812375640; deleting unassigned node
2015-11-18 10:06:27,370 INFO  [AM.ZK.Worker-pool2-t3] master.RegionStates: Onlined 1588230740 on JC.com.cn,16020,1447812377050
2015-11-18 10:06:27,371 INFO  [zsj-zcool:16020.activeMasterManager] master.HMaster: hbase:meta assigned=1, rit=false, location=JC.com.cn,16020,1447812377050
2015-11-18 10:06:27,573 INFO  [zsj-zcool:16020.activeMasterManager] hbase.MetaMigrationConvertingToPB: hbase:meta doesn't have any entries to update.
2015-11-18 10:06:27,573 INFO  [zsj-zcool:16020.activeMasterManager] hbase.MetaMigrationConvertingToPB: META already up-to date with PB serialization
2015-11-18 10:06:27,588 INFO  [zsj-zcool:16020.activeMasterManager] master.AssignmentManager: Found regions out on cluster or in RIT; presuming failover
2015-11-18 10:06:27,595 INFO  [zsj-zcool:16020.activeMasterManager] master.AssignmentManager: Joined the cluster in 22ms, failover=true
2015-11-18 10:06:27,597 INFO  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-0] handler.ServerShutdownHandler: Splitting logs for zcooldev2,16020,1447764266943 before assignment; region count=0
2015-11-18 10:06:27,598 INFO  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-1] handler.ServerShutdownHandler: Splitting logs for JC.com.cn,16020,1447764266910 before assignment; region count=0
2015-11-18 10:06:27,602 INFO  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-0] master.SplitLogManager: dead splitlog workers [zcooldev2,16020,1447764266943]
2015-11-18 10:06:27,605 INFO  [zsj-zcool:16020.activeMasterManager] master.TableNamespaceManager: Namespace table not found. Creating...
2015-11-18 10:06:27,627 INFO  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-1] master.SplitLogManager: dead splitlog workers [JC.com.cn,16020,1447764266910]
2015-11-18 10:06:27,627 INFO  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-0] master.SplitLogManager: started splitting 1 logs in [hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting] for [zcooldev2,16020,1447764266943]
2015-11-18 10:06:27,629 INFO  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-1] master.SplitLogManager: started splitting 1 logs in [hdfs://172.16.4.175:9000/hbase/WALs/JC.com.cn,16020,1447764266910-splitting] for [JC.com.cn,16020,1447764266910]
2015-11-18 10:06:27,654 INFO  [main-EventThread] coordination.SplitLogManagerCoordination: task /hbase/splitWAL/WALs%2Fzcooldev2%2C16020%2C1447764266943-splitting%2Fzcooldev2%252C16020%252C1447764266943.default.1447764269124 acquired by JC.com.cn,16020,1447812377050
2015-11-18 10:06:27,679 INFO  [main-EventThread] coordination.SplitLogManagerCoordination: task /hbase/splitWAL/WALs%2FJC.com.cn%2C16020%2C1447764266910-splitting%2FJC.com.cn%252C16020%252C1447764266910.default.1447764269044 acquired by zcooldev2,16020,1447812376145
2015-11-18 10:06:27,703 FATAL [zsj-zcool:16020.activeMasterManager] master.HMaster: Failed to become active master
org.apache.hadoop.hbase.TableExistsException: hbase:namespace
        at org.apache.hadoop.hbase.master.handler.CreateTableHandler.checkAndSetEnablingTable(CreateTableHandler.java:151)
        at org.apache.hadoop.hbase.master.handler.CreateTableHandler.prepare(CreateTableHandler.java:124)
        at org.apache.hadoop.hbase.master.TableNamespaceManager.createNamespaceTable(TableNamespaceManager.java:233)
        at org.apache.hadoop.hbase.master.TableNamespaceManager.start(TableNamespaceManager.java:86)
        at org.apache.hadoop.hbase.master.HMaster.initNamespace(HMaster.java:868)
        at org.apache.hadoop.hbase.master.HMaster.finishActiveMasterInitialization(HMaster.java:719)
        at org.apache.hadoop.hbase.master.HMaster.access$500(HMaster.java:165)
        at org.apache.hadoop.hbase.master.HMaster$1.run(HMaster.java:1425)
        at java.lang.Thread.run(Thread.java:745)
2015-11-18 10:06:27,704 FATAL [zsj-zcool:16020.activeMasterManager] master.HMaster: Master server abort: loaded coprocessors are: []
2015-11-18 10:06:27,704 FATAL [zsj-zcool:16020.activeMasterManager] master.HMaster: Unhandled exception. Starting shutdown.
org.apache.hadoop.hbase.TableExistsException: hbase:namespace
        at org.apache.hadoop.hbase.master.handler.CreateTableHandler.checkAndSetEnablingTable(CreateTableHandler.java:151)
        at org.apache.hadoop.hbase.master.handler.CreateTableHandler.prepare(CreateTableHandler.java:124)
        at org.apache.hadoop.hbase.master.TableNamespaceManager.createNamespaceTable(TableNamespaceManager.java:233)
        at org.apache.hadoop.hbase.master.TableNamespaceManager.start(TableNamespaceManager.java:86)
        at org.apache.hadoop.hbase.master.HMaster.initNamespace(HMaster.java:868)
        at org.apache.hadoop.hbase.master.HMaster.finishActiveMasterInitialization(HMaster.java:719)
        at org.apache.hadoop.hbase.master.HMaster.access$500(HMaster.java:165)
        at org.apache.hadoop.hbase.master.HMaster$1.run(HMaster.java:1425)
        at java.lang.Thread.run(Thread.java:745)
2015-11-18 10:06:27,705 INFO  [zsj-zcool:16020.activeMasterManager] regionserver.HRegionServer: STOPPED: Unhandled exception. Starting shutdown.
2015-11-18 10:06:27,705 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: Stopping infoServer
2015-11-18 10:06:27,706 INFO  [master/zsj-zcool/172.16.4.175:16020] mortbay.log: Stopped SelectChannelConnector@0.0.0.0:16030
2015-11-18 10:06:27,706 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1447812375640
2015-11-18 10:06:27,708 INFO  [master/zsj-zcool/172.16.4.175:16020] client.ConnectionManager$HConnectionImplementation: Closing zookeeper sessionid=0x25118579e230001
2015-11-18 10:06:27,719 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.ZooKeeper: Session: 0x25118579e230001 closed
2015-11-18 10:06:27,719 INFO  [master/zsj-zcool/172.16.4.175:16020-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-18 10:06:27,736 WARN  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-0] master.SplitLogManager: Stopped while waiting for log splits to be completed
2015-11-18 10:06:27,736 WARN  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-0] master.SplitLogManager: error while splitting logs in [hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting] installed = 1 but only 0 done
2015-11-18 10:06:27,737 ERROR [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-0] executor.EventHandler: Caught throwable while processing event M_SERVER_SHUTDOWN
java.io.IOException: failed log splitting for zcooldev2,16020,1447764266943, will retry
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.resubmit(ServerShutdownHandler.java:345)
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.process(ServerShutdownHandler.java:219)
        at org.apache.hadoop.hbase.executor.EventHandler.run(EventHandler.java:128)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(Thread.java:745)
Caused by: java.io.IOException: error or interrupted while splitting logs in [hdfs://172.16.4.175:9000/hbase/WALs/zcooldev2,16020,1447764266943-splitting] Task = installed = 1 done = 0 error = 0
        at org.apache.hadoop.hbase.master.SplitLogManager.splitLogDistributed(SplitLogManager.java:288)
        at org.apache.hadoop.hbase.master.MasterFileSystem.splitLog(MasterFileSystem.java:390)
        at org.apache.hadoop.hbase.master.MasterFileSystem.splitLog(MasterFileSystem.java:363)
        at org.apache.hadoop.hbase.master.MasterFileSystem.splitLog(MasterFileSystem.java:285)
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.process(ServerShutdownHandler.java:212)
        ... 4 more
2015-11-18 10:06:27,737 ERROR [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-2] executor.EventHandler: Caught throwable while processing event M_SERVER_SHUTDOWN
java.io.IOException: Server is stopped
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.process(ServerShutdownHandler.java:193)
        at org.apache.hadoop.hbase.executor.EventHandler.run(EventHandler.java:128)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(Thread.java:745)
2015-11-18 10:06:27,745 WARN  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-1] master.SplitLogManager: Stopped while waiting for log splits to be completed
2015-11-18 10:06:27,745 WARN  [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-1] master.SplitLogManager: error while splitting logs in [hdfs://172.16.4.175:9000/hbase/WALs/JC.com.cn,16020,1447764266910-splitting] installed = 1 but only 0 done
2015-11-18 10:06:27,745 ERROR [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-1] executor.EventHandler: Caught throwable while processing event M_SERVER_SHUTDOWN
java.io.IOException: failed log splitting for JC.com.cn,16020,1447764266910, will retry
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.resubmit(ServerShutdownHandler.java:345)
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.process(ServerShutdownHandler.java:219)
        at org.apache.hadoop.hbase.executor.EventHandler.run(EventHandler.java:128)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(Thread.java:745)
Caused by: java.io.IOException: error or interrupted while splitting logs in [hdfs://172.16.4.175:9000/hbase/WALs/JC.com.cn,16020,1447764266910-splitting] Task = installed = 1 done = 0 error = 0
        at org.apache.hadoop.hbase.master.SplitLogManager.splitLogDistributed(SplitLogManager.java:288)
        at org.apache.hadoop.hbase.master.MasterFileSystem.splitLog(MasterFileSystem.java:390)
        at org.apache.hadoop.hbase.master.MasterFileSystem.splitLog(MasterFileSystem.java:363)
        at org.apache.hadoop.hbase.master.MasterFileSystem.splitLog(MasterFileSystem.java:285)
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.process(ServerShutdownHandler.java:212)
        ... 4 more
2015-11-18 10:06:27,745 ERROR [MASTER_SERVER_OPERATIONS-zsj-zcool:16020-3] executor.EventHandler: Caught throwable while processing event M_SERVER_SHUTDOWN
java.io.IOException: Server is stopped
        at org.apache.hadoop.hbase.master.handler.ServerShutdownHandler.process(ServerShutdownHandler.java:193)
        at org.apache.hadoop.hbase.executor.EventHandler.run(EventHandler.java:128)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(Thread.java:745)
2015-11-18 10:06:27,820 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1447812375640; all regions closed.
2015-11-18 10:06:27,820 INFO  [master/zsj-zcool/172.16.4.175:16020] master.HMaster: Stopping master jetty server
2015-11-18 10:06:27,820 INFO  [master/zsj-zcool/172.16.4.175:16020] mortbay.log: Stopped SelectChannelConnector@0.0.0.0:16010
2015-11-18 10:06:27,921 INFO  [zsj-zcool,16020,1447812375640-ClusterStatusChore] balancer.ClusterStatusChore: zsj-zcool,16020,1447812375640-ClusterStatusChore exiting
2015-11-18 10:06:27,921 INFO  [zsj-zcool,16020,1447812375640-BalancerChore] balancer.BalancerChore: zsj-zcool,16020,1447812375640-BalancerChore exiting
2015-11-18 10:06:27,921 INFO  [zsj-zcool:16020.archivedHFileCleaner] cleaner.HFileCleaner: zsj-zcool:16020.archivedHFileCleaner exiting
2015-11-18 10:06:27,921 INFO  [zsj-zcool:16020.oldLogCleaner] cleaner.LogCleaner: zsj-zcool:16020.oldLogCleaner exiting
2015-11-18 10:06:27,921 INFO  [CatalogJanitor-zsj-zcool:16020] master.CatalogJanitor: CatalogJanitor-zsj-zcool:16020 exiting
2015-11-18 10:06:27,921 INFO  [zsj-zcool:16020.oldLogCleaner] master.ReplicationLogCleaner: Stopping replicationLogCleaner-0x511857a0660001, quorum=172.16.4.7:2181,172.16.4.175:2181,172.16.0.7:2181, baseZNode=/hbase
2015-11-18 10:06:27,928 INFO  [zsj-zcool:16020.oldLogCleaner] zookeeper.ZooKeeper: Session: 0x511857a0660001 closed
2015-11-18 10:06:27,928 INFO  [zsj-zcool:16020.activeMasterManager-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-18 10:06:27,936 INFO  [master/zsj-zcool/172.16.4.175:16020] client.ConnectionManager$HConnectionImplementation: Closing zookeeper sessionid=0x511857a0660000
2015-11-18 10:06:27,945 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.ZooKeeper: Session: 0x511857a0660000 closed
2015-11-18 10:06:27,945 INFO  [zsj-zcool:16020.activeMasterManager-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-18 10:06:28,045 INFO  [master/zsj-zcool/172.16.4.175:16020] flush.MasterFlushTableProcedureManager: stop: server shutting down.
2015-11-18 10:06:28,045 INFO  [zsj-zcool,16020,1447812375640.splitLogManagerTimeoutMonitor] master.SplitLogManager$TimeoutMonitor: zsj-zcool,16020,1447812375640.splitLogManagerTimeoutMonitor exiting
2015-11-18 10:06:28,045 INFO  [master/zsj-zcool/172.16.4.175:16020] ipc.RpcServer: Stopping server on 16020
2015-11-18 10:06:28,046 INFO  [RpcServer.listener,port=16020] ipc.RpcServer: RpcServer.listener,port=16020: stopping
2015-11-18 10:06:28,046 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopped
2015-11-18 10:06:28,046 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopping
2015-11-18 10:06:28,061 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.RecoverableZooKeeper: Node /hbase/rs/zsj-zcool,16020,1447812375640 already deleted, retry=false
2015-11-18 10:06:28,070 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.ZooKeeper: Session: 0x25118579e230000 closed
2015-11-18 10:06:28,070 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1447812375640; zookeeper connection closed.
2015-11-18 10:06:28,070 INFO  [main-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-18 10:06:28,070 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: master/zsj-zcool/172.16.4.175:16020 exiting
2015-11-18 10:06:28,070 INFO  [Shutdown] mortbay.log: Shutdown hook executing
2015-11-18 10:06:28,070 INFO  [Shutdown] mortbay.log: Shutdown hook complete
```
