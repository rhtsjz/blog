## sync.Pool
1. 简介
```
// A Pool is a set of temporary objects that may be individually saved and
// retrieved.
Pool 是一个临时对象的集合,这些临时对象可以被单独的存取
//
// Any item stored in the Pool may be removed automatically at any time without
// notification. If the Pool holds the only reference when this happens, the
// item might be deallocated.
Pool 中的任何对象都有可能在任何时候被自动的删除而没有通知.
此时如果 Pool 持有唯一的引用,对象可能会被释放.
//
// A Pool is safe for use by multiple goroutines simultaneously.
Pool 在多个 goroutines 同时使用时是安全的(Q1?:如何实现的)
//
// Pool's purpose is to cache allocated but unused items for later reuse,
// relieving pressure on the garbage collector. That is, it makes it easy to
// build efficient, thread-safe free lists. However, it is not suitable for all
// free lists.
Pool 的目的是缓存那些分配但未使用的对象以在稍后重用,以减轻垃圾收集器的压力.
也就是说,它使得构建高效,线程安全的 free list 变得容易.
然而他并不是对所有的 free list 都适用.
//
// An appropriate use of a Pool is to manage a group of temporary items
// silently shared among and potentially reused by concurrent independent
// clients of a package. Pool provides a way to amortize allocation overhead
// across many clients.
Pool 的一个合适的使用场景是 管理一组临时对象,这些对象静默共享并且被一个包中的独立的并发的客户端潜在的重用
Pool 提供了一种在许多客户端上分摊分配开销的方法.
//
// An example of good use of a Pool is in the fmt package, which maintains a
// dynamically-sized store of temporary output buffers. The store scales under
// load (when many goroutines are actively printing) and shrinks when
// quiescent.
Pool 使用的一个很好的例子在 fmt 包中,它为临时输出缓冲区维护了一个动态大小的存储.
这个存储在高负载是进行扩展(当很多 goroutines 在活跃的打印时)在静止时收缩.(Q2?:并没有进行收缩啊?GC)
//
// On the other hand, a free list maintained as part of a short-lived object is
// not a suitable use for a Pool, since the overhead does not amortize well in
// that scenario. It is more efficient to have such objects implement their own
// free list.
另一方面, 作为短期生存的对象的一部分维护的 free list 不适合使用 Pool, 因为在那样的场景下负载并没有被分摊.
使这些对象实现他们自己的 free list 会更加高效.
//
// A Pool must not be copied after first use.
Pool 第一次使用之后不能被拷贝
```
2. 例子 1-3个
```
1. fmt
https://github.com/golang/go/blob/release-branch.go1.9/src/fmt/scan.go#L385
//Note 定义 sync.Pool.New 函数返回一个新创建的 ss 结构体的指针
var ssFree = sync.Pool{
	New: func() interface{} { return new(ss) },
}
//Note newScanState 函数分配一个新的或者获取一个缓存的 ss 结构体
// newScanState allocates a new ss struct or grab a cached one.
func newScanState(r io.Reader, nlIsSpace, nlIsEnd bool) (s *ss, old ssave) {
	s = ssFree.Get().(*ss)
	if rs, ok := r.(io.RuneScanner); ok {
		s.rs = rs
	} else {
		s.rs = &readRune{reader: r, peekRune: -1}
	}
	s.nlIsSpace = nlIsSpace
	s.nlIsEnd = nlIsEnd
	s.atEOF = false
	s.limit = hugeWid
	s.argLimit = hugeWid
	s.maxWid = hugeWid
	s.validSave = true
	s.count = 0
	return
}
//Note free 函数保存一个已使用的 ss 结构体到 ssFree 中,以避免每次调用都分配
// free saves used ss structs in ssFree; avoid an allocation per invocation.
func (s *ss) free(old ssave) {
	// If it was used recursively, just restore the old state.
	if old.validSave {
		s.ssave = old
		return
	}
	// Don't hold on to ss structs with large buffers.
	if cap(s.buf) > 1024 {
		return
	}
	s.buf = s.buf[:0]
	s.rs = nil
	ssFree.Put(s)
}
2. json
https://github.com/golang/go/blob/release-branch.go1.9/src/encoding/json/encode.go#L273
var encodeStatePool sync.Pool
// Get
https://github.com/golang/go/blob/release-branch.go1.9/src/encoding/json/stream.go#L188
// Put
3. http server
https://github.com/golang/go/blob/release-branch.go1.9/src/net/http/server.go#L767
var (
	bufioReaderPool   sync.Pool
	bufioWriter2kPool sync.Pool
	bufioWriter4kPool sync.Pool
)

```
3. 实现
```
// Put adds x to the pool.
//Note Put函数将对象 x 放到 Pool 中
func (p *Pool) Put(x interface{}) {
	if x == nil {
		return
	}
	if race.Enabled {
		if fastrand()%4 == 0 {
			// Randomly drop x on floor.
			return
		}
		race.ReleaseMerge(poolRaceAddr(x))
		race.Disable()
	}
	//Note 固定当前 goroutine 到 P
	l := p.pin()
	// 优先放到l.private
	if l.private == nil {
		l.private = x
		x = nil
	}
	runtime_procUnpin()
	//Note 否则追加到 l.shared
	if x != nil {
		l.Lock()
		l.shared = append(l.shared, x)
		l.Unlock()
	}
	if race.Enabled {
		race.Enable()
	}
}

// Get selects an arbitrary item from the Pool, removes it from the
// Pool, and returns it to the caller.
// Get may choose to ignore the pool and treat it as empty.
// Callers should not assume any relation between values passed to Put and
// the values returned by Get.
//
// If Get would otherwise return nil and p.New is non-nil, Get returns
// the result of calling p.New.
//Note Get 从 pool 中取出一个任意的对象,然后删除它,并把它返回给调用者
func (p *Pool) Get() interface{} {
	if race.Enabled {
		race.Disable()
	}
	//Note 固定当前 goroutine 到 P
	l := p.pin()
	//Note 优先从 l.private 取
	x := l.private
	l.private = nil
	runtime_procUnpin()
	//Note 如果没取到,从l.shared[]获取最后一个元素
	if x == nil {
		l.Lock()
		last := len(l.shared) - 1
		if last >= 0 {
			x = l.shared[last]
			l.shared = l.shared[:last]
		}
		l.Unlock()
		//Note 如果没取到,从别的 P 偷一个
		if x == nil {
			x = p.getSlow()
		}
	}
	if race.Enabled {
		race.Enable()
		if x != nil {
			race.Acquire(poolRaceAddr(x))
		}
	}
	if x == nil && p.New != nil {
		x = p.New()
	}
	return x
}

```
4. 最佳实践
1. 个人理解: sync.Pool 的目的主要是通过缓存稍后使用的对象实现内存重用,以减少 GC 的压力
2. 内存重用相当与内存的主动管理而不是把使用的内存直接不做处理而丢给 GC.
3. 被缓存对象的特征:1.生命周期比较短,2.频繁的创建,3对象不是很大.

#### 参考资料
[http://www.infoq.com/cn/news/2015/07/ClojureWerkz](http://www.infoq.com/cn/news/2015/07/ClojureWerkz)
[https://songlee24.github.io/2015/04/08/free-list/](https://songlee24.github.io/2015/04/08/free-list/)