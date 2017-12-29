<template>
  <div>
    <chart :data="chartData" :labels="chartLabels" label="Tuition Revenue"/>
  </div>
</template>

<script>
import Chart from '@/components/common/Chart'

const components = {
  Chart,
}

const computed = {
  chartData() {
    return this.finances.map( (i) => { return i.tuition_revenue } ).reverse()
  },

  chartLabels() {
    return this.finances.map( (i) => { return i.year } ).reverse()
  },
}

export default {
  props: {
    finances: {}
  },

  computed: computed,
  components: components,
}
</script>
