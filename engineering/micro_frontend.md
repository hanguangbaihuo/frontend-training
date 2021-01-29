<!--
 * @Author: 明华
 * @Date: 2021-01-28 15:35:01
 * @LastEditors: 明华
 * @LastEditTime: 2021-01-28 15:35:02
 * @Description: 
 * @FilePath: /frontend-training/engineering/micro_fronent_end.md
-->
# 微前端

最早提出的微前端   =>  解构巨石项目，技术栈无关



先看看业内遇到的问题

巨石项目庞大难维护

小项目太分散, 需要整合

团队无法同时容纳不同技术栈

某些板块及业务需要公用



业内相对成熟的方案

## 蚂蚁金服

@Umi-plugin-qiankun

qiankun

single-spa（https://zh-hans.single-spa.js.org/docs/getting-started-overview#javascript-%E5%BE%AE%E5%89%8D%E7%AB%AF）

Single-spa 从现代框架组件生命周期中获得灵感，将生命周期应用于整个应用程序。

```js
//app1.js

let domEl;

export function bootstrap(props) {
    return Promise
        .resolve()
        .then(() => {
            domEl = document.createElement('div');
            domEl.id = 'app1';
            document.body.appendChild(domEl);
        });
}

export function mount(props) {
    return Promise
        .resolve()
        .then(() => {
            // 在这里通常使用框架将ui组件挂载到dom。请参阅https://single-spa.js.org/docs/ecosystem.html。
            domEl.textContent = 'App 1 is mounted!'
        });
}

export function unmount(props) {
    return Promise
        .resolve()
        .then(() => {
            // 在这里通常是通知框架把ui组件从dom中卸载。参见https://single-spa.js.org/docs/ecosystem.html
            domEl.textContent = '';
        })
}
```

## 欢聚时代

Emp（https://github.com/efoxTeam/emp/wiki）	

webpack5 模块联邦 (https://zhuanlan.zhihu.com/p/115403616)



Single-spa原理	demo演示

jsEntry |HtmlEntry	https://juejin.cn/post/6885212507837825038

import-html-entry

### webpack5模块联邦

1. 动机

   ![image-20210128013957792](/Users/hulipeng/Library/Application Support/typora-user-images/image-20210128013957792.png)

2. 属性

![image-20210128013810997](/Users/hulipeng/Library/Application Support/typora-user-images/image-20210128013810997.png)





## 规划



前端应用中心服务		在线动态分发 Runtime 子模块 (订单管理,  商品管理, 图片管理，....）

业务中台	现在的	b-test.hanguangbaihuo.com



子项目1： mqkf.com 麻雀客服（订单管理，图片管理）

子项目2： mqyy.com 麻雀运营（商品管理， 图片管理）

子项目3： mqyw.com 麻雀运维（扩容管理， 推送管理）

.......

.......

.......

假如有20个不同的团队，需要有20种子项目形态



配置化中心一键发布新的子项目(需要应用中心粒度足够细)









https://my.oschina.net/u/568478/blog/4795185





# 代码片段

```js
// single-spa缺陷
// 不够灵活，不能动态加载js文件
// 样式不隔离 没有js沙箱的机制 window污染
```

## child-vue

```shell
npm install single-spa-vue
```

### src/main.js

```js
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import singleSpaVue from 'single-spa-vue'

Vue.config.productionTip = false

// new Vue({
//   router,
//   render: h => h(App)
// }).$mount('#app')

const appOptions = {
  el: '#vue',
  router,
  render: h => h(App)
}

const vueLifeCycle = singleSpaVue({
  Vue,
  appOptions,
})

// 如果是父应用引用我
if (window.singleSpaNavigate) {
  __webpack_public_path__ = 'http://localhost:10000/'
}

if (!window.singleSpaNavigate) {
  delete appOptions.el
  new Vue(appOptions).$mount('#app')
}


// 协议接入 父应用会调用这些方法
export const bootstrap = vueLifeCycle.bootstrap
export const mount = vueLifeCycle.mount
export const unmount = vueLifeCycle.unmount

// 将子应用打包成一个个的lib去给父应用使用


```

### src/router/index.js

```js
const router = new VueRouter({
  mode: 'history',
  base: '/vue',
  // base: process.env.BASE_URL,
  routes
})
```

### vue.config.js

```js
module.exports = {
  configureWebpack: {
    output: {
      library: 'singleVue',
      libraryTarget: 'umd'
    },
    devServer: {
      port: 10000,
    }
  }
}
```



## parent-vue

```shell
npm install single-spa
```

### src/main.js

```js
import Vue from 'vue'
import App from './App.vue'
import router from './router'

import { registerApplication, start } from 'single-spa'

Vue.config.productionTip = false

async function loadScript(url) {
  return new Promise((resolve, reject) => {
    let script = document.createElement('script')
    script.src = url
    script.onload = resolve
    script.onerror = reject
    document.head.appendChild(script)
  })
}

// single-spa缺陷
// 不够灵活，不能动态加载js文件
// 样式不隔离 没有js沙箱的机制 window污染

registerApplication('myVueApp',
  async () => {
    // 加载模块
    console.log('加载模块');
    await loadScript(`http://localhost:10000/js/chunk-vendors.js`)
    await loadScript(`http://localhost:10000/js/app.js`)
    return window.singleVue
  },
  location => location.pathname.startsWith('/vue') // 用户切换到了vue的路径下
)

start()

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
```

### src/App.vue

```vue
<template>
  <div id="app">
    <router-link to="/vue">加载vue子应用</router-link>
    <!-- 子应用容器 -->
    <div id="vue"></div>
  </div>
</template>

<style>
</style>

```



## qiankun-base

```shell
npm i element-ui -S
npm install qiankun
```

### Src/main.js

```js
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(ElementUI);

import { registerMicroApps, start } from 'qiankun'
const apps = [
  {
    name: 'vueApp',
    entry: '//localhost:10000', //默认加载这个html，解析里面的js，动态执行（子应用必须支持跨域）
    container: '#vue',
    activeRule: '/vue',
  },
  {
    name: 'reactApp',
    entry: '//localhost:20000', //默认加载这个html，解析里面的js，动态执行（子应用必须支持跨域）
    container: '#react',
    activeRule: '/react',
  }
]

registerMicroApps(apps)
start({
  prefetch: false,
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')

```

### src/App.vue

```vue
<template>
  <div>
    <el-menu :router="true" mode="horizontal">
      <!-- 基座中可以放自己的路由 -->
      <el-menu-item index="/">Home</el-menu-item>
      <!-- 可以引用其他子应用 -->
      <el-menu-item index="/vue">vue应用</el-menu-item>
      <el-menu-item index="/react">react应用</el-menu-item>
    </el-menu>
    <router-view></router-view>
    <div id="vue"></div>
    <div id="react"></div>
  </div>
</template>

```

### Src/views/Home.vue

```js
<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/> -->
    base主页
  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'Home',
  // components: {
  //   HelloWorld
  // }
}
</script>

```

## qiankun-vue

### vue.config.js

```js
module.exports = {
  configureWebpack: {
    output: {
      library: 'vueApp',
      libraryTarget: 'umd'
    },
    devServer: {
      port: 10000,
      headers: {
        'Access-Control-Allow-Origin': '*',
      }
    }
  }
}
```

### src/main.js

```js
import Vue from 'vue'
import App from './App.vue'
import router from './router'

// Vue.config.productionTip = false

// new Vue({
//   router,
//   render: h => h(App)
// }).$mount('#app')

let instance = null

function render(props) {
  instance = new Vue({
    router,
    render: h => h(App)
  }).$mount('#app') // 这里是挂载到自己的html中，基座会拿到这个挂载后的html，将其插入进去
}



if(window.__POWERED_BY_QIANKUN__) {
  __webpack_public_path__ = window.__INJECTED_PUBLIC_PATH_BY_QIANKUN__;
}

if(!window.__POWERED_BY_QIANKUN__) {
  render()
}

// 子组件的协议
export async function bootstrap(props){
  console.log('qiankun-vue启动');
}

export async function mount(props){
  render(props)
}

export async function unmount(props){
  instance.$destroy()
}
```

### src/router/index.js

```js
const router = new VueRouter({
  mode: 'history',
  base: '/vue',
  routes
})
```



## qiankun-react

```shell
npx create-react-app qiankun-react
yarn add react-app-rewired
yarn add react-router-dom
```

### package.json

```json
 "scripts": {
    "start": "react-app-rewired start",
    "build": "react-app-rewired build",
    "test": "react-app-rewired test",
    "eject": "react-app-rewired eject"
  },
```

### config-overrides.js

```js
module.exports = {
  webpack: (config) => {
    config.output.library = 'reactApp'
    config.output.libraryTarget = 'umd'
    config.output.publicPath = 'http://localhost:20000/'
    return config
  },
  devServer: (configFunction) => {
    return function(proxy, allowHost) {
      const config = configFunction(proxy, allowHost)
      // config.port = '20000'
      config.headers = {
        'Access-Control-Allow-Origin': '*',
      }
      return config
    }
  }
}
```

### .env

```tex
PORT=20000
WDS_SOCKET_PORT=20000
SKIP_PREFLIGHT_CHECK=true
```

### src/index.js

```js
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';

function render() {
  ReactDOM.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>,
    document.getElementById('root')
  );
}

// if(window.__POWERED_BY_QIANKUN__) {
//   __webpack_public_path__ = window.__INJECTED_PUBLIC_PATH_BY_QIANKUN__;
// }

if(!window.__POWERED_BY_QIANKUN__) {
  render()
}

// 子组件的协议
export async function bootstrap(props){
  console.log('qiankun-react启动');
}

export async function mount(props){
  render()
}

export async function unmount(props){
  ReactDOM.unmountComponentAtNode(document.getElementById('root'))
}

```

src/App.js

```js
import React from 'react'
import logo from './logo.svg';
import './App.css';
import { BrowserRouter, Route, Link } from 'react-router-dom'

function App() {
  return (
    <BrowserRouter basename="/react">
      <Link to="/">首页</Link>
      <Link to="/about">关于页面</Link>
      <hr />
      <Route path="/" exact render={()=>(
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <p>
              Edit <code>src/App.js</code> and save to reload.
            </p>
            <a
              className="App-link"
              href="https://reactjs.org"
              target="_blank"
              rel="noopener noreferrer"
            >
              <h1>这是首页</h1>
            </a>
          </header>
        </div>
      )}>
      </Route>
      <Route path="/about" render={()=>(<h1>about页面</h1>)}></Route>
    </BrowserRouter>
  );
}

export default App;

```



## host

```shell
npm install webpack webpack-cli webpack-dev-server html-webpack-plugin babel-loader @babel/core @babel/preset-env @babel/preset-react style-loader css-loader --save-dev

npm install react react-dom --save
```



### package.json

```json
"scripts": {
    "build": "webpack",
    "start": "webpack serve"
  }
```

### webpack.config.js

```js
const  path = require('path')
let webpack = require('webpack')
let HtmlWebpackPlugin = require('html-webpack-plugin')
const ModuleFederationPlugin = require('webpack/lib/container/ModuleFederationPlugin')
module.exports = {
  mode: 'development',
  devtool: false,
  entry: './src/index.js',
  output: {
    publicPath: 'http://localhost:8081/',
  },
  devServer: {
    port: 8081
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-react',]
          },
        },
        exclude: /node_modules/,
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './public/index.html'
    }),
    new ModuleFederationPlugin({
      name: "host",
      remotes: {
        remote: "remoteVar@http://localhost:8080/remoteEntry.js",
      },
      shared: ['react', 'react-dom']
    })
  ]
}
```

### rc/index.js

```js
import('./bootstrap')
```

### src/bootstrap.js

```js
import React from 'react'
import ReactDom from 'react-dom'
import App from './App'
ReactDom.render(<App/>, document.getElementById('root'))
```

### rc/App.js

```js
import React from 'react'
import Slides from './Slides'
// import NewsList from './NewsList'
const RemoteNewsList = React.lazy(()=>import('remote/NewsList'))
const App = () => (
  <div>
    <h3>host组件Slides</h3>
    <Slides />
    <hr/>
    <h3>remote组件NewsList</h3>
    <React.Suspense fallback="Loading NewsList">
      <RemoteNewsList />
    </React.Suspense>
  </div>
)
export default App

```

### src/Slides.js

```js
import React from 'react'
const Slides = () => (
  <div>
    Slides
  </div>
)
export default Slides

```

### public/index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>host</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
```



## remote

```shell
npm install webpack webpack-cli webpack-dev-server html-webpack-plugin babel-loader @babel/core @babel/preset-env @babel/preset-react style-loader css-loader --save-dev

npm install react react-dom --save
```

### package.json

```js
"scripts": {
    "build": "webpack",
    "start": "webpack serve"
  },
```

### webpack.config.js

```js
const  path = require('path')
let webpack = require('webpack')
let HtmlWebpackPlugin = require('html-webpack-plugin')
const ModuleFederationPlugin = require('webpack/lib/container/ModuleFederationPlugin')
module.exports = {
  mode: 'development',
  devtool: false,
  entry: './src/index.js',
  output: {
    publicPath: 'http://localhost:8080/',
  },
  devServer: {
    port: 8080
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-react',]
          },
        },
        exclude: /node_modules/,
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './public/index.html'
    }),
    new ModuleFederationPlugin({
      name: "remoteVar", // 必传 输出的模块名。远程引用路径为 ${name}/${expose}
      filename: "remoteEntry.js", // 构建输出的文件名
      exposes: { // 被远程引用时可暴露的资源路径及其别名
        "./NewsList": "./src/NewsList",
      },
      shared: ['react', 'react-dom']
    }),
  ]
}
```

### rc/index.js

```js
import('./bootstrap')
```

### src/bootstrap.js

```js
import React from 'react'
import ReactDom from 'react-dom'
import App from './App'
ReactDom.render(<App/>, document.getElementById('root'))
```

### Src/App.js

```js
import React from 'react'
import NewsList from './NewsList'
const App = () => (
  <div>
    <h3>Remote组件NewsList</h3>
    <NewsList />
  </div>
)
export default App

```

### Src/NewsList.js

```js
import React from 'react'
const NewsList = () => (
  <div>
    NewsList
  </div>
)
export default NewsList

```

### Public/index.html

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>remote</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
```

