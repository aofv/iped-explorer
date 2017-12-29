<template>
  <div class="columns">
    <div class="column has-text-weight-bold has-text-right">
      {{ label }}
    </div>
    <div class="column">
      {{ data }}
      <span class="has-text-grey is-size-7" v-if="aside">
        {{ aside }}
      </span>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    label: {},
    data: {},
    aside: {},
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
