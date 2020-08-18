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



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->

# 安装卸载
```
npm uninstall vue/cli -g
npm install -g @vue/cli
```
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



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 模板指令
### v-text

### v-html

### v-on:click
可简写为`@click`  
```vue
<h1 v-on:click="clickTest">Title<h1/>
<h1 @click="clickTest">Title<h1/>

<script>
    new Vue({
        methods: {
            clickTest: function(){
                this.msg = "Hello World";
            }
        }
    })
</script>
```

### v-bind:
可简写为`:`  
属性绑定(单向绑定, 由数据来决定页面内容)  

### v-model
双向绑定: 数据可以决定页面的内容, 页面可以改变数据  
```vue
<input v-model='inputText'>
{{inputText}}
```

### v-if
此指令直接删除/增加对应的DOM标签  
```vue
<button @click='toggleTest'>toggle</button>
<div v-if='appear'>as we can</div>

new Vue({
    data: {
        appear: true
    },
    methods: {
        toggleTest: function(){
            this.appear = !this.appear;
        }
    }
})
```

### v-show
此指令设置标签的`dispaly:none`属性  
```vue
<button @click='toggleTest'>toggle</button>
<div v-show='appear'>as we can</div>

new Vue({
    data: {
        appear: true
    },
    methods: {
        toggleTest: function(){
            this.appear = !this.appear;
        }
    }
})
```

### v-for
```vue
<ul>
    <li v-for='(i, index) of list' :key='index'>{{index}}: {{i}}</li>
</ul>

new Vue({
    data: {
        list: [1, 2, 4, 5, 6]
    }
})
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 组件
### 组件的使用
```vue
<div id="root">
    <input v-model='inputValue' placeholder="type something here"/>
    <button @click='submitClick'>Submit</button>
    <ul>
        <todo-item v-for='item of list' :content='item'></todo-item>
    </ul>
</div>

<script>
    Vue.component('todo-item',{
        props: ['content'],
        template: '<li>{{content}}</li>'
    })

    new Vue({
        el: "#root",
        data: {
            inputValue: '',
            list: []
        },
        methods: {
            submitClick: function(){
                this.list.push(this.inputValue);
                this.inputValue = '';
            }
        }
    })
</script>
```

### 父组件向子组件传值
通过 **属性** 传递给子组件  

##### 全局组件
```vue
<ul>
    <todo-item v-for='item of list' :content='item'></todo-item>
</ul>

<script>
    Vue.component('todo-item',{
        props: ['content'],
        template: '<li>{{content}}</li>'
    })
</script>
```

##### 局部组件
```vue
<template>
    <div>
        father: <input v-model='inputText'>
        <Son :money='inputText'></Son>
    </div>
</template>

<script>
import Son from './Son.vue'

export default {
    components: {
        Son
    },
    data(){
        return {
            inputText: 0
        }
    }
}
</script>
```
```vue
<template>
    <div>
        son: {{number}}
    </div>
</template>

<script>
export default {
    props: ['money']
}
</script>
```

### 子组件向父组件传值
通过 **发布订阅** 传递给父组件  
1. 当创建子组件的时候, 向子组件传递了两个数据: `content`和`index`  
2. 当点击子组件时, 触发`handleClick()`函数, 并向外触发`delete`事件, 传递`index`参数  
3. 父组件监听到`delete`事件, 触发`handleDelete()`函数  

##### 全局组件
```
<ul>
    <todo-item v-for='item of list' :content='item' :index='index' @delete='handleDelete'></todo-item>
</ul>

<script>
    Vue.component('todo-item',{
        props: ['content', 'index'],
        template: '<li @click='handleClick'>{{content}}</li>',
        methods: {
            handleClick: function(){
                this.$emit('delete', this.index)
            }
        }
    })

    new Vue({
        data: {
            list: []
        },
        methods: {
            handleDelete: function(index){
                this.list.splice(index, 1)
            }
        }
    })
</script>
```

##### 局部组件
```vue
<template>
    father's money: {{bank}}
    <Son @send='receiveEvent'></Son>
</template>

<script>
import Son from './Son'

export default {
    data(){
        return {
            bank: 0
        }
    },
    methods: {
        receiveEvent(val){
            this.bank += val
        }
    },
    components: {
        Son
    }
}
</script>
```
```vue
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
        sendEvent: function() {
            this.$emit('send', this.money)
        }
    }
}
</script>
```
