import Vue from 'vue'
import Router from 'vue-router'

import Schools from '@/components/schools/Index'
import School from '@/components/schools/Show'

import Finances from '@/components/schools/finances/Show'
import SchoolRevenue from '@/components/schools/finances/RevenueChart'

import GeneralSchoolInformation from '@/components/schools/general/Show'

Vue.use(Router)

const routes = [
  { path: '/schools', name: 'Schools', component: Schools },
  { path: '/schools/:school_id', component: School, children: [
    { path: 'general', name: 'SchoolGeneral', component: GeneralSchoolInformation },

    { path: 'finances', name: 'SchoolFinances', component: Finances, children: [
      { path: 'revenue', name: 'school.finances.revenue', component: SchoolRevenue },
    ] },

  ] },
]

export default new Router({
  routes: routes,
  mode: 'history',
  linkExactActiveClass: 'is-active',
  linkActiveClass: 'is-active',
})
