<template>
  <div>
    <h1 class="is-size-4" v-if="school">
      {{ school.name }}
    </h1>
    <div class="columns">
      <div class="column is-narrow">
        <side-nav />
      </div>
      <div class="column">
        <router-view :school="school" v-if="school" />
      </div>
    </div>
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import SideNav from './SideNav'

const components = {
  SideNav,
}

const methods = {
  getSchool() {
    const url = `/schools/${this.$route.params.school_id}`
    ApiClient.get(url)
      .then(response => {
        this.school = response.data.data
        this.loading = false
      })
  }
}

export default {
  mounted() {
    this.getSchool()
  },

  data() {
    return {
      school: null,
      loading: true,
    }
  },

  methods: methods,
  components: components,
}
</script>

<style scoped lang="scss">
  h1 {
    padding-bottom: 30px;
  }
</style>
