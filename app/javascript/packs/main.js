import Vue from 'vue'
import App from '../App.vue'
import router from '../routers'
import VueAxios from 'vue-axios'
import { plainAxiosInstance, securedAxiosInstance } from '../api/axios'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))

  Vue.use(VueAxios, {
    secured: securedAxiosInstance,
    plain: plainAxiosInstance
  })

  const app = new Vue({
    router,
    el,
    plainAxiosInstance,
    securedAxiosInstance,
    render: h => h(App)
  })

  console.log(app)
})
