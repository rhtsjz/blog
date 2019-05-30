
### 临时存储密码到缓存  
``` git
$ git config credential.helper cache
$ git push http://example.com/repo.git
Username: <type your username>
Password: <type your password>

[work for 5 more minutes]
$ git push http://example.com/repo.git
[your credentials are used automatically]
```
参考  
[git-credential-cache](https://git-scm.com/docs/git-credential-cache)

### commit 之后自动 push 
可以通过 Git 提供的 hooks 来实现  
创建 ```.git/hooks/post-commit```文件并设置它具有执行的权限 文件内容如下
``` shell
#!/bin/sh
git push origin master
```
参考  
[githooks - How to automatically push after committing in git? - Stack Overflow](http://stackoverflow.com/questions/7925850/how-to-automatically-push-after-committing-in-git)  

### 合并多个 commit 为一个
这在 Git 中被称作 ```"squashing"``` 可以实用 ```git rebase```命令来实现  
  1.  如果你想要将所有没有 push 到远程仓库的 commits 合并成一个 commit ,直接使用下面的命令
      ```git
      git rebase -i origin/master
      ```
      此时会调起一个编辑器(-i 或者 --interactive)
      ```git
      pick 6abeb97 git rebase test 1
      pick 1d3ea3b git rebase test 2
      
      ```
      编辑器中展示了所有未 push 到远程仓库的 commit ,其中最上面的是最早的 commit  
      这个时候需要将除了第一个之外的 commit 的 ``pick``都改成 ```s 或者 squash```
      ```git
      pick 6abeb97 git rebase test 1
      s 1d3ea3b git rebase test 2
      
      ```
      保存, 然后会调起另一个编辑器让你填写提交信息。
  2. 如果你想要合并已经 push 到远程仓库的 commits (PS: 不建议修改已经 push 的 commits), 可以使用以下参数  
      ```git
      git rebase -i HEAD~4
      
      ```
      同样的会调起一个编辑器,编辑器中展示了最近的 commits (本例中是4次), 
      将除了第一个之外的 commit 的 ``pick``都改成 ```s 或者 squash```保存,并在调出的编辑器中填写提交信息
      然后强制push到远程仓库 
      ```git
      git push origin master --force
      
      ```

参考  
[git squash - Combining multiple commits before pushing in Git - Stack Overflow](http://stackoverflow.com/questions/6934752/combining-multiple-commits-before-pushing-in-git)  
[Submit as one commit](http://push.cwcon.org/learn/squashing-commits.html)
  
### 取消最近的commit  
可以使用 ``` git reset ``` 命令,具体可以参照以下步骤
```
$ git commit -m "Something terribly misguided"              (1)
$ git reset --soft HEAD~                                    (2)
<< edit files as necessary >>                               (3)
$ git add ...                                               (4)
$ git commit -c ORIG_HEAD                                   (5)
```
参考  
[git - How do you undo the last commit? - Stack Overflow](http://stackoverflow.com/questions/927358/how-do-you-undo-the-last-commit/927386#927386)
