# 索引
* [初始配置](#user-content-初始配置-顶部)
* [日志](#user-content-日志-顶部)
* [撤销](#user-content-撤销-顶部)
* [分支](#user-content-分支-顶部)
* [远程](#user-content-远程-顶部)
* [储存现场](#user-content-储存现场-顶部)
* [标签](#user-content-标签-顶部)

*************************************************************************

### 初始配置 [`顶部`](#user-content-索引)
* name会在`git log`中显示
```sh
git config --global user.name NAME
git config --global user.email ENAIL ADDRESS
```

<br>

* 查看配置
```sh
git config --list
```


### 日志 [`顶部`](#user-content-索引)
* **`git log`** 查看最近三次的提交
* **`git log --pretty=oneline`** 一行简要查看最近三次的提交
* **`git log --graph --pretty=oneline --abbrev-commit`** 看到分支合并图
* **`git reflog`** 查看历史命令

### 撤销 [`顶部`](#user-content-索引)
* **`git reset --hard HEAD^^`** 回退到上一个版本
* **`git reset --hard <version>`** 回退到指定版本

<br>

* **Unmodified -> Untracked: `git rm <file>`** 删除一个文件
* **Modified -> Unmodified: `git checkout -- <file>`** 撤销提交到暂存区的修改
* **Staged -> Modified: `git reset HEAD <file>`** 可以把提交到暂存区的修改unstaged(撤销)
* **Staged -> Untracked: `git rm [-r] [--cached] <file>`** 取消追踪已追踪文件
![](src/git.png)

### 分支 [`顶部`](#user-content-索引)
* **`git branch`** 查看所有分支
* **`git branch <name>`** 创建分支
* **`git branch -d <name>`** 删除分支
* **`git branch -D <name>`** 强制删除一个未合并的分支

<br>

* **`git checkout <name>`** 切换分支
* **`git checkout -b <name>`** 创建并切换到创建的分支

<br>

* **`git merge <name>`** 合并某分支到当前分支
* **`git merge --no-ff [-m message] <name>`** --no-ff参数, 表示禁用 **Fast forward** 模式

### 远程 [`顶部`](#user-content-索引)
* **`git remote add <repository name> <SSH | HTTPS>`** 使本地仓库与远程仓库关联
* **`git push -u origin master`** 把本地仓库推送给远程仓库. 第一次推送给远程仓库加上-u参数的话, 会把本地的master分支和远程master分支关联, 以后拉取和推送就不要-u参数了
* **`git clone <SSH | HTTPS>`** 克隆一个远程仓库
* **`git pull`** 更新代码
* **`git remote -v`** 查看远程库信息
* **`git branch --set-upstream-to <branch-name> origin/<branch-name>`** 本地与远程分支关联

### 储存现场 [`顶部`](#user-content-索引)
* **`git stach`** 储藏工作现场
* **`git stash list`** 
* **`git stash apply`** 恢复现场, 不删除 stash
* **`git stash drop`** 删除stach
* **`git stash pop`** 恢复现场, 并删除 stash

### 标签 [`顶部`](#user-content-索引)
* **`git tag`** 查看所有标签
* **`git show <tag_name>`** 查看标签具体信息

<br>

* **`git tag <tag_name> [版本号]`** 新建一个标签, 不输入版本号则默认在当前分支的最新提交
* **`git tag -a <tag_name> -m <"message"> [version]`** 指定标签信息
* **`git tag -d <tag name>`** 删除本地标签
* **`git push origin :refs/tags/<tag_name>`** 删除远程标签

<br>

* **`git push origin <tag_name>`** 推送标签到远程
* **`git push origin --tags`** 推送所有标签到远程