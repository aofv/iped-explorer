import Vue from 'vue'
import Router from 'vue-router'

import Schools from '@/components/schools/Index'
import School from '@/components/schools/Show'

import Programs from '@/components/programs/Index'

Vue.use(Router)

const routes = [
  { path: '/schools', name: 'Schools', component: Schools },
  { path: '/schools/:school_id', name: 'school', component: School, children:
    []
  },

  { path: '/programs', name: 'programs', component: Programs },

  // Catch all
  { path: '*',  redirect: '/schools' },
]

export default new Router({
  routes: routes,
  mode: 'history',
  linkExactActiveClass: 'is-active',
  linkActiveClass: 'is-active',
})
