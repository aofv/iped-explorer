<template>
  <div>
    <chart :data="chartData" :labels="chartLabels" label="Admissions Percent"/>
  </div>
</template>

<script>
import Chart from '@/components/common/Chart'

const components = {
  Chart,
}

const computed = {
  chartData() {
    return this.admissions.map( (i) => {
      return Math.round((i.admissions / i.applications) * 100)
    } ).reverse()
  },

  chartLabels() {
    return this.admissions.map( (i) => { return i.year } ).reverse()
  },
}

export default {
  props: {
    admissions: {}
  },

  computed: computed,
  components: components,
}
</script>
