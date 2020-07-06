### 创建虚拟环境
* 这里的pytorch是虚拟环境的名称
```
conda create --name ENV_NAME python=3.6
```

### 切换虚拟环境
* Windows
```
activate ENV_NAME
```
* Linux
```
conda activate pytorch
````

### 查看虚拟环境
* 列出所有由conda创建的虚拟环境和路径
```
conda env list
```

### 删除虚拟环境
```
conda env remove -n ENV_NAME
```

### 查看包
* 列出当前环境下所有已安装包
```
conda list [PACKAGE_Name]
```

### 退出虚拟环境
```
conda deactivate
```

### 克隆虚拟环境
```
conda create --name ENV_NAME_NEM --clone ENV_NAME_OLD
```

