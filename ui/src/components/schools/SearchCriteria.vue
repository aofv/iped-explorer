<template>
  <div>
    <drop-down
      label="Control"
      v-model="searchCriteria.control"
      :options="controlOptions"
      ref="control"
      @input="updateCriteria"
      :includeBlank="true" />
  </div>
</template>

<script>
import { schoolControl } from '@/utils/Constants'
import DropDown from '@/components/inputs/DropDown'

const components = {
  DropDown,
}

const computed = {
  controlOptions() { return schoolControl }
}

const methods = {
  updateCriteria(e) {
    let queryString = ''

    if( this.searchCriteria.control ) { queryString += `control=${this.searchCriteria.control}` }

    this.$emit('updateSearchString', queryString)
  }
}

export default {

  data() {
    return {
      searchCriteria: {
        control: null,
      },
    }
  },

  components: components,
  computed: computed,
  methods: methods,
}
</script>
