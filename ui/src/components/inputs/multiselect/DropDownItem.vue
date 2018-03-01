<template>
  <label class="checkbox dropdown-item" :class="{'is-active': checked}">
    <input type="checkbox" ref="input" @change="onChange" v-model="checked">
    {{ item[1] }}
  </label>
</template>

<script>
const methods = {
  onChange() {
    const params = {
      item: this.item[0],
      value: this.checked
    }

    this.$emit('changed', params)
  }
}

export default {
  props: {
    item: {},
  },

  data() {
    return {
      checked: false,
    }
  },

  methods,
}
</script>

<style scoped lang="scss">
  .is-active {
    background-color: hsl(171, 100%, 41%);
    color: #FFF;
    transition: all 300ms linear;
  }
</style>
