<template>
  <li v-if="show">
    {{ program.title }}
  </li>
</template>

<script>

const computed = {
  show() {
    if(this.filter) {
      return this.filter.test(this.program.title)
    }

    return true
  }
}

export default {
  props: {
    program: {},
    filter: { default: null },
  },

  computed,
}
</script>
