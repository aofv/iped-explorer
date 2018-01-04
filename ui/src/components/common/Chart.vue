<template>
  <div>
    <canvas ref="chart"  />
  </div>
</template>

<script>
import Chart from 'chart.js'

const colors = [
  '#a93226',
  '#884ea0',
  '#2471a3',
  '#17a589',
  '#d4ac0d',
  '#ba4a00',
  '#839192',
  '#273746',
]

const methods = {
  drawChart() {
    const ctx = this.$refs.chart.getContext('2d')

    if(this.chart) {
      this.chart.destroy()
    }

    this.chart = new Chart(ctx, {
      type: this.type,
      data: {
        labels: this.xAxisYears,
        datasets: this.dataSeries,
      }, // END data
      options: {
        scales: {
          yAxes:  this.yAxes,
          xAxes: {
            autoSkip: true,
          }
        } // END scales
      } // END options
    }); // END chart

  } // END drawchart
}

const computed = {
  dataSets() {
    return this.$store.state.chartFields
  },

  dataSeries() {
    let dataSets = []
    let colorIndex = 0;

    for(let newSet of this.$store.state.chartFields) {

      // In case there are blanks, push null values onto the series
      // to properly offset the chart
      let dataArray = []
      for(let year of this.xAxisYears) {
        const itemToAdd = newSet.data.find(i => i.year == year)
        if(itemToAdd)
          dataArray.push(itemToAdd.value)
        else
          dataArray.push(null)
      }


      const obj = {
        label: newSet.field,
        data: dataArray,
        borderWidth: 3,
        borderColor: colors[colorIndex],
        yAxisID: newSet.field,
        fill: false,
      }
      colorIndex++;
      dataSets.push(obj)
    }


    return dataSets
  },

  yAxes() {
    let axes = []

    for(let newAxis of this.$store.state.chartFields) {
      const obj = {
        id: newAxis.field,
        type: 'linear',
        position: 'right'
      }

      axes.push(obj)
    }

    return axes
  },

  xAxisYears() {
    let allYears = []

    if(!this.dataSets[0]) {
      return []
    }

    // Build a unique list of years
    for(let set of this.dataSets) {
      for(let datum of set.data) {
        if(allYears.indexOf(datum.year) < 0)
          allYears.push(datum.year)
      }
    }

    // Build an array of all applicable years in the data sets
    const minYear = Math.min(...allYears)
    const maxYear = Math.max(...allYears)

    return [...Array(maxYear - minYear + 1).keys()].map( (i) => { return i + minYear} )
  },
}

export default {
  props: {
    type: { default: 'line' },
  },

  mounted() {
    this.drawChart();
  },

  data() {
    return {
      currentChart: {},
    }
  },

  watch: {
    dataSets() {
      this.drawChart()
    }
  },

  methods: methods,
  computed: computed,
}
</script>
