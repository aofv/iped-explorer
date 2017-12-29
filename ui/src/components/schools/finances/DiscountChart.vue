<template>
  <div>
    <chart :data="chartData" :labels="chartLabels" label="Total Discounts"/>
  </div>
</template>

<script>
import Chart from '@/components/common/Chart'

const components = {
  Chart,
}

const computed = {
  chartData() {
    return this.finances.map( (i) => { return i.total_discounts } ).reverse()
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
