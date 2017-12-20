import Vue from 'vue'
import Router from 'vue-router'

import Schools from '@/components/schools/Index'

Vue.use(Router)

const routes = [
  { path: '/schools', name: 'Schools', component: Schools },
]

export default new Router({
  routes: routes,
  mode: 'history',
  linkExactActiveClass: 'is-active',
})
