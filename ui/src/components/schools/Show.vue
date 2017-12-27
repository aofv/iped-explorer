<template>
  <div>
    <h1 class="is-size-4" v-if="school">
      {{ school.name }}
    </h1>
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'

const methods = {
  getSchool() {
    const url = `/schools/${this.$route.params.school_id}`
    ApiClient.get(url)
      .then(response => {
        this.school = response.data.data
        this.loading = false
      })
  }
}

export default {
  mounted() {
    this.getSchool()
  },

  data() {
    return {
      school: null,
      loading: true,
    }
  },

  methods: methods,
}
</script>
