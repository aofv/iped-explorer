<template>
  <data-section title="Degree Programs" @showToggle="onToggle">
    <div class="columns">
      <div class="column content">
        <input type="text" class="input" placeholder="Filter Degree Programs" @keyup="onFilter" ref="filter" />
        <table class="table is-hoverable is-size-7">
          <thead>
            <tr>
              <th>Program</th>
              <th>Associates Degree</th>
              <th>Bachelors Degree</th>
              <th>Masters Degree</th>
              <th>Online</th>
            </tr>
          </thead>
          <tbody>
            <degree-program-item
              v-for="program in degreePrograms"
              :key="program.id"
              :program="program"
              :filter="filter"
            />
          </tbody>
        </table>
      </div>
    </div>
  </data-section>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import DataListing from '@/components/common/DataListing'
import { mapGetters } from 'vuex'
import DataSection from '@/components/common/DataSection'
import DegreeProgramItem from './Item'

const components = {
  DataListing,
  DataSection,
  DegreeProgramItem,
}

const methods = {
  getData() {
    ApiClient.get(`/schools/${this.school.id}/degree_programs`)
      .then(response => {
        this.degreePrograms = response.data.data
      })
  },

  onToggle(showing) {
    if(showing && !this.degreePrograms) {
      this.getData()
    }
  },

  onFilter() {
    this.filter = new RegExp(this.$refs.filter.value, 'gi')
  }
}

const computed = {

}

export default {
  props: {
    school: {},
  },

  data() {
    return {
      degreePrograms: null,
      filter: null,
    }
  },

  components,
  methods,
  computed,
}
</script>
