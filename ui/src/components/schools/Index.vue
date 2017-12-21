<template>
  <div>
    <search-criteria @updateSearchString="getSchools" />
    <school-table :schools="schools" />
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import SchoolTable from './Table'
import SearchCriteria from './SearchCriteria'

const components = {
  SchoolTable,
  SearchCriteria,
}

const methods = {
  getSchools(queryString) {
    ApiClient.get(`/schools?${queryString || ''}`)
      .then(response => {
        this.schools = response.data.data
        this.loading = false
      })
  }
}

const computed = {

}

export default {
  mounted() {
    this.getSchools()
  },

  data() {
    return {
      loading: true,
      schools: null,
    }
  },

  methods: methods,
  components: components,
  computed: computed,
}
</script>
