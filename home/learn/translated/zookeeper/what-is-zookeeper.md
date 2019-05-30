[Apache ZooKeeper](https://zookeeper.apache.org/)

## 什么是 ZooKeeper ？
ZooKeeper 是一个集中式服务，它用于维护配置信息，命名，提供分布式同步，并提供分组服务。
所有这些种类的服务在分布式应用中以某种形式或其它形式使用。每次它们被实现都不可避免的会在修复 bug 和竞争条件上投入很多的工作。
因为实现这些服务的困难，应用在最初通常会对此敷衍了事，这使得它们在变化中变得脆弱和难以管理。
就算实现比较合理，这些服务的不同实现会导致管理复杂当应用部署时。

了解更多关于 ZooKeeper 在 [**ZooKeeper Wiki**](https://cwiki.apache.org/confluence/display/ZOOKEEPER/Index)


## ZooKeeper ：分布式应用的一个分布式协调服务
ZooKeeper 是一个分布式，开源协调服务对于分布式应用。它提供了一套简单的原语，
分布式应用可以在这套原语基础上实现更高级别的服务为同步，配置维护，以及组和命名。
它被设计为易于编程，并且使用了一种类似人们熟悉的文件系统的目录树结构的数据模型。
它运行在 Java 中并且具有 Java 和 C 的绑定。

### 设计目标
**简单**。ZooKeeper 允许分布式进程通过一个组织得类似一个标准的文件系统的共享的层级命名空间进行相互协调。
命名空间包含数据寄存器（在 ZooKeeper 中称作 znodes），这跟文件和目录很相似。
和典型的被设计用于存储的文件系统不同的是ZooKeeper的数据保存在内存中，这意味着ZooKeeper可以实现高吞吐量和低延迟。 

ZooKeeper的实现优先考虑了高性能，高可用性，严格的有序访问。
Zookeeper性能方面意味着它可以被用于大型分布式系统中。可靠性方面意味着它可以避免单点故障。
严格的顺序意味着复杂的同步原语可以在客户端实现。

**复制的**。就像它协调的分布式进程一样，ZooKeeper本身也在一个被称作合奏的机器集合上进行了复制。

ZooKeeper服务

![](https://camo.githubusercontent.com/13b3cd9bd78ea470ff8fa46711bcee6762f07ae7/68747470733a2f2f7a6f6f6b65657065722e6170616368652e6f72672f646f632f7472756e6b2f696d616765732f7a6b736572766963652e6a7067)  
图片来源 [https://zookeeper.apache.org/doc/trunk/images/zkservice.jpg](https://zookeeper.apache.org/doc/trunk/images/zkservice.jpg)

组成 ZooKeeper 服务的服务器必须知道对方。他们维护一个内存映像，同时持久存储一个事务日志和快照。
只要大多数的 ZooKeeper 服务是可用的， ZooKeeper 的服务将是可用的。

客户端连接一个单独的 ZooKeeper 服务器。
客户端维护一个 TCP 连接，通过这个连接发送请求，获取响应，获取 <code>watch</code> 事件,发送心跳。
如果到服务器的 TCP 连接断开，客户端会连接到不同的服务器。

**有序**。ZooKeeper 为每个更新附带一个数字，这个数字反映了所用的ZooKeeper事务的顺序。
随后的操作可以使用顺序来实现更高级别的抽象，比如同步原语。

**快**。 它在 <code>read-dominat</code>的工作负载特别的快。
ZooKeeper 应用程序运行在上前台机器上，而且它在读比写更常见在大约10:1的比例时的情景下表现的最好。

