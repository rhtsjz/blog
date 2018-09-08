# 优先队列 PriorityQueue
优先队列的元素按照自然顺序来排序，也可以按照调用构造器时传入的 `Comparator` 来排序。
队列的头部是相对于指定顺序的最小元素。
队列检索操作 `poll, remove, peek, element` 均访问队列的头元素。
## 特性
- 顺序是不稳定的
如果最小元素具有有多个，那么头元素会是其中的任意一个。
- 通过迭代器遍历时不保证有序
方法 `iterator()` 中提供的迭代器不保证以任何特定顺序遍历优先级队列的元素。如果您需要有序遍历，请考虑使用 `Arrays.sort(pq.toArray())` 。
- 非线程安全的
此实现是未 `synchronized` 的。如果任何线程修改队列，多个线程不应该同时访问PriorityQueue实例。而是使用线程安全的 `PriorityBlockingQueue` 类。
- 时间复杂度相关
对于入队列和出队列的方法 `offer, poll, remove(), add` 为 `O(log(n))` ;对于 `remove(Object), contains(Object)` 为线性的即 `O(n)` ;
对于获取类的方法 `peek, element, and size` 为常数的即 `O(1)` 。
## 实现分析
- 成员变量
```java
    private static final int DEFAULT_INITIAL_CAPACITY = 11;

    /**
     * Priority queue represented as a balanced binary heap: the two
     * children of queue[n] are queue[2*n+1] and queue[2*(n+1)].  The
     * priority queue is ordered by comparator, or by the elements'
     * natural ordering, if comparator is null: For each node n in the
     * heap and each descendant d of n, n <= d.  The element with the
     * lowest value is in queue[0], assuming the queue is nonempty.
     */
    /**
    * 优先队列通过一个平衡二叉堆来表示： queue[n] 的两个孩子为 queue[2*n] 和 queue[2*n+1].
    * 优先队列通过 comparator 来排序, 如果 comparator 是 null 则通过元素的自然顺序: 对于堆中的每个节点n和它的后代d, n<=d.
    * 队列非空时, 具有最小值的元素位于 queue[0]
    */
    transient Object[] queue; // non-private to simplify nested class access

    /**
     * The number of elements in the priority queue.
     */
    /**
    * 优先队列中元素的数量
    */
    private int size = 0;

    /**
     * The comparator, or null if priority queue uses elements'
     * natural ordering.
     */
    /**
    * comparator,当优先队列使用元素的自然顺序时为 null
    */
    private final Comparator<? super E> comparator;

    /**
     * The number of times this priority queue has been
     * <i>structurally modified</i>.  See AbstractList for gory details.
     */
    
    transient int modCount = 0; // non-private to simplify nested class access
```