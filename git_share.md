# Git 从 0 到实战

# 痛
1、没网的时候不能提交,不能做版本控制

2、SVN服务器出问题的话历史记录就 over 了就只剩下最新的代码

3、分支不好弄

### 1、Git 基础以及它和其它版本控制系统（包括 Subversion 和近似工具）的对比
[1、直接记录快照，而非差异比较](http://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-Git-%E5%9F%BA%E7%A1%80#直接记录快照，而非差异比较)

[2、近乎所有操作都是本地执行](http://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-Git-%E5%9F%BA%E7%A1%80#近乎所有操作都是本地执行)

[3、 Git 有三种状态](http://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-Git-%E5%9F%BA%E7%A1%80#三种状态)

### 2、Git 基本操作
#### [获取 Git 仓库](http://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E8%8E%B7%E5%8F%96-Git-%E4%BB%93%E5%BA%93)
有两种取得 Git 项目仓库的方法。 第一种是在现有项目或目录下导入所有文件到 Git 中； 第二种是从一个服务器克隆一个现有的 Git 仓库。

```git
$ git init // 在现有目录中初始化仓库

$ git clone http://172.16.4.175:10080/zhangshijun/gitshow.git //克隆现有的仓库

$ git clone http://172.16.4.175:10080/zhangshijun/gitshow.git mygitshow //克隆现有的仓库并保存到指定文件夹
```
#### [记录每次更新到仓库](http://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E8%AE%B0%E5%BD%95%E6%AF%8F%E6%AC%A1%E6%9B%B4%E6%96%B0%E5%88%B0%E4%BB%93%E5%BA%93)
```git
$ git add a.txt //添加到已暂存
$ git status //查看当前状态
$ git commit -m 'commit description' //添加到已提交
$ git rm a.txt // 移除文件
$ git mv a.txt b.txt //移动文件
$ vim .gitignore // 忽略某些文件或文件夹
  *.class
```
#### [查看提交历史](http://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E6%9F%A5%E7%9C%8B%E6%8F%90%E4%BA%A4%E5%8E%86%E5%8F%B2)
```git
$ git log
```
#### [远程仓库的使用](http://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E8%BF%9C%E7%A8%8B%E4%BB%93%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8)
```git
$ git remote // 查看远程仓库简写
$ git remote -v // 查看远程仓库简写与其对应的 URL

$ git remote add gitshow http://172.16.4.175:10080/zhangshijun/gitshow.git // 添加远程仓库
$ git remote remove gitshow // 移除远程仓库
$ get remote rename gitshow mygitshow // 重命名远程仓库

$ git fetch [remote-name] // 从远程仓库中获取
$ git push origin master // 推送到远程仓库
```
### 3、标签和分支的使用
#### 标签
像其他版本控制系统（VCS）一样，Git可以给历史中的某一个提交打上标签，以示重要。比较有代表性的是人们会使用这个功能来标记发布结点（v1.0 等等）
```git
$ git tag //列出所有标签
$ git tag -l 'v0.1*' //列出特定的模式查找标签

// Git 使用两种主要类型的标签：轻量标签（lightweight）与附注标签（annotated）。
$ git tag -a v0.1 -m 'add tag v0.1' // 创建袋附注的标签
$ git tag v0.1-lw // 创建轻量标签

// 后期打标签
$ git log --pretty=oneline // 列出提交历史
93dbe1358812e0dd4e2a4b4f9ca4a044da1dc862 ignore b.txt
dea98519a453abad83f61f14b63d020bcc7ee81e added big man file
9881b9610d95caffedddb7c36a2bb783385865b4 还乱码吗？
109bacb200c7cb453a8b7d647bf1f6db5ad15b43 对 a 进行了重命名.
8c14520e5b346cbd1265de518b84ec84ecff9f06 将 eclipse 相关的文件忽略，不进行版本控制
c89263c5afc51814b4e17e7bea8377795552c1dc 修改了文件 a 的编码
079d309170063149b76da66fbcd01ea022234a01 add file a
2ec99f744de3ad0685572f65e95364cf821c20e0 add README

$ git tag -a v0.3 -m 'add a history tag' 079d3  //针对第二次提交打标签

//共享标签
$ git push origin v0.3 //共享特定标签
Username for 'http://172.16.4.175:10080': zhangshijun
Password for 'http://zhangshijun@172.16.4.175:10080': 
Counting objects: 1, done.
Writing objects: 100% (1/1), 165 bytes | 0 bytes/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To http://172.16.4.175:10080/zhangshijun/gitshow.git
 * [new tag]         v0.3 -> v0.3

$ git push --tags //共享所有标签
Username for 'http://172.16.4.175:10080': zhangshijun
Password for 'http://zhangshijun@172.16.4.175:10080': 
Everything up-to-date

// 检出标签到分支
$ git checkout -b version0.3 v0.3
Switched to a new branch 'version0.3'
```
#### 分支
[Git 的分支](http://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%AE%80%E4%BB%8B)，其实本质上仅仅是指向提交对象的可变指针。Git的默认分支名字是master。在多次提交操作之后，你其实已经有一个指向最后那个提交对象的 master 分支。 它会在每次的提交操作中自动向前移动。
```git
// 创建分支
$ git branch [branch name]

// 查看所有分支的指向情况 --decorate
$ git log --oneline --decorate
93dbe13 (HEAD, origin/master, origin/HEAD, version1, master) ignore b.txt
dea9851 added big man file
9881b96 还乱码吗？
109bacb 对 a 进行了重命名.
8c14520 将 eclipse 相关的文件忽略，不进行版本控制
c89263c 修改了文件 a 的编码
079d309 (tag: v0.3, version0.3) add file a
2ec99f7 (tag: v0.2) add README

//切换分支
$ git checkout version1
Switched to branch 'version1'

// 查看分叉历史
$ git log --oneline --decorate --graph --all
* 44890bc (HEAD, master) add d
| * cdea8be (version1) add c
|/  
* 93dbe13 (origin/master, origin/HEAD) ignore b.txt
| * 9ea5cf3 (tag: v0.1-lw, tag: v0.1) add c
|/  
* dea9851 added big man file
* 9881b96 还乱码吗？
* 109bacb 对 a 进行了重命名.
* 8c14520 将 eclipse 相关的文件忽略，不进行版本控制
* c89263c 修改了文件 a 的编码
* 079d309 (tag: v0.3, version0.3) add file a
* 2ec99f7 (tag: v0.2) add README

// 分支合并
// 首先切换到要合并到的分支, 然后合并；
$ git checkout master
Switched to branch 'master'
$ git merge version1
Merge made by the 'recursive' strategy.
 c.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 c.txt
// 合并分支遇到冲突
$ git merge version2
Auto-merging c.txt
CONFLICT (content): Merge conflict in c.txt
Automatic merge failed; fix conflicts and then commit the result.
// 查看冲突文件
$ git status
On branch master
Your branch is ahead of 'origin/master' by 4 commits.
  (use "git push" to publish your local commits)

You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)

	both modified:      c.txt

no changes added to commit (use "git add" and/or "git commit -a")

$ vim c.txt
<<<<<<< HEAD
bbbbcattttt
=======
caaaaattttt
>>>>>>> version2
//手动处理完冲突之后
$ git add c.txt
$ git commit

// 删除分支
$ git branch -d version1
Deleted branch version1 (was cdea8be).

// 查看每个分支最后一次提交
$ git branch -v
```

### 4、[分支开发工作流](http://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E6%B5%81)

[一个例子](http://nvie.com/posts/a-successful-git-branching-model/)
长期分支 master develop
特性分支 feature release

### 5、在 eclipse 中使用 Git
直接动手

### 6、[Gitlab](http://172.16.4.175:10080/)
直接动手

### 7、缺点：Git 与 Maven
解决方法： 合理划分项目(根据修改周期)
相关性比较强的只使用一个git repository

[参考链接1](http://programmers.stackexchange.com/questions/161293/choosing-between-single-or-multiple-projects-in-a-git-repository)
[参考链接2](http://programmers.stackexchange.com/questions/198721/best-way-to-structure-a-git-repository-for-maven)

### 8、 TODO Git 与 持续集成、自动化部署

### Books
[Pro Git](http://git-scm.com/book/zh/v2) 

[Subversion 权威指南](http://i18n-zh.googlecode.com/svn/www/svnbook-1.4/index.html)

