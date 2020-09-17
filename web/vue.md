# 目录
- [目录结构](#目录结构)
- [模板指令](#模板指令)
    - [v-text](#v-text)
    - [v-html](#v-html)
    - [v-on:click](#v-onclick)
    - [v-bind:](#v-bind)
    - [v-model](#v-model)
    - [v-if](#v-if)
    - [v-show](#v-show)
    - [v-for](#v-for)
- [组件](#组件)
    - [组件的使用](#组件的使用)
    - [父组件向子组件传值](#父组件向子组件传值)
    - [子组件向父组件传值](#子组件向父组件传值)



***************************************************************************************************************
***************************************************************************************************************



# 安装运行
### 安装与卸载
```
npm uninstall vue/cli -g
npm install -g @vue/cli
```

### 创建与运行项目
```
vue create PROJECT_NAME
npm run serve
```

# 目录结构
```
.
├── build   webpack相关配置文件
├── config   配置目录, 包括端口号等
├── node_modules   npm加载的项目依赖模块
├── src
│   ├── assets   放置一些图片
│   ├── compoents   组件文件
│   ├── router
│   ├── APP.vue   项目入口文件
│   └── main.js   项目的核心文件
├── static   静态资源目录, 如图片字体等
└── test   初始测试目录
```

# 模板指令
### v-text

### v-html
用于输出html代码  
```vue
<template>
    <div v-html="message"></div>
</template>

<script>
export default {
    data() {
        return {
            message: '<h1>Test</h1>'
        }
    }
}
</script>
```

### v-on:
用于绑定事件, 可简写为`@`. 如`<div @click='clickAction'></div>`  
```vue
<template>
    <h1 v-on:click="clickTest">Title<h1/>
    <h1 @click="clickTest">Title<h1/>
</template>

<script>
export default {
    methods: {
        clickTest() {
            console.log("Hello World");
        }
    }
}
</script>
```
```vue

<script>
    new Vue({
    })
</script>
```

### v-bind:
可简写为`:`, 用于属性绑定(单向绑定, 由数据来决定页面内容)  

### v-model
双向绑定: 数据可以决定页面的内容, 页面可以改变数据  
```vue
<template>
    <input v-model='inputText'>
</template>

<script>
export default {
    data() {
        return {
            inputText: ''
        }
    }
}
</script>
```

### v-if
此指令直接删除/增加对应的DOM标签  
```vue
<template>
    <button @click='toggleTest'>toggle</button>
    <div v-if='appear'>as we can</div>
</template>

<script>
export default {
    data() {
        return {
            appear: true
        }
    },
    methods: {
        toggleTest: function(){
            this.appear = !this.appear;
        }
    }
}
</script>
```

### v-show
此指令设置标签的`dispaly: none`  

### v-for
```vue
<template>
    <ul>
        <li v-for='(i, index) of list' :key='index'>{{index}}: {{i}}</li>
    </ul>
</template>

<script>
export default {
    data() {
        return {
            list: [1, 2, 4, 5, 6]
        }
    }
}
</script>
```

# 注册组件
### 注册全局组件
```vue
<template>
    <ul>
        <todo-item v-for='item of list' :content='item'></todo-item>
    </ul>
</template>

<script>
Vue.component('todo-item',{
    props: ['content'],
    template: '<li>{{content}}</li>'
})

export default {
    data() {
        return {
            list: [1, 2, 3]
        }
    }
}
</script>
```

### 注册局部组件
```vue
<!-- 父组件 -->
<template>
    <div>
        father: <input v-model='inputText'>
        <Son :money='inputText'></Son>
    </div>
</template>

<script>
import Son from './Son.vue'

export default {
    components: { Son },
    data(){
        return {
            inputText: 0
        }
    }
}
</script>
```
```vue
<!-- 子组件 -->
<template>
    <div>
        son: {{money}}
    </div>
</template>

<script>
export default {
    props: ['money']
}
</script>
```

# 组件通信
### 父组件向子组件传值
通过 **属性** 传递给子组件, 代码参照 [注册局部组件](#注册局部组件)  

### 子组件向父组件传值
通过 **发布订阅** 传递给父组件  
1. 当创建子组件的时候, 向子组件传递了两个数据: `content`和`index`  
2. 当点击子组件时, 触发`handleClick()`函数, 并向外触发`delete`事件, 传递`index`参数  
3. 父组件监听到`delete`事件, 触发`handleDelete()`函数  
```vue
<!-- 父组件 -->
<template>
    father's money: {{bank}}
    <Son @send='receiveEvent'></Son>
</template>

<script>
import Son from './Son'

export default {
    components: { Son },
    data(){
        return {
            bank: 0
        }
    },
    methods: {
        receiveEvent(val){
            this.bank += val
        }
    }
}
</script>
```
```vue
<!-- 子组件 -->
<template>
    <button @click='clickEvent'>son send to father</button>
</template>

<script>
export default {
    data(){
        return {
            money: 1
        }
    },
    methods {
        sendEvent() {
            this.$emit('send', this.money)
        }
    }
}
</script>
```

### 非父子组件通信
使用`ref`给元素或子组件注册引用信息, 引用的信息将被注册到父组件的`$refs`对象上  
个人理解是, 父组件中使用`this.$refs.子组建ref值`相当于拿到了子组件的DOM对象  
```vue
<template>
    <div>
        <h3>父组件</h3>
        <span @click="clickAction">给子组件发消息</span>
        <my-component ref="child"></my-component>
    </div>
</template>

<script>
import MyComponent from './MyComponent'
export default {
    components: { MyComponent },
    data() {
        return {

        }
    },
    methods: {
        clickAction() {
            this.$refs.child.show("来自父组件的消息");
        }
    }
}
</script>
```
```vue
<template>
    <div>
        <h3>子组件</h3>
        <span>{{message}}</span>
    </div>
</template>

<script>
export default {
    data() {
        return {
            message: ''
        }
    },
    methods: {
        show(msg) {
            this.message = msg;
        }
    }
}
</script>
```

# 路由配置
```js
import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router);

const router = new Router({
    mode: 'history',
    routers: [{
        path: '/test',
        name: test,
        component: ()=>import ('../views/Test')
    }]
})

export default router
```

# 路由传参
query对应path, params对应name  

### params方式
```vue
// 父组件发送
this.$router.push({
    name: 'test',
    params: {
        myParam: this.message
    }
});
```
```vue
// 子组件接受
this.value = this.$route.params.myParam
```

### query方式
注意此处的`path`值里面的斜线, 代表路径  
```vue
// 父组件发送
this.$router.push({
    path: '/test',
    query: {
        myParam: this.message
    }
});
```
```vue
// 子组件接受
this.value = this.$route.query.myParam
```

# 过滤器
```vue
<template>
    <div>
        <span>{{value | format}}</span>
    </div>
</template>

<script>
export default {
    data() {
        return {
            value: 10
        }
    },
    fliters: {
        format(val) {
            if(val > 0) {
                return val;
            } else {
                return 0;
            }
        }
    }
}
</script>
```
