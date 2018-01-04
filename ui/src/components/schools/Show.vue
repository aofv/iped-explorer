<template>
  <div>
    <h1 class="is-size-4" v-if="school">
      {{ school.name }}
    </h1>

    <div class="chart">
      <chart />
    </div>

    <div v-if="school">
      <general-info :school="school" />
      <hr />
      <enrollment-info :school="school" />
      <hr />
      <finance-info :school="school" />
      <hr />
      <admissions-info :school="school" />
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

const components = {
  GeneralInfo,
  FinanceInfo,
  AdmissionsInfo,
  EnrollmentInfo,
  Chart,
}

const methods = {
  getSchool() {
    const url = `/schools/${this.$route.params.school_id}`
    ApiClient.get(url)
      .then(response => {
        this.school = response.data.data
        this.loading = false
      })
  }
}

export default {
  mounted() {
    this.getSchool()
  },

  data() {
    return {
      school: null,
      loading: true,
      chartSets: [],
    }
  },

  methods: methods,
  components: components,
}
</script>

<style scoped lang="scss">
  h1 {
    padding-bottom: 30px;
  }
</style>
