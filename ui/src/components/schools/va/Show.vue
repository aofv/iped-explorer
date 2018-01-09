<template>
  <data-section title="Veteran Benefits" v-if="bah">
    <div class="columns">

      <!-- START col 1 -->
      <div class="column is-one-third">
        <data-listing label="BAH" :data="bah.e05_with_deps" type="number" />
      </div>
      <!-- END col 1 -->

    </div>
  </data-section>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import DataListing from '@/components/common/DataListing'
import DataSection from '@/components/common/DataSection'

const components = {
  DataListing,
  DataSection,
}

const methods = {
  getData() {
    this.loading = true

    const url = `/schools/${this.school.id}/housing_allowance`
    ApiClient.get(url)
      .then(response =>{
        this.bah = response.data.data
        this.loading = false
      })
  },
}

const computed = {

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
      loading: false,
      bah: null,
      currentBahRank: 'e04',
    }
  },

  methods,
  components,
  computed,
}
</script>
