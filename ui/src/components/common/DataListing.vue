<template>
  <div class="columns">
    <div class="column has-text-weight-bold has-text-right">
      {{ label }}
    </div>
    <div class="column">
      {{ data }}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    label: {},
    data: {},
  }
}
</script>

<style scoped lang="scss">
  .columns {
    .column {
      padding: 5px 10px 0px 5px;
    }
  }
</style>
