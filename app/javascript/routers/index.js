import Vue from 'vue'
import Router from 'vue-router'
import Signin from '../components/auth/Signin.vue'
import Signup from '../components/auth/Signup.vue'
import Artists from '../components/artists/Artists.vue'
import Records from '../components/records/Records.vue'
import Profile from '../components/profile/Profile.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/artists',
      name: 'Artists',
      component: Artists
    },
    {
      path: '/records',
      name: 'Records',
      component: Records
    },
    {
      path: '/profile',
      name: 'Profile',
      component: Profile
    },
    {
      path: '/',
      name: 'Signin',
      component: Signin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    }
  ]
})