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
- [Component](#component)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



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
<h1 v-on:click="clickTest">{{msg}}<h1/>
<h1 @click="clickTest">{{msg}}<h1/>

<script>
    new Vue({
        data: {
            msg: "Vue",
        },
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



# Component
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
