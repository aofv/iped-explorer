<template>
  <div>
    <search-criteria v-model="searchString" @input="getSchools" />

    <p v-if="schools">
      Showing {{ recordSetStart }} - {{ recordSetEnd }}
       of {{ meta.total_records }}
       <button
          class="button is-small"
          :disabled="this.meta.current_page == 1"
          @click="previousPage">
            &lt;Previous Page
        </button>
       <button
          class="button is-small"
          :disabled="this.meta.current_page == this.meta.total_pages"
          @click="nextPage">
            Next Page&gt;
        </button>
     </p>

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
  getSchools() {
    let url = '/schools?'
    if(this.searchString) {
      url += this.searchString
    }
    url += `&current_page=${this.currentPage}`

    ApiClient.get(url)
      .then(response => {
        this.schools = response.data.data
        this.loading = false
        this.meta = response.data.meta
      })
  },

  nextPage() {
    this.currentPage = this.currentPage + 1
    this.getSchools()
  },

  previousPage() {
    this.currentPage = this.currentPage - 1
    this.getSchools()
  },
}

const computed = {
  recordSetStart() {
    return (this.meta.current_page * this.meta.records_per_page) - this.meta.records_per_page + 1
  },

  recordSetEnd() {
    return (this.meta.current_page * this.meta.records_per_page)
  },
}

export default {
  mounted() {
    this.getSchools()
  },

  data() {
    return {
      loading: true,
      schools: null,
      meta: null,
      searchString: '',
      currentPage: 1,
    }
  },

  methods: methods,
  components: components,
  computed: computed,
}
</script>
