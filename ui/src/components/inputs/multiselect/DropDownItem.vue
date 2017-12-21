<template>
  <label class="checkbox dropdown-item">
    <input type="checkbox" ref="input" @change="onChange">
    {{ item[1] }}
  </label>
</template>

<script>

const methods = {
  onChange() {
    const params = {
      item: this.item[0],
      value: this.$refs.input.checked
    }
    
    this.$emit('changed', params)
  }
}

export default {
  props: {
    item: {},
  },

  methods: methods,
}
</script>
