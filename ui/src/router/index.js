import Vue from 'vue'
import Router from 'vue-router'

import Schools from '@/components/schools/Index'
import School from '@/components/schools/Show'

Vue.use(Router)

const routes = [
  { path: '/schools', name: 'Schools', component: Schools },
  { path: '/schools/:school_id', component: School, children:
    []
  },
]

export default new Router({
  routes: routes,
  mode: 'history',
  linkExactActiveClass: 'is-active',
  linkActiveClass: 'is-active',
})
