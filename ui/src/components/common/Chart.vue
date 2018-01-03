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
        datasets: [
          {
            label: this.label,
            data: this.data,
            borderWidth: 5,
            fill: false,
            yAxisID: 'A'
          },
          {
            data: [100, 200, 150, 275],
            label: 'Line 2',
            borderWidth: 5,
            fill: false,
            yAxisID: 'B',
          }
        ] // END datasets
      }, // END data
      options: {
        scales: {
          yAxes: [
            { id: 'A', type: 'linear', position: 'right' },
            { id: 'B', type: 'linear', position: 'right' },
          ] // END yAxes
        } // END scales
      } // END options

    });
  },
}
</script>
