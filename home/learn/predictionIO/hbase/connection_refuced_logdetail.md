Connection refuced Log detail

``` Java
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:java.library.path=/opt/recommender/PredictionIO-0.9.5/vendors/hadoop-2.7.1/lib/native
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:java.io.tmpdir=/tmp
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:java.compiler=<NA>
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:os.name=Linux
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:os.arch=amd64
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:os.version=3.16.0-43-generic
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:user.name=root
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:user.home=/root
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Client environment:user.dir=/opt/recommender/PredictionIO-0.9.5/vendors/hbase-1.0.0
2015-11-16 19:41:44,771 INFO  [main] zookeeper.ZooKeeper: Initiating client connection, connectString=localhost:2181 sessionTimeout=90000 watcher=master:160200x0, quorum=localhost:2181, baseZNode=/hbase
2015-11-16 19:41:44,793 INFO  [main-SendThread(localhost:2181)] zookeeper.ClientCnxn: Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
2015-11-16 19:41:44,795 INFO  [main-SendThread(localhost:2181)] zookeeper.ClientCnxn: Socket connection established to localhost/127.0.0.1:2181, initiating session
2015-11-16 19:41:44,831 INFO  [main-SendThread(localhost:2181)] zookeeper.ClientCnxn: Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1511019c1d30000, negotiated timeout = 90000
2015-11-16 19:41:44,894 INFO  [RpcServer.listener,port=16020] ipc.RpcServer: RpcServer.listener,port=16020: starting
2015-11-16 19:41:44,895 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: starting
2015-11-16 19:41:45,025 INFO  [main] mortbay.log: Logging to org.slf4j.impl.Log4jLoggerAdapter(org.mortbay.log) via org.mortbay.log.Slf4jLog
2015-11-16 19:41:45,029 INFO  [main] http.HttpRequestLog: Http request log for http.requests.master is not defined
2015-11-16 19:41:45,037 INFO  [main] http.HttpServer: Added global filter 'safety' (class=org.apache.hadoop.hbase.http.HttpServer$QuotingInputFilter)
2015-11-16 19:41:45,040 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context master
2015-11-16 19:41:45,040 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context static
2015-11-16 19:41:45,040 INFO  [main] http.HttpServer: Added filter static_user_filter (class=org.apache.hadoop.hbase.http.lib.StaticUserWebFilter$StaticUserFilter) to context logs
2015-11-16 19:41:45,053 INFO  [main] http.HttpServer: Jetty bound to port 16030
2015-11-16 19:41:45,053 INFO  [main] mortbay.log: jetty-6.1.26
2015-11-16 19:41:45,479 INFO  [main] mortbay.log: Started SelectChannelConnector@0.0.0.0:16030
2015-11-16 19:41:45,480 INFO  [main] master.HMaster: hbase.rootdir=hdfs://127.0.0.1:8020/hbase, hbase.cluster.distributed=true
2015-11-16 19:41:45,495 INFO  [main] mortbay.log: jetty-6.1.26
2015-11-16 19:41:45,502 INFO  [main] mortbay.log: Started SelectChannelConnector@0.0.0.0:16010
2015-11-16 19:41:45,502 INFO  [main] master.HMaster: Adding backup master ZNode /hbase/backup-masters/zsj-zcool,16020,1447674103909
2015-11-16 19:41:45,637 INFO  [zsj-zcool:16020.activeMasterManager] master.ActiveMasterManager: Deleting ZNode for /hbase/backup-masters/zsj-zcool,16020,1447674103909 from backup master directory
2015-11-16 19:41:45,662 INFO  [zsj-zcool:16020.activeMasterManager] master.ActiveMasterManager: Registered Active Master=zsj-zcool,16020,1447674103909
2015-11-16 19:41:45,763 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] zookeeper.RecoverableZooKeeper: Process identifier=hconnection-0x697a1571 connecting to ZooKeeper ensemble=localhost:2181
2015-11-16 19:41:45,763 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] zookeeper.ZooKeeper: Initiating client connection, connectString=localhost:2181 sessionTimeout=90000 watcher=hconnection-0x697a15710x0, quorum=localhost:2181, baseZNode=/hbase
2015-11-16 19:41:45,769 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020-SendThread(localhost:2181)] zookeeper.ClientCnxn: Opening socket connection to server localhost/127.0.0.1:2181. Will not attempt to authenticate using SASL (unknown error)
2015-11-16 19:41:45,769 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020-SendThread(localhost:2181)] zookeeper.ClientCnxn: Socket connection established to localhost/127.0.0.1:2181, initiating session
2015-11-16 19:41:45,783 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020-SendThread(localhost:2181)] zookeeper.ClientCnxn: Session establishment complete on server localhost/127.0.0.1:2181, sessionid = 0x1511019c1d30001, negotiated timeout = 90000
2015-11-16 19:41:45,798 FATAL [zsj-zcool:16020.activeMasterManager] master.HMaster: Failed to become active master
java.net.ConnectException: Call From zsj-zcool/0:0:0:0:0:0:0:1 to localhost:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:408)
	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:783)
	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:730)
	at org.apache.hadoop.ipc.Client.call(Client.java:1415)
	at org.apache.hadoop.ipc.Client.call(Client.java:1364)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:206)
	at com.sun.proxy.$Proxy16.setSafeMode(Unknown Source)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
	at com.sun.proxy.$Proxy16.setSafeMode(Unknown Source)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.setSafeMode(ClientNamenodeProtocolTranslatorPB.java:602)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.hbase.fs.HFileSystem$1.invoke(HFileSystem.java:279)
	at com.sun.proxy.$Proxy17.setSafeMode(Unknown Source)
	at org.apache.hadoop.hdfs.DFSClient.setSafeMode(DFSClient.java:2264)
	at org.apache.hadoop.hdfs.DistributedFileSystem.setSafeMode(DistributedFileSystem.java:986)
	at org.apache.hadoop.hdfs.DistributedFileSystem.setSafeMode(DistributedFileSystem.java:970)
	at org.apache.hadoop.hbase.util.FSUtils.isInSafeMode(FSUtils.java:447)
	at org.apache.hadoop.hbase.util.FSUtils.waitOnSafeMode(FSUtils.java:894)
	at org.apache.hadoop.hbase.master.MasterFileSystem.checkRootDir(MasterFileSystem.java:416)
	at org.apache.hadoop.hbase.master.MasterFileSystem.createInitialFileSystemLayout(MasterFileSystem.java:145)
	at org.apache.hadoop.hbase.master.MasterFileSystem.<init>(MasterFileSystem.java:125)
	at org.apache.hadoop.hbase.master.HMaster.finishActiveMasterInitialization(HMaster.java:591)
	at org.apache.hadoop.hbase.master.HMaster.access$500(HMaster.java:165)
	at org.apache.hadoop.hbase.master.HMaster$1.run(HMaster.java:1425)
	at java.lang.Thread.run(Thread.java:745)
Caused by: java.net.ConnectException: Connection refused
	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:712)
	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:529)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:493)
	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:606)
	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:700)
	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:367)
	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1463)
	at org.apache.hadoop.ipc.Client.call(Client.java:1382)
	... 29 more
2015-11-16 19:41:45,799 FATAL [zsj-zcool:16020.activeMasterManager] master.HMaster: Unhandled exception. Starting shutdown.
java.net.ConnectException: Call From zsj-zcool/0:0:0:0:0:0:0:1 to localhost:8020 failed on connection exception: java.net.ConnectException: Connection refused; For more details see:  http://wiki.apache.org/hadoop/ConnectionRefused
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:408)
	at org.apache.hadoop.net.NetUtils.wrapWithMessage(NetUtils.java:783)
	at org.apache.hadoop.net.NetUtils.wrapException(NetUtils.java:730)
	at org.apache.hadoop.ipc.Client.call(Client.java:1415)
	at org.apache.hadoop.ipc.Client.call(Client.java:1364)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:206)
	at com.sun.proxy.$Proxy16.setSafeMode(Unknown Source)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
	at com.sun.proxy.$Proxy16.setSafeMode(Unknown Source)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.setSafeMode(ClientNamenodeProtocolTranslatorPB.java:602)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.hbase.fs.HFileSystem$1.invoke(HFileSystem.java:279)
	at com.sun.proxy.$Proxy17.setSafeMode(Unknown Source)
	at org.apache.hadoop.hdfs.DFSClient.setSafeMode(DFSClient.java:2264)
	at org.apache.hadoop.hdfs.DistributedFileSystem.setSafeMode(DistributedFileSystem.java:986)
	at org.apache.hadoop.hdfs.DistributedFileSystem.setSafeMode(DistributedFileSystem.java:970)
	at org.apache.hadoop.hbase.util.FSUtils.isInSafeMode(FSUtils.java:447)
	at org.apache.hadoop.hbase.util.FSUtils.waitOnSafeMode(FSUtils.java:894)
	at org.apache.hadoop.hbase.master.MasterFileSystem.checkRootDir(MasterFileSystem.java:416)
	at org.apache.hadoop.hbase.master.MasterFileSystem.createInitialFileSystemLayout(MasterFileSystem.java:145)
	at org.apache.hadoop.hbase.master.MasterFileSystem.<init>(MasterFileSystem.java:125)
	at org.apache.hadoop.hbase.master.HMaster.finishActiveMasterInitialization(HMaster.java:591)
	at org.apache.hadoop.hbase.master.HMaster.access$500(HMaster.java:165)
	at org.apache.hadoop.hbase.master.HMaster$1.run(HMaster.java:1425)
	at java.lang.Thread.run(Thread.java:745)
Caused by: java.net.ConnectException: Connection refused
	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:712)
	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:529)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:493)
	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:606)
	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:700)
	at org.apache.hadoop.ipc.Client$Connection.access$2800(Client.java:367)
	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1463)
	at org.apache.hadoop.ipc.Client.call(Client.java:1382)
	... 29 more
2015-11-16 19:41:45,800 INFO  [zsj-zcool:16020.activeMasterManager] regionserver.HRegionServer: STOPPED: Unhandled exception. Starting shutdown.
2015-11-16 19:41:48,832 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] ipc.RpcServer: Stopping server on 16020
2015-11-16 19:41:48,832 INFO  [RpcServer.listener,port=16020] ipc.RpcServer: RpcServer.listener,port=16020: stopping
2015-11-16 19:41:48,833 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: Stopping infoServer
2015-11-16 19:41:48,836 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopped
2015-11-16 19:41:48,836 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopping
2015-11-16 19:41:48,838 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] mortbay.log: Stopped SelectChannelConnector@0.0.0.0:16030
2015-11-16 19:41:48,938 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1447674103909
2015-11-16 19:41:48,938 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] client.ConnectionManager$HConnectionImplementation: Closing zookeeper sessionid=0x1511019c1d30001
2015-11-16 19:41:48,969 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] zookeeper.ZooKeeper: Session: 0x1511019c1d30001 closed
2015-11-16 19:41:48,969 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-16 19:41:48,970 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1447674103909; all regions closed.
2015-11-16 19:41:48,970 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] master.HMaster: Stopping master jetty server
2015-11-16 19:41:48,970 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] mortbay.log: Stopped SelectChannelConnector@0.0.0.0:16010
2015-11-16 19:41:49,082 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] ipc.RpcServer: Stopping server on 16020
2015-11-16 19:41:49,095 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] zookeeper.RecoverableZooKeeper: Node /hbase/rs/zsj-zcool,16020,1447674103909 already deleted, retry=false
2015-11-16 19:41:49,107 INFO  [main-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-11-16 19:41:49,107 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] zookeeper.ZooKeeper: Session: 0x1511019c1d30000 closed
2015-11-16 19:41:49,108 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1447674103909; zookeeper connection closed.
2015-11-16 19:41:49,108 INFO  [master/zsj-zcool/0:0:0:0:0:0:0:1:16020] regionserver.HRegionServer: master/zsj-zcool/0:0:0:0:0:0:0:1:16020 exiting
2015-11-16 19:41:49,108 INFO  [Shutdown] mortbay.log: Shutdown hook executing
2015-11-16 19:41:49,108 INFO  [Shutdown] mortbay.log: Shutdown hook complete
```
