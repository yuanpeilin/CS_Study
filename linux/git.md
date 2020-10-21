# 目录
- [配置](#配置)
- [日志](#日志)
    - [格式化](#格式化)
- [撤销](#撤销)
    - [版本回退](#版本回退)
    - [文件回退](#文件回退)
    - [其他](#其他)
- [分支](#分支)
    - [新建与删除分支](#新建与删除分支)
    - [切换分支](#切换分支)
    - [合并分支](#合并分支)
- [远程](#远程)
    - [远程分支](#远程分支)
    - [远程仓库](#远程仓库)
    - [远程标签](#远程标签)
- [储存现场](#储存现场)
- [标签](#标签)
- [差异](#差异)
- [底层](#底层)
    - [四大对象](#四大对象)
    - [底层命令](#底层命令)
- [目录结构](#目录结构)
- [变基](#变基)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 配置
### 范围
小范围会覆盖大范围的配置, .git/config的配置变量会覆盖/etc/gitconfig中的配置变量
* 不加参数对应的配置文件位于.git/config, 仅对当前仓库生效
* `--global`选项对应的配置文件位于\~/.gitconfig, 对当前用户的的所有仓库生效
* `--system`选项对应的配置文件位于/etc/gitconfig, 每一个用户都会生效

### 查看配置
```sh
git config [--system | --global] --list
git config --list --show-origin
```

### push.default
2.0之前为matching, 2.0之后为simple
* **nothing:** push操作无效, 除非显式指定远程分支, 例如git push origin develop
* **current:** push当前分支到远程同名分支, 如果远程同名分支不存在则自动创建同名分支
* **upstream:** push当前分支到它的upstream分支上（这一项其实用于经常从本地分支push/pull到同一远程仓库的情景, 这种模式叫做central workflow）
* **simple:** simple和upstream是相似的, 只有一点不同, simple必须保证本地分支和它的远程 upstream分支同名, 否则会拒绝push操作
* **matching:** push所有本地和远程两端都存在的同名分支


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 日志
* **`git log`** 查看最近三次的提交
* **`git log --oneline --all --graph`** 查看分支图
* **`git reflog`** 查看所有历史日志
* **`git log --format='%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(green)(%cr) %C(blue)<%an> <FILE>'`** 查看某个文件的修改历史

### 格式化
`git log --pretty=format`常用的选项
```sh
git log --pretty=format:"%h - %an, %ar : %s"
git log --format="%h - %an, %ar : %s"
```

选项 | 说明
---- | ---
%d   | HEAD指针, 分支等相关信息
%H   | 提交的完整哈希值
%h   | 提交的简写哈希值
%T   | 树的完整哈希值
%t   | 树的简写哈希值
%P   | 父提交的完整哈希值
%p   | 父提交的简写哈希值
%an  | 作者名字
%ae  | 作者的电子邮件地址
%ad  | 作者修订日期（可以用 --date=选项 来定制格式）
%ar  | 作者修订日期, 按多久以前的方式显示
%cn  | 提交者的名字
%ce  | 提交者的电子邮件地址
%cd  | 提交日期
%cr  | 提交日期（距今多长时间）
%s   | 提交说明


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 撤销
### 版本回退
* **回退到上一个版本** `git reset [--hard | --mixed | --soft] HEAD^`
* **回退到指定版本** `git reset [--hard | --mixed | --soft] <COMMIT_ID>`
* **说明**
    * `--soft` 不修改working directory和index, 只修改**HEAD**的内容. 本质上是撤销了某一次的commit命令
    * `--mixed` 不修改working directory, 只修改**index**和**HEAD**的内容
    * `--hard` 修改**working directory**和**index**和**HEAD**的内容

### 文件回退
* **Modified -> Unmodified:** 撤销尚未提交到暂存区的修改
    * `git checkout HEAD -- <FILE>` 将暂存区和工作区换成HEAD指向的file
    * `git restore <FILE>`
* **Staged -> Modified:** 可以把提交到暂存区的修改unstaged
    * `git reset HEAD -- <FILE>` 将暂存区的file替换成HEAD指向的file
    * `git restore --staged <FILE>`
* **Unmodified -> Untracked:** 删除一个文件
    * `git rm <FILE>`
* **Staged -> Untracked:** 取消追踪已追踪文件
    * `git rm [-r] --cached <FILE>`

### 其他
* 修改提交信息或暂存区 `git commit --amend`



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 分支
### 新建与删除分支
* **`git branch`** 查看所有分支
* **`git branch -vv`** 查看分支详细信息
* **`git branch <BRANCH_NAME> [COMMIT_HASH]`** 新建一个分支并使分支指向对应的提交对象, 默认为当前分支
* **`git branch -d <BRANCH_NAME>`** 删除 一个已合并的分支
* **`git branch -D <BRANCH_NAME>`** 强制删除一个未合并的分支

### 切换分支
* **`git checkout <BRANCH_NAME | TAG_NAME>`** 切换分支
* **`git checkout -b <BRANCH_NAME>`** 创建并切换到创建的分支

### 合并分支
* **`git merge <BRANCH_NAME>`** 合并某分支到当前分支
* **`git merge --no-ff [-m message] <BRANCH_NAME>`** --no-ff参数, 表示禁用 **Fast forward** 模式



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 远程
### 远程仓库
* **`git remote add <REPOSITORY_NAME> <SSH | HTTPS>`** 使本地仓库与远程仓库关联
* **`git clone <SSH | HTTPS>`** 克隆一个远程仓库
* **`git pull origin <REMOTE_BRANCH_NAME>`** 更新代码
* **`git push origin <LOCAL_BRANCH_NAME>:<REMOTE_BRANCH_NAME>`** 推送本地分支到制定的远程分支
* **`git remote -v`** 查看远程仓库信息

### 远程分支
* **`git branch -r`** 查看远程分支
* **`git checkout -b <LOCAL_BRANCH_NAME> origin/<REMOTE_BRANCH_NAME>`** 本地新建一个跟踪远程的分支
* **`git branch --set-upstream-to=origin/<REMOTE_BRANCH_NAME> <LOCAL_BRANCH_NAME>`** 将本地已有的分支和远程已有的分支关联起来(设置上游分支)
* **`git push -u origin master`** 把本地仓库推送给远程仓库. 加上-u参数会把本地的master分支和远程master分支关联
* **`git push origin --delete <REMOTE_BRANCH_NAME>`** 删除远程分支
* **`git push origin :<REMOTE_BRANCH_NAME>`** 删除远程分支(推送空分支到远程)
* **`git remote prune origin --dry-rnu`** 列出仍在跟踪但远程已删除的分支

### 远程标签
* **`git push origin <TAG_NAME>`** 推送标签到远程
* **`git push origin --tags`** 推送所有标签到远程
* **`git push origin --delete <TAG_NAME>`** 删除远程标签(删除本地标签后, 远程标签不会删除, 必须手动删除远程标签)
* **`git push origin :refs/tags/<TAG_NAME>`** 删除远程标签



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 储存现场
* **`git stach`** 储藏工作现场
* **`git stash list`** 查看所有的储存现场
* **`git stash apply`** 恢复现场, 不删除stash
* **`git stash pop`** 恢复现场, 并删除stash
* **`git stash drop`** 删除stach



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 标签
* **`git tag`** 查看所有标签
* **`git show <TAG_NAME>`** 查看标签具体信息
* **`git tag <TAG_NAME> [COMMIT_ID]`** 新建一个lightweight标签, 本质是一个指向commit对象的指针, 使用`git cat-file -t`查看为commit
* **`git tag -a <TAG_NAME> -m <TAG_DESCRIPTION> [COMMIT_ID]`** 新建一个annotate标签, 是一个tag对象
* **`git tag -d <TAG_NAME>`** 删除本地标签



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 差异
### 语法
`git [--name-only | --name-status] [COMMIT_ID1 COMMIT_ID2 ...] [FILE_NAME]`  
* `--name-only`将只展示文件名
* `--name-status`展示文件名和文件状态
* 添加`FILE_NAME`可以指定比较的文件, 否则将比较所有文件

### 例子
* **`git diff --name-status <COMMIT_ID1> <COMMIT_ID2>`** 获取两次commit修改的文件
* **`git diff`** 查看工作区和暂存区的差异(未暂存的修改)
* **`git diff <--cached | --staged>`** 查看暂存区和版本库的差异(已暂存的修改)
* **`git diff HEAD`** 查看工作区和版本库差异



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 底层
### 四大对象
1. **Blob对象**  
2. **Tree对象**  
3. **Commit对象**  
4. **Tag对象**  

### 底层命令
* **`git cat-file -p [COMMIT_HASH]`** 查对象的**内容**
* **`git cat-file -t [COMMIT_HASH]`** 查对象的**类型**
* **`git ls-files -s`** 查看暂存区
* **`git hash-object -w FILE_URL`** 生成一个key:value(HashCode:压缩后的文件)存储到.git/object
* **`git update-index --add --cacheinfo 100644 hash test.txt`** 往暂存区添加一条记录
* **`git write-tree`** 生成一个tree对象存储到.git/object
* **`echo '' | git commit-tree treehash`** 生成一个commit对象

# 目录结构
```
.git
├── COMMIT_EDITMSG   最后一次提交的注释
├── config   git有关配置
├── FETCH_HEAD   每个分支最后一次和服务器通信的SHA1值
├── HEAD   `ref: refs/heads/dev` 当前工作区所在分支
├── index   二进制文件, 暂存区, 使用 git ls-files -s 查看
├── ORIG_HEAD
├── packed-refs
├── hooks   钩子
│   ├── applypatch-msg.sample
│   ├── commit-msg.sample
│   └── ......
├── info
│   └── exclude
├── logs 提交日志
│   ├── HEAD
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
└── refs   文件内容都是SHA1值
    ├── heads
    │   ├── dev
    │   └── master
    ├── remotes
    │   └── origin
    └── tags
```

# 变基
* **`git rebase master`** 将当前分支(主题分支)的修改变基到master分支(目标分支)上
* **`git rebase <BASE_BRANCH> <TOPIC_BRANC>`** 将主题分支变基到目标分支上(BASE_BRANCH <- TOPIC_BRANC)
* **`git rebase --onto master server client`** 找出client分支从server分支分歧之后的补丁, 然后把这些补丁在master分支上应用, 让client看起来像直接基于master修改一样
