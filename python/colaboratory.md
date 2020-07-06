* 授权
```sh
!apt-get install -y -qq software-properties-common python-software-properties module-init-tools
!add-apt-repository -y ppa:alessandro-strada/ppa 2>&1 > /dev/null
!apt-get update -qq 2>&1 > /dev/null
!apt-get -y install -qq google-drive-ocamlfuse fuse
from google.colab import auth
auth.authenticate_user()
from oauth2client.client import GoogleCredentials
creds = GoogleCredentials.get_application_default()
import getpass
!google-drive-ocamlfuse -headless -id={creds.client_id} -secret={creds.client_secret} < /dev/null 2>&1 | grep URL
vcode = getpass.getpass()
!echo {vcode} | google-drive-ocamlfuse -headless -id={creds.client_id} -secret={creds.client_secret}
```

* 挂载谷歌硬盘
```sh
!mkdir -p drive
!google-drive-ocamlfuse drive
```

* 查看是否使用GPU
```sh
import tensorflow as tf
tf.test.gpu_device_name()
```

* 查看在使用哪个GPU
```sh
from tensorflow.python.client import device_lib
device_lib.list_local_devices()
```
