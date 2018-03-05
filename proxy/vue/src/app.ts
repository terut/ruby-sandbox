import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const Home = { template: '<div>Hello world! Vue!!</div>' }
const Foo = { template: '<div>Vue Foo!!</div>' }
const About = { template: '<div>Vue About!!</div>' }

const routes = [
  { path: '/vue', component: Home },
  { path: '/vue/foo', component: Foo },
  { path: '/about', component: About }
]

const router = new VueRouter({
  mode: 'history',
  routes: routes
})

let app = new Vue({
  router
}).$mount('#app')
