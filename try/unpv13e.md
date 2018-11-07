### chapter 1 简介
#### 1.5 一个简单的时间获取服务器程序
`socket, bind, listen` 这3个调用步骤是任何TCP服务器准备监听描述符(listening descriptor, 本例中为listendfd)的正常步骤.
同时能处理多个客户的并发服务器(concurrent server)有多种编写记录.最简单的技术是调用Unix的`fork`函数,为每个客户创建一个子进程.
其他技术包括使用线程代替`fork`,或在服务器启动时预先`fork`一定数量的子进程.

`bind, connect, sendto, sendmsg`
`accept, recvfrom, recvmsg, getpeername, getsockname`