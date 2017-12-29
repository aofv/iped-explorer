<template>
  <div>
    <basic-info v-if="admissions" :admissions="admissions" />
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import BasicInfo from './Basic'

const components = {
  BasicInfo,
}

const methods = {
  getData() {
    this.loading = true

    const url = `/schools/${this.school.id}/admissions`
    ApiClient.get(url)
      .then(response => {
        this.admissions = response.data.data
        this.loading = false
      })
  },
}

export default {
  mounted() {
    this.getData()
  },

  props: {
    school: {},
  },

  data() {
    return {
      loading: true,
      admissions: null,
    }
  },

  methods: methods,
  components: components,
}
</script>
