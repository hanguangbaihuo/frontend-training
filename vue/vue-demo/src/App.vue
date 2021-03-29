<!--
 * @Author: 明华
 * @Date: 2021-03-24 14:30:23
 * @LastEditors: 明华
 * @LastEditTime: 2021-03-24 14:57:18
 * @Description: 
 * @FilePath: /frontend-training/vue/vue-demo/src/App.vue
-->
<template>
  <img alt="Vue logo" src="./assets/logo.png" />
  <HelloWorld msg="Welcome to Your Vue.js App" />
  <div class="counter">Counter: {{ counter }}</div>
  <div v-bind:title="message">鼠标悬停几秒查看绑定信息</div>
  <p>{{ hello }}</p>
  <button v-on:click="reverseString">反转字符串</button>
  <p>{{ message }}</p>
  <input v-model="message" />
  <p v-if="seen">现在你看到我了</p>
  <ol>
    <li v-for="todo in todos" v-bind:key="todo.text" v-bind:title='todo.text'>
      {{ todo.text }}
    </li>
  </ol>
</template>

<script>
import HelloWorld from "./components/HelloWorld.vue";

export default {
  name: "App",
  components: {
    HelloWorld,
  },
  data() {
    return {
      counter: 0,
      message: "you loaded this page on " + new Date().toLocaleString(),
      hello: "hello vue.js!",
      seen: true,
      todos: [
        { text: "Learn JavaScript 11111111" },
        { text: "Learn Vue" },
        { text: "Build something awesome" },
      ],
    };
  },
  mounted() {
    setInterval(() => {
      this.counter++;
    }, 1000);
  },
  methods: {
    reverseString() {
      this.hello = this.hello.split("").reverse().join("");
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
