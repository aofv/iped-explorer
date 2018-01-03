<template>
  <div class="columns" @click="onClick">
    <div class="column has-text-weight-bold has-text-right">
      {{ label }}
    </div>
    <div class="column">
      {{ dataDisplay }}
      <span class="has-text-grey is-size-7" v-if="aside">
        {{ aside }}
      </span>
    </div>
  </div>
</template>

<script>
import numeral from 'numeral'
import { mapActions } from 'vuex'

const methods = {
  ...mapActions(['toggleChartField']),
  onClick() {
    if(this.chartable) {
      this.toggleChartField({
        field: this.label,
        data: this.series,
      })
    }
  },
}

const computed = {
  dataDisplay() {
    switch(this.type) {
      case 'text':
        return this.currentDatum;
      case 'currency':
        return numeral(this.currentDatum).format('($0,0.00a)')
      case 'number':
        return numeral(this.currentDatum).format('0,0')
      case 'percent':
        return numeral(this.currentDatum).format('0,0.0%')
    }
  },

  currentDatum() {
    if(!this.series)
      return this.data

    return this.series.find((i) => {
      return i.year == this.$store.state.displayYear }
    ).value
  },
}

export default {
  props: {
    label: {},
    data: {},
    aside: {},
    type: { default: 'text' },
    series: {},
    chartable: { default: false }
  },

  methods: methods,
  computed: computed,
}
</script>

<style scoped lang="scss">
  .columns {
    .column {
      padding: 5px 10px 0px 5px;
    }
  }
</style>
