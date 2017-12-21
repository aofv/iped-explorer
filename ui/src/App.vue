<template>
  <div id="app">

    <nav class="navbar is-dark ie-nav">
      <div class="navbar-brand">
        <p class="is-size-3">
          IPEDS Explorer
        </p>
      </div>
    </nav>

    <div class="container is-fluid">
      <router-view/>
    </div>
  </div>
</template>

<script>
export default {

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
