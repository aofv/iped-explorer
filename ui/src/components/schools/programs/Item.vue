<template>
  <tr v-if="show">
    <td>
      {{ program.title }}
    </td>
    <td>
      <span class="tag is-success" v-if="program.associate">
        Yes
      </span>
    </td>
    <td>
      <span class="tag is-success" v-if="program.bachelor">
        Yes
      </span>
    </td>
    <td>
      <span class="tag is-success" v-if="program.master">
        Yes
      </span>
    </td>
    <td>
      <span class="tag is-success" v-if="program.distance">
        Yes
      </span>
    </td>
  </tr>
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
