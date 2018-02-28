<template>
  <div v-if="school">
    <nav class="breadcrumb" aria-label="breadcrumbs">
      <ul>
        <li>
          <router-link :to="{name: 'Schools'}">
            Search
          </router-link>
        </li>
        <li class="is-active">
          <a href="#" aria-current="page">{{ school.name }}</a>
        </li>
      </ul>
    </nav>

    <general-info :school="school" v-if="school" />
    <cost-info :school="school" v-if="school" />
    <degree-programs :school="school" v-if="school" />
    <sport-teams :school="school" v-if="school" />
    <enrollment-info :school="school" v-if="school" />
    <veteran-info :school="school" v-if="school" />
    <va-info :school="school" v-if="school" />
    <finance-info :school="school" v-if="school" />
    <admissions-info :school="school" v-if="school" />

    <div class="chart">
      <chart />
    </div>

  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import GeneralInfo from './general/Show'
import FinanceInfo from './finances/Show'
import AdmissionsInfo from './admissions/Show'
import EnrollmentInfo from './enrollments/Show'
import Chart from '@/components/common/Chart'
import VeteranInfo from './veterans/Show'
import CostInfo from './costs/Show'
import VaInfo from './va/Show'
import DegreePrograms from './programs/Show'
import SportTeams from './teams/Show'

const components = {
  GeneralInfo,
  FinanceInfo,
  AdmissionsInfo,
  EnrollmentInfo,
  Chart,
  VeteranInfo,
  CostInfo,
  VaInfo,
  DegreePrograms,
  SportTeams,
}

const methods = {
  getSchool() {
    const url = `/schools/${this.schoolId}`
    ApiClient.get(url)
      .then(response => {
        this.school = response.data.data
        this.loading = false
      })
  }
}

export default {
  mounted() {
    this.schoolId = this.$route.params.school_id
    this.getSchool()
  },

  data() {
    return {
      schoolId: null,
      school: null,
      loading: true,
      chartSets: [],
    }
  },

  beforeRouteUpdate(to, from, next) {
    this.schoolId = to.params.school_id
    this.school = null
    this.getSchool()
    next()
  },

  methods: methods,
  components: components,
}
</script>

<style scoped lang="scss">
  .chart {
    padding-top: 50px;
    min-height: 565px;
  }
  h1 {
    padding-bottom: 30px;
  }
</style>
