# 目录
- [branch](#branch)
- [checkout](#checkout)
- [cherry-pick](#cherry-pick)
- [commit](#commit)
- [config](#config)
- [diff](#diff)
- [grep](#grep)
- [log](#log)
- [merge](#merge)
- [others](#others)
- [plumbing](#plumbing)
- [push](#push)
- [rebase](#rebase)
- [remote](#remote)
- [reset](#reset)
- [revert](#revert)
- [stash](#stash)
- [tag](#tag)



*********************************************************************************
*********************************************************************************



# branch
* **`git branch`** 查看所有分支
* **`git branch -vv`** 查看分支详细信息
* **`git branch -r`** 查看远程分支
* **`git branch <branch_name> [commit_id]`** 新建一个分支并使分支指向对应的提交对象, 默认为当前分支
* **`git branch -d <branch_name>`** 删除一个已合并的分支
* **`git branch -d <branch_name>`** 强制删除一个未合并的分支
* **`git branch --set-upstream-to=origin/<remote_branch_name> <local_branch_name>`** 将本地已有分支和远程已有分支关联起来(设置上游分支)

# checkout
* **`git checkout <branch_name | tag_name>`** 切换分支
* **`git checkout <remote_branch_name>`** 本地不存在对应的分支, 新建一个跟踪远程的分支并切换
* **`git checkout -b <branch_name>`** 创建并切换到创建的分支
* **`git checkout -b <local_branch_name> origin/<remote_branch_name>`** 本地新建一个跟踪远程的分支
* **`git checkout HEAD -- <file>`** 将暂存区和工作区换成HEAD指向的file
* **`git checkout --conflict=diff3 <file_path>`** 带有base版本的差异比较

# cherry-pick
* **`git cherry-pick <commit_id>`** 取出某一个提交应用到当前分支

# commit
* **`git commit --amend [--no-edit]`** 修改提交信息或暂存区

### 查看配置与范围
* **`git config [--system | --global] --list [--show-origin]`** 小范围会覆盖大范围的配置, .git/config的配置变量会覆盖/etc/gitconfig中的配置变量
    * 不加参数对应的配置文件位于.git/config, 仅对当前仓库生效
    * `--global`选项对应的配置文件位于\~/.gitconfig, 对当前用户的的所有仓库生效
    * `--system`选项对应的配置文件位于/etc/gitconfig, 每一个用户都会生效

### push.default
2.0之前为matching, 2.0之后为simple
* **nothing:** push操作无效, 除非显式指定远程分支, 例如`git push origin develop`
* **current:** push当前分支到远程同名分支, 如果远程同名分支不存在则自动创建同名分支
* **upstream:** push当前分支到它的upstream分支上(这种模式叫做central workflow)
* **simple:** simple和upstream是相似的, 只有一点不同, simple必须保证本地分支和它的远程upstream分支同名, 否则会拒绝push操作
* **matching:** push所有本地和远程两端都存在的同名分支

# diff
* **`git [--name-only | --name-status] [commit_id...] [file_name]`** 
* **`git diff --name-status <commit_id1> <commit_id2>`** 获取两次commit修改的文件
* **`git diff`** 查看工作区和暂存区的差异(未暂存的修改)
* **`git diff <--cached | --staged>`** 查看暂存区和版本库的差异(已暂存的修改)
* **`git diff HEAD`** 查看工作区和版本库差异
* **`git diff <--ours | --theirs | --base>`** 合并时比较

# grep
* **`git grep <-n | --line-number> <string>`** 查找工作区的字符串, 显示 详细内容与行号
* **`git grep <-c | --count> <sting>`** 只显示匹配的个数

# log
* **`git log`** 查看提交历史
* **`git reflog`** 查看所有历史日志
* **`git log --oneline --all --graph`** 查看分支图
* **`git log --format='%c(yellow)%h%creset %c(auto)%d%creset %s %c(green)(%cr) %c(blue)<%an> <file_path>'`** 查看某个文件的修改历史
* **`git log -s <string>`** 查看某个字符串的历史(俗称鹤嘴锄pickaxe)
* **`git log -g <string>`** 使用正则表达式
* **`git log --oneline --graph <branch1>..<branch2>`** 两点: 属于branch2但不属于branch1的提交
* **`git log --left-right <branch1>...<branch2>`** 三点: 不同时属于branch1和branch2提交

```sh
git log --pretty=format:"%h - %an, %ar : %s"
git log --format="%h - %an, %ar : %s"
```

选项 | 说明
---- | ---
%d   | HEAD指针, 分支等相关信息
%h   | 提交的完整哈希值
%h   | 提交的简写哈希值
%t   | 树的完整哈希值
%t   | 树的简写哈希值
%p   | 父提交的完整哈希值
%p   | 父提交的简写哈希值
%an  | 作者名字
%ae  | 作者的电子邮件地址
%ad  | 作者修订日期(可以用--date=选项 来定制格式)
%ar  | 作者修订日期, 按多久以前的方式显示
%cn  | 提交者的名字
%ce  | 提交者的电子邮件地址
%cd  | 提交日期
%cr  | 提交日期(距今多长时间)
%s   | 提交说明

# merge
* **`git merge <branch_name>`** 合并某分支到当前分支
* **`git merge --no-ff [-m message] <branch_name>`** --no-ff参数, 表示禁用 **fast forward** 模式
* **`git merge --squash <branch_name>`** 将某分支上所有的提交合并成一个, 应用到当前分支(只是到暂存区, 且不移动HEAD)

# others
* **`git status -s`** 简单展示状态

### 目录结构
```
.git
├── commit_editmsg   最后一次提交的注释
├── config   git有关配置
├── fetch_head   每个分支最后一次和服务器通信的sha1值
├── head   `ref: refs/heads/dev` 当前工作区所在分支
├── index   二进制文件, 暂存区, 使用 git ls-files -s 查看
├── orig_head
├── packed-refs
├── hooks   钩子
│   ├── applypatch-msg.sample
│   ├── commit-msg.sample
│   └── ......
├── info
│   └── exclude
├── logs 提交日志
│   ├── head
│   └── refs
│       ├── heads
│       └── remotes
├── objects   存储对象
│   ├── d0
│   │   ├── 17c08b44aa8abf163e98693d57536a9cfc863f   二进制文件
│   │   └── b81b4bf9f7134ed9d898af1fbadb6de51fa492
│   ├── d1
│   │   └── f941b9270a3aac4d9832bb0b597deaaf6036e9
│   ├── ......
│   ├── info
│   └── pack
│       ├── pack-9ac9585083426804d36449397d78a3ae6d5ddff8.idx
│       └── pack-9ac9585083426804d36449397d78a3ae6d5ddff8.pack
└── refs   文件内容都是sha1值
    ├── heads
    │   ├── dev
    │   └── master
    ├── remotes
    │   └── origin
    └── tags
```

# plumbing
* **`git cat-file -p [commit_hash]`** 查对象的**内容**
* **`git cat-file -t [commit_hash]`** 查对象的**类型**
* **`git ls-files -s`** 查看暂存区
* **`git ls-files -u`** 查看(合并冲突时)未暂存的文件
* **`git hash-object -w file_url`** 生成一个key:value(hashcode:压缩后的文件)存储到.git/object
* **`git update-index --add --cacheinfo 100644 hash test.txt`** 往暂存区添加一条记录
* **`git write-tree`** 生成一个tree对象存储到.git/object
* **`echo '' | git commit-tree treehash`** 生成一个commit对象
* **`git merge-file -p <file_path1..3>`** 手动合并单个文件

# push
* **`git push origin <tag_name>`** 推送标签到远程
* **`git push origin --tags`** 推送所有标签到远程
* **`git push origin --delete <tag_name>`** 删除远程标签(删除本地标签后, 远程标签不会删除, 必须手动删除远程标签)
* **`git push origin :refs/tags/<tag_name>`** 删除远程标签
* **`git push origin <local_branch_name>:<remote_branch_name>`** 推送本地分支到制定的远程分支
* **`git push origin --delete <remote_branch_name>`** 删除远程分支
* **`git push origin :<remote_branch_name>`** 删除远程分支(推送空分支到远程)

# rebase
* **`git rebase master`** 将当前分支(主题分支)的修改变基到 **master** 分支(目标分支)上
* **`git rebase <base_branch> <topic_branc>`** 将主题分支变基到目标分支上(不指定topic_branc则默认为当前分支)
* **`git rebase --onto <base_branch> <topic_branc>`** 合并到目标分支时不会生产新的提交(类似amend)
* **`git rebase --onto master server client`** 找出client分支从server分支分歧之后的补丁, 然后把这些补丁在master分支上应用, 让client看起来像直接基于master修改一样
* **`git rebase -i HEAD~3`** 修改最近三次修改(注意HEAD~3包含了四次提交)(实际上是当前分支变基到HEAD~3分支上)

# remote
* **`git remote add <repository_name> <ssh | https>`** 使本地仓库与远程仓库关联
* **`git remote -v`** 查看远程仓库信息
* **`git remote prune origin --dry-rnu`** 列出仍在跟踪但远程已删除的分支

# reset
* **`git reset [--hard | --mixed | --soft] HEAD^`** 回退到上一个版本
* **`git reset [--hard | --mixed | --soft] <commit_id>`** 回退到指定版本
    * `--soft` 不修改working directory和index, 只修改**HEAD**的内容. 本质上是撤销了某一次的commit命令
    * `--mixed` 不修改working directory, 只修改**index**和**HEAD**的内容
    * `--hard` 修改**working directory**和**index**和**HEAD**的内容
* **`git reset HEAD -- <file>`** 将暂存区的file替换成HEAD指向的file, 可以把提交到暂存区的修改unstaged

# revert
* **`git revert HEAD`** 撤销HEAD的修改
* **`git revert HEAD~`** 撤销HEAD~的修改(不会撤销HEAD的修改, 只撤销一个commit的修改)
* **`git revert <commit_id>`** 
* **`git revert -m 1 <commit_id>`** 对于 **两个分支合并而来的提交** , 指定第一个分支为主线分支, 撤销第二个分支的修改
* **`git revert --no-commit`** 不自动生成反向修改的提交, 只改动暂存区
* **`git revert <commit_id1>..<commit_id2>`** 撤销一系列提交, 左开右闭, 不包括1包括2

# show
* **`git show <tag_name>`** 查看标签具体信息
* **`git show :<number>:<file_name>`** 查看合并冲突时index中的文件, number取值为1-3, 1表示共同祖先, 2是当前分支的版本, 3是他们的版本

# stash
* **`git stach`** 
* **`git stash [-u | --include-untracked]`** stash未追踪的文件
* **`git stash push [-m 'message'] [-- file_path]`** stash指定文件
* **`git stash list`** 查看所有的贮藏
* **`git satsh show [stash]`** 查看某个stash
* **`git stash apply [--index] [stash]`** 应用某个stash(不删除)
* **`git stash pop [--index] [stash]`** 应用并删除某个stash
* **`git stash drop [stash]`** 删除stash
* **`git stash clear`** 删除所有stash

# tag
* **`git tag`** 查看所有标签
* **`git tag <tag_name> [commit_id]`** 新建一个lightweight标签, 本质是一个指向commit对象的指针, 使用`git cat-file -t`查看为commit
* **`git tag -a <tag_name> -m <tag_description> [commit_id]`** 新建一个annotate标签, 是一个tag对象
* **`git tag -d <tag_name>`** 删除本地标签
