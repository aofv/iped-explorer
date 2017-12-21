<template>
  <div>
    <label v-if="label">{{ label }}</label>
    <div class="select is-small">
      <select @change="onChange" ref="select">
        <option v-if="includeBlank"></option>
        <option
          v-for="option in options" :value="option[0]">
          {{ option[1] }}
        </option>
      </select>
    </div>
  </div>
</template>

<script>

const methods = {
  onChange() {
    this.$emit('input', this.$refs.select.value)
  }
}

export default {
  props: {
    value: {},
    options: {},
    includeBlank: { default: false },
    label: { default: null },
  },

  methods: methods,
}
</script>

<style scoped lang="scss">
  label {
    display: block;
  }
</style>
