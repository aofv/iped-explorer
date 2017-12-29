<template>
  <canvas ref="chart" />
</template>

<script>
import Chart from 'chart.js'

export default {
  props: {
    type: { default: 'line' },
    label: {},
    labels: {},
    data: {},
  },

  mounted() {
    const ctx = this.$refs.chart.getContext('2d')

    const myChart = new Chart(ctx, {
      type: this.type,
      data: {
        labels: this.labels,
        datasets: [{
          label: this.label,
          data: this.data,
          borderWidth: 1
        }]
      },
    });
  },
}
</script>
