<template>
  <div>
    <h2 class="title is-5" @click="onClick">
      {{ title }}
      <span class="is-size-6 has-text-grey">
        <i class="fa fa-chevron-up" v-if="show"></i>
        <i class="fa fa-chevron-down" v-if="!show"></i>
      </span>
    </h2>

    <div v-show="show || forceShow" class="is-size-6 contents">
      <slot />
    </div>

    <hr />
  </div>
</template>

<script>

const methods = {
  onClick() {
    this.show = !this.show
    this.$emit('showToggle', this.show)
  },
}

export default {
  props: {
    title: {},
    forceShow: { default: false },
  },

  data() {
    return {
      show: false,
    }
  },

  methods,
}
</script>

<style scoped lang="scss">
  .title {
    margin-bottom: 0;
    cursor: pointer;
  }

  hr {
    margin: 15px 0;
  }

  .contents {
    margin: 20px 0;
  }
</style>
