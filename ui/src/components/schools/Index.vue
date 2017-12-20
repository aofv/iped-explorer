<template>
  <div>
    <school-table :schools="schools" v-if="schools" />
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import SchoolTable from './Table'

const components = {
  SchoolTable,
}

const methods = {
  getSchools() {
    ApiClient.get('/schools')
      .then(response => {
        this.loading = false
        this.schools = response.data.data
      })
  },
}

export default {
  mounted() {
    this.getSchools()
  },

  data() {
    return {
      schools: null,
      loading: true,
    }
  },

  methods: methods,
  components: components,
}
</script>
