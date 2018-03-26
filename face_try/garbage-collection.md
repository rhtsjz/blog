###Q:对于Java的垃圾回收机制了解吗？
###A:了解一些
####是什么：
自动垃圾收集(Automatic Garbage Collection)是一个查看堆内存，识别哪些对象正在使用哪些不是，以及删除未使用的对象的过程。  
一个正在使用的对象或一个被引用的对象，意味着你的程序的某个部分仍然保持着一个指向该对象的指针。
一个未被使用的对象或未被医用的对象，不再被你的程序的任何部分所引用。
所以未被应用的对象所使用的内存可以被回收。
####怎么做：
- 第一步：标记(Marking)  
这一步垃圾收集器识别哪些内存正在使用和哪些不在使用。
![Marking](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/images/gcslides/Slide3.png)
- 第二步：正常删除(Normal Deletion)
正常删除将删除未引用的对象,留下引用的对象和指向可用空间的指针。
![Normal Deletion](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/images/gcslides/Slide1b.png)
- 第二步a：删除并压缩(Deletion with Compacting)
为了进一步提高性能，除了删除未引用的对象之外，还可以压缩剩余的引用对象。
通过将被引用的对象移动到一起，使得新的内存分配变得更加容易和快速。
![Deletion with Compacting](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/images/gcslides/Slide4.png)
- 为什么要分代垃圾收集？(Why Generational Garbage Collection?)
标记和压缩JVM中的所有对象效率不高;然而，对应用程序的经验分析表明，大多数对象都是短暂的。
![Why Generational Garbage Collection](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/images/ObjectLifetime.gif)
- JVM 分代(JVM Generations)
堆分成：新生代，老年代，以及永久代
![JVM Generations](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/images/gcslides/Slide5.png)
####怎么做2(分代垃圾回收过程)：
- 
