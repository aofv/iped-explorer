import Vue from 'vue'
import Router from 'vue-router'

import Schools from '@/components/schools/Index'
import School from '@/components/schools/Show'

import Finances from '@/components/schools/finances/Show'
import SchoolRevenue from '@/components/schools/finances/RevenueChart'
import TuitionRevenue from '@/components/schools/finances/TuitionRevenueChart'
import DiscountChart from '@/components/schools/finances/DiscountChart'

import Admissions from '@/components/schools/admissions/Show'
import ApplicationsChart from '@/components/schools/admissions/ApplicationsChart'
import AdmissionsChart from '@/components/schools/admissions/AdmissionsChart'
import AdmissionsPercentChart from '@/components/schools/admissions/AdmissionsPercentChart'

import GeneralSchoolInformation from '@/components/schools/general/Show'

Vue.use(Router)

const routes = [
  { path: '/schools', name: 'Schools', component: Schools },
  { path: '/schools/:school_id', component: School, children: [
    { path: 'general', name: 'school', component: GeneralSchoolInformation },

    { path: 'finances', name: 'SchoolFinances', component: Finances, children: [
      { path: 'revenue', name: 'school.finances.revenue', component: SchoolRevenue },
      { path: 'tuition', name: 'school.finances.tuition', component: TuitionRevenue },
      { path: 'discounts', name: 'school.finances.discounts', component: DiscountChart },
    ] },

    { path: 'admissions', name: 'school.admissions', component: Admissions, children: [
      { path: 'applications', name: 'school.admissions.applications', component: ApplicationsChart },
      { path: 'admissions', name: 'school.admissions.admissions', component: AdmissionsChart },
      { path: 'admissions-percent', name: 'school.admissions.admissionsPercent', component: AdmissionsPercentChart },
    ] },

  ] },
]

export default new Router({
  routes: routes,
  mode: 'history',
  linkExactActiveClass: 'is-active',
  linkActiveClass: 'is-active',
})
