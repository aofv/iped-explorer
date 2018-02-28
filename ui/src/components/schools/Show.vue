<template>
  <div>
    <h1 class="is-size-4" v-if="school">
      {{ school.name }}
    </h1>

    <general-info :school="school" v-if="school" />
    <cost-info :school="school" v-if="school" />
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

const components = {
  GeneralInfo,
  FinanceInfo,
  AdmissionsInfo,
  EnrollmentInfo,
  Chart,
  VeteranInfo,
  CostInfo,
  VaInfo,
}

const methods = {
  getSchool() {
    const url = `/schools/${this.schoolId}`
    console.log(url)
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
