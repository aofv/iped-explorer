<template>
  <div class="box">
    <div class="columns">
      <!-- show basic button -->
      <div class="column is-narrow">
        <button class="button is-white" @click="showBasic = !showBasic" :class="{'is-active': showBasic}">
          <span class="icon is-small">
            <i class="fa fa-info"></i>
          </span>
          <span>Basic</span>
        </button>
      </div>

      <!-- show sport button -->
      <div class="column is-narrow">
        <button class="button is-white" @click="showSport = !showSport" :class="{'is-active': showSport}">
          <span class="icon is-small">
            <i class="fa fa-futbol-o"></i>
          </span>
          <span>Sports</span>
        </button>
      </div>
    </div>

    <!-- Basic -->
    <div class="columns" v-if="this.showBasic">
      <!-- state -->
      <div class="column">
        <multi-select
          label="State"
          v-model="searchCriteria.state"
          :options="stateOptions"
          @input="updateCriteria"
        />
      </div>

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

    <!-- Sports -->
    <div class="columns" v-if="showSport">

      <!-- Sport -->
      <div class="column">
        <multi-select
          v-model="searchCriteria.sports"
          :options="sportOptions"
          label="Sports"
          @input="updateCriteria"
        />
      </div>

      <!-- Affiliation -->
      <div class="column">
        <multi-select
          v-model="searchCriteria.affiliation"
          :options="affiliationOptions"
          label="Affiliation"
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
import { states } from '@/utils/Constants'
import { sports } from '@/utils/Constants'
import { affiliations } from '@/utils/Constants'
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
  stateOptions() { return states },
  sportOptions() { return sports },
  affiliationOptions() { return affiliations },
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

    if(this.searchCriteria.state.length > 0) {
      queryVals.push(`state=${this.searchCriteria.state}`)
    }

    if(this.searchCriteria.sports.length > 0) {
      queryVals.push(`sport=${this.searchCriteria.sports}`)
    }

    if(this.searchCriteria.affiliation.length > 0) {
      queryVals.push(`affiliation=${this.searchCriteria.affiliation}`)
    }

    this.$emit('input', queryVals.join('&'))
  }
}

export default {

  data() {
    return {
      searchCriteria: {
        control: [],
        size: [],
        highestAward: [],
        state: [],
        sports: [],
        affiliation: [],
      },
      showBasic: false,
      showSport: false,
    }
  },

  components: components,
  computed: computed,
  methods: methods,
}
</script>
