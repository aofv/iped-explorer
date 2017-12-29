<template>
  <div>
    <basic-finances :finances="finances" v-if="finances" />

    <router-view :finances="finances" v-if="finances" />
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import DataListing from '@/components/common/DataListing'
import BasicFinances from './Basic'

const components = {
  DataListing,
  BasicFinances,
}

const methods = {
  getFinances() {
    this.loading = true

    const url = `/schools/${this.school.id}/finances`
    ApiClient.get(url)
      .then(response => {
        this.finances = response.data.data
        this.loading = false
      })
  },
}

const computed = {

}

export default {
  mounted() {
    this.getFinances()
  },

  props: {
    school: {},
  },

  data() {
    return {
      finances: null,
      loading: true,
    }
  },

  components: components,
  methods: methods,
  computed: computed,
}
</script>
