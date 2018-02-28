<template>
  <div id="app">

    <nav class="navbar is-dark ie-nav">
      <div class="navbar-brand">
        <p class="is-size-3">
          IPEDS Explorer
        </p>
      </div>

      <div class="navbar-item">
        <school-picker @select="onSelectSchool" />
      </div>
    </nav>

    <div class="container is-fluid">
      <router-view/>
    </div>
  </div>
</template>

<script>
import SchoolPicker from '@/components/common/SchoolPicker'

const components = {
  SchoolPicker,
}

const methods = {
  onSelectSchool(school) {
    this.$router.push({name: 'school', params: { school_id: school.id }})
  },
}

export default {
  components: components,
  methods: methods,
}
</script>

<style scoped lang="scss">
  nav.ie-nav {
    margin-bottom: 20px;

    .navbar-brand {
      padding-left: 10px;
    }
  }
</style>
