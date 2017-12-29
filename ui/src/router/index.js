import Vue from 'vue'
import Router from 'vue-router'

import Schools from '@/components/schools/Index'
import School from '@/components/schools/Show'

import Finances from '@/components/schools/finances/Show'
import SchoolRevenue from '@/components/schools/finances/RevenueChart'
import TuitionRevenue from '@/components/schools/finances/TuitionRevenueChart'
import DiscountChart from '@/components/schools/finances/DiscountChart'
import Admissions from '@/components/schools/admissions/Show'

import GeneralSchoolInformation from '@/components/schools/general/Show'

Vue.use(Router)

const routes = [
  { path: '/schools', name: 'Schools', component: Schools },
  { path: '/schools/:school_id', component: School, children: [
    { path: 'general', name: 'SchoolGeneral', component: GeneralSchoolInformation },

    { path: 'finances', name: 'SchoolFinances', component: Finances, children: [
      { path: 'revenue', name: 'school.finances.revenue', component: SchoolRevenue },
      { path: 'tuition', name: 'school.finances.tuition', component: TuitionRevenue },
      { path: 'discounts', name: 'school.finances.discounts', component: DiscountChart },
    ] },

    { path: 'admissions', name: 'school.admissions', component: Admissions, children: [

    ] },

  ] },
]

export default new Router({
  routes: routes,
  mode: 'history',
  linkExactActiveClass: 'is-active',
  linkActiveClass: 'is-active',
})
