<template>
  <div class="box">
    <div class="columns">

      <!-- control -->
      <div class="column">
        <multi-select
          label="Control"
          v-model="searchCriteria.control"
          :options="controlOptions"
          ref="control"
          @input="updateCriteria"
        />
      </div>

      <!-- size -->
      <div class="column">
        <multi-select
          v-model="searchCriteria.size"
          :options="sizeOptions"
          label="Size"
          @input="updateCriteria"
        />
      </div>

      <!-- Highest award -->
      <div class="column">
        <multi-select
          v-model="searchCriteria.highestAward"
          :options="highestAwardOptions"
          label="Highest Award"
          @input="updateCriteria"
        />
      </div>

    </div>
  </div>
</template>

<script>
import { schoolControl } from '@/utils/Constants'
import { schoolSizes } from '@/utils/Constants'
import { highestAward } from '@/utils/Constants'
import DropDown from '@/components/inputs/DropDown'
import MultiSelect from '@/components/inputs/multiselect/MultiSelect'

const components = {
  DropDown,
  MultiSelect,
}

const computed = {
  controlOptions() { return schoolControl },
  sizeOptions() { return schoolSizes },
  highestAwardOptions() { return highestAward },
}

const methods = {
  updateCriteria(e) {
    let queryVals = []

    if( this.searchCriteria.control.length > 0 ) {
      queryVals.push(`control=${this.searchCriteria.control}`)
    }

    if(this.searchCriteria.size.length > 0) {
      queryVals.push(`size=${this.searchCriteria.size}`)
    }

    if(this.searchCriteria.highestAward.length > 0) {
      queryVals.push(`highest_award=${this.searchCriteria.highestAward}`)
    }

    this.$emit('updateSearchString', queryVals.join('&'))
  }
}

export default {

  data() {
    return {
      searchCriteria: {
        control: [],
        size: [],
        highestAward: [],
      },
    }
  },

  components: components,
  computed: computed,
  methods: methods,
}
</script>
