<template>
  <div class="columns">
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

const methods = {

}

const computed = {
  dataDisplay() {
    switch(this.type) {
      case 'text':
        return this.data;
      case 'currency':
        return numeral(this.data).format('($0,0.00a)')
      case 'number':
        return numeral(this.data).format('0,0')
      case 'percent':
        return numeral(this.data).format('0,0.0%')
    }
  },
}

export default {
  props: {
    label: {},
    data: {},
    aside: {},
    type: { default: 'text' }
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
