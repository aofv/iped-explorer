<template>
  <div class="select">
    <select @change="onChange" ref="select">
      <option v-if="includeBlank"></option>
      <option
        v-for="option in options" :value="option[0]">
        {{ option[1] }}
      </option>
    </select>
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
  },

  methods: methods,
}
</script>
