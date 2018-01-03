<template>
  <div class="school-search">
    <div class="field">
      <input type="text" class="input" placeholder="Quick Search" ref="query" @keyup="onKeyUp" />
    </div>

    <!-- START results -->
    <div class="card results" v-if="schools">
      <ul>
        <li v-for="school in schools" @click="onSelectSchool(school)">
          {{ school.name }}
          <span class="has-text-grey is-size-7">
            {{ school.address.city }}, {{ school.address.state }}
          </span>
        </li>
      </ul>
    </div>
    <!-- END results -->
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'

const DEBOUNCE_TIMEOUT = 250

const methods = {
  onKeyUp() {
    if(this.searchTimeout) {
      clearTimeout(this.searchTimeout)
    }

    this.searchTimeout = setTimeout(this.doSearch, DEBOUNCE_TIMEOUT)
  },

  doSearch() {
    const query = this.$refs.query.value
    if(query) {
      const url = `/schools?name=${query}`

      ApiClient.get(url)
      .then(response => {
        this.schools = response.data.data
      })
    } else {
      this.schools = null
    }

  },

  onSelectSchool(school) {
    this.$emit('select', school)
    this.schools = null
    this.$refs.query.value = ''
  },
}

export default {
  data() {
    return {
      searchTimout: null,
      schools: null,
    }
  },

  methods: methods,
}
</script>

<style scoped lang="scss">
  .school-search {
    position: relative;


    .results {
      position: absolute;
      top: 37px;
      width: 100%;
      z-index: 10;

      li {
        padding: 3px;
        cursor: pointer;

        &:hover {
          background-color: #CECECE;
        }
      }
    }
  }
</style>
