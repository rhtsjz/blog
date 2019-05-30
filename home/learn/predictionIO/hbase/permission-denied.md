Hbase指定HDFS时候权限问题
解决方法
```shell
hadoop fs -chmod 777 /hbase
```
参考  
[linux - Combining HBase and HDFS results in Exception in makeDirOnFileSystem - Stack Overflow](http://stackoverflow.com/questions/24116582/combining-hbase-and-hdfs-results-in-exception-in-makedironfilesystem)  
``` Java
2015-12-21 16:02:48,227 INFO  [master/zsj-zcool/172.16.4.175:16020] client.ZooKeeperRegistry: ClusterId read in ZooKeeper is null
2015-12-21 16:02:48,487 FATAL [zsj-zcool:16020.activeMasterManager] master.HMaster: Failed to become active master
org.apache.hadoop.security.AccessControlException: Permission denied: user=pio, access=WRITE, inode="/hbase/.tmp":hadoop:supergroup:drwxr-xr-x
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:319)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:292)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:216)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:190)
	at org.apache.hadoop.hdfs.server.namenode.FSDirectory.checkPermission(FSDirectory.java:1698)
	at org.apache.hadoop.hdfs.server.namenode.FSDirDeleteOp.delete(FSDirDeleteOp.java:88)
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.delete(FSNamesystem.java:3718)
	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.delete(NameNodeRpcServer.java:947)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.delete(ClientNamenodeProtocolServerSideTranslatorPB.java:611)
	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:616)
	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:969)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2049)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2045)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2043)

	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:408)
	at org.apache.hadoop.ipc.RemoteException.instantiateException(RemoteException.java:106)
	at org.apache.hadoop.ipc.RemoteException.unwrapRemoteException(RemoteException.java:73)
	at org.apache.hadoop.hdfs.DFSClient.delete(DFSClient.java:1728)
	at org.apache.hadoop.hdfs.DistributedFileSystem$11.doCall(DistributedFileSystem.java:588)
	at org.apache.hadoop.hdfs.DistributedFileSystem$11.doCall(DistributedFileSystem.java:584)
	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
	at org.apache.hadoop.hdfs.DistributedFileSystem.delete(DistributedFileSystem.java:584)
	at org.apache.hadoop.hbase.master.MasterFileSystem.checkTempDir(MasterFileSystem.java:492)
	at org.apache.hadoop.hbase.master.MasterFileSystem.createInitialFileSystemLayout(MasterFileSystem.java:148)
	at org.apache.hadoop.hbase.master.MasterFileSystem.<init>(MasterFileSystem.java:125)
	at org.apache.hadoop.hbase.master.HMaster.finishActiveMasterInitialization(HMaster.java:591)
	at org.apache.hadoop.hbase.master.HMaster.access$500(HMaster.java:165)
	at org.apache.hadoop.hbase.master.HMaster$1.run(HMaster.java:1425)
	at java.lang.Thread.run(Thread.java:745)
Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.security.AccessControlException): Permission denied: user=pio, access=WRITE, inode="/hbase/.tmp":hadoop:supergroup:drwxr-xr-x
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:319)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:292)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:216)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:190)
	at org.apache.hadoop.hdfs.server.namenode.FSDirectory.checkPermission(FSDirectory.java:1698)
	at org.apache.hadoop.hdfs.server.namenode.FSDirDeleteOp.delete(FSDirDeleteOp.java:88)
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.delete(FSNamesystem.java:3718)
	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.delete(NameNodeRpcServer.java:947)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.delete(ClientNamenodeProtocolServerSideTranslatorPB.java:611)
	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:616)
	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:969)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2049)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2045)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2043)

	at org.apache.hadoop.ipc.Client.call(Client.java:1411)
	at org.apache.hadoop.ipc.Client.call(Client.java:1364)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:206)
	at com.sun.proxy.$Proxy16.delete(Unknown Source)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
	at com.sun.proxy.$Proxy16.delete(Unknown Source)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.delete(ClientNamenodeProtocolTranslatorPB.java:490)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.hbase.fs.HFileSystem$1.invoke(HFileSystem.java:279)
	at com.sun.proxy.$Proxy17.delete(Unknown Source)
	at org.apache.hadoop.hdfs.DFSClient.delete(DFSClient.java:1726)
	... 11 more
2015-12-21 16:02:48,488 FATAL [zsj-zcool:16020.activeMasterManager] master.HMaster: Unhandled exception. Starting shutdown.
org.apache.hadoop.security.AccessControlException: Permission denied: user=pio, access=WRITE, inode="/hbase/.tmp":hadoop:supergroup:drwxr-xr-x
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:319)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:292)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:216)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:190)
	at org.apache.hadoop.hdfs.server.namenode.FSDirectory.checkPermission(FSDirectory.java:1698)
	at org.apache.hadoop.hdfs.server.namenode.FSDirDeleteOp.delete(FSDirDeleteOp.java:88)
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.delete(FSNamesystem.java:3718)
	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.delete(NameNodeRpcServer.java:947)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.delete(ClientNamenodeProtocolServerSideTranslatorPB.java:611)
	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:616)
	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:969)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2049)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2045)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2043)

	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:408)
	at org.apache.hadoop.ipc.RemoteException.instantiateException(RemoteException.java:106)
	at org.apache.hadoop.ipc.RemoteException.unwrapRemoteException(RemoteException.java:73)
	at org.apache.hadoop.hdfs.DFSClient.delete(DFSClient.java:1728)
	at org.apache.hadoop.hdfs.DistributedFileSystem$11.doCall(DistributedFileSystem.java:588)
	at org.apache.hadoop.hdfs.DistributedFileSystem$11.doCall(DistributedFileSystem.java:584)
	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81)
	at org.apache.hadoop.hdfs.DistributedFileSystem.delete(DistributedFileSystem.java:584)
	at org.apache.hadoop.hbase.master.MasterFileSystem.checkTempDir(MasterFileSystem.java:492)
	at org.apache.hadoop.hbase.master.MasterFileSystem.createInitialFileSystemLayout(MasterFileSystem.java:148)
	at org.apache.hadoop.hbase.master.MasterFileSystem.<init>(MasterFileSystem.java:125)
	at org.apache.hadoop.hbase.master.HMaster.finishActiveMasterInitialization(HMaster.java:591)
	at org.apache.hadoop.hbase.master.HMaster.access$500(HMaster.java:165)
	at org.apache.hadoop.hbase.master.HMaster$1.run(HMaster.java:1425)
	at java.lang.Thread.run(Thread.java:745)
Caused by: org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.security.AccessControlException): Permission denied: user=pio, access=WRITE, inode="/hbase/.tmp":hadoop:supergroup:drwxr-xr-x
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:319)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.check(FSPermissionChecker.java:292)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:216)
	at org.apache.hadoop.hdfs.server.namenode.FSPermissionChecker.checkPermission(FSPermissionChecker.java:190)
	at org.apache.hadoop.hdfs.server.namenode.FSDirectory.checkPermission(FSDirectory.java:1698)
	at org.apache.hadoop.hdfs.server.namenode.FSDirDeleteOp.delete(FSDirDeleteOp.java:88)
	at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.delete(FSNamesystem.java:3718)
	at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.delete(NameNodeRpcServer.java:947)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.delete(ClientNamenodeProtocolServerSideTranslatorPB.java:611)
	at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:616)
	at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:969)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2049)
	at org.apache.hadoop.ipc.Server$Handler$1.run(Server.java:2045)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1657)
	at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2043)

	at org.apache.hadoop.ipc.Client.call(Client.java:1411)
	at org.apache.hadoop.ipc.Client.call(Client.java:1364)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:206)
	at com.sun.proxy.$Proxy16.delete(Unknown Source)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:187)
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:102)
	at com.sun.proxy.$Proxy16.delete(Unknown Source)
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.delete(ClientNamenodeProtocolTranslatorPB.java:490)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:483)
	at org.apache.hadoop.hbase.fs.HFileSystem$1.invoke(HFileSystem.java:279)
	at com.sun.proxy.$Proxy17.delete(Unknown Source)
	at org.apache.hadoop.hdfs.DFSClient.delete(DFSClient.java:1726)
	... 11 more
2015-12-21 16:02:48,489 INFO  [zsj-zcool:16020.activeMasterManager] regionserver.HRegionServer: STOPPED: Unhandled exception. Starting shutdown.
2015-12-21 16:02:51,245 INFO  [master/zsj-zcool/172.16.4.175:16020] ipc.RpcServer: Stopping server on 16020
2015-12-21 16:02:51,245 INFO  [RpcServer.listener,port=16020] ipc.RpcServer: RpcServer.listener,port=16020: stopping
2015-12-21 16:02:51,247 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopped
2015-12-21 16:02:51,247 INFO  [RpcServer.responder] ipc.RpcServer: RpcServer.responder: stopping
2015-12-21 16:02:51,247 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: Stopping infoServer
2015-12-21 16:02:51,265 INFO  [master/zsj-zcool/172.16.4.175:16020] mortbay.log: Stopped SelectChannelConnector@0.0.0.0:16030
2015-12-21 16:02:51,366 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1450684963251
2015-12-21 16:02:51,366 INFO  [master/zsj-zcool/172.16.4.175:16020] client.ConnectionManager$HConnectionImplementation: Closing zookeeper sessionid=0x151c38fe5250001
2015-12-21 16:02:51,387 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.ZooKeeper: Session: 0x151c38fe5250001 closed
2015-12-21 16:02:51,387 INFO  [master/zsj-zcool/172.16.4.175:16020-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-12-21 16:02:51,387 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1450684963251; all regions closed.
2015-12-21 16:02:51,387 INFO  [master/zsj-zcool/172.16.4.175:16020] master.HMaster: Stopping master jetty server
2015-12-21 16:02:51,387 INFO  [master/zsj-zcool/172.16.4.175:16020] mortbay.log: Stopped SelectChannelConnector@0.0.0.0:16010
2015-12-21 16:02:51,507 INFO  [master/zsj-zcool/172.16.4.175:16020] ipc.RpcServer: Stopping server on 16020
2015-12-21 16:02:51,520 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.RecoverableZooKeeper: Node /hbase/rs/zsj-zcool,16020,1450684963251 already deleted, retry=false
2015-12-21 16:02:51,532 INFO  [master/zsj-zcool/172.16.4.175:16020] zookeeper.ZooKeeper: Session: 0x151c38fe5250000 closed
2015-12-21 16:02:51,532 INFO  [main-EventThread] zookeeper.ClientCnxn: EventThread shut down
2015-12-21 16:02:51,532 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: stopping server zsj-zcool,16020,1450684963251; zookeeper connection closed.
2015-12-21 16:02:51,533 INFO  [master/zsj-zcool/172.16.4.175:16020] regionserver.HRegionServer: master/zsj-zcool/172.16.4.175:16020 exiting
2015-12-21 16:02:51,537 INFO  [Shutdown] mortbay.log: Shutdown hook executing
2015-12-21 16:02:51,537 INFO  [Shutdown] mortbay.log: Shutdown hook complete
```
