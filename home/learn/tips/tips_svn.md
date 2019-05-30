## [分支合并](http://www.cnblogs.com/huang0925/p/3254243.html)
```
svn merge svn://repository-url -r123:HEAD
```

[svn代码回滚命令](http://www.cnblogs.com/jndream/archive/2012/03/20/2407955.html)

## 切换分支
```
svn relocate TO-URL [PATH]
或者
svn switch --relocate FROM TO [PATH...]
```

## 更新忽略、取消忽略文件夹
```
svn update --set-depth exclude folderName
svn update --set-depth folderName
```
