### 安装
* conda
```sh
conda install jupyter notebook
```
* pip
```sh
pip3 install jupyter
```

### 启动jupyter notebook
```
jupyter notebook
```

### 关联conda环境
```
conda install nb_conda
```

# 远程
### 生成默认配置文件
会在用户主目录下生成.jupyter文件夹，其中jupyter_notebook_config.py就是刚刚生成的配置文件  
```sh
jupyter notebook --generate-config
```

### 生成秘钥
输入ipython，进入ipyhon命令行, 这里要求你输入以后登录使用的密码，然后生成一个秘钥  
```ipython
In [1]: from notebook.auth import passwd

In [2]: passwd()

Enter password: 
Verify password: 
Out[2]: 'sha1:1b4ea9662b35:3e3d6a823d264d466f125a0939623c05e7b66007'
```

### 修改配置文件
修改用户主目录下~/.jupyter/jupyter_notebook_config.py文件, 取消`c.NotebookApp.password = ''`注释，并将生成的秘钥复制进去  
取消下面几项注释，并注释修改ip、端口、不自动打开浏览器  
```
c.NotebookApp.ip='*'
c.NotebookApp.open_browser = False
c.NotebookApp.port =8888
```
