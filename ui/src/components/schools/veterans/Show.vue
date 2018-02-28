<template>
  <data-section title="Veterans" @showToggle="onToggle">
    <div class="columns" v-if="veterans">

      <!-- START col 1 -->
      <div class="column">
        <data-listing
          label="Total"
          :data="currentRecord.total_students"
          type="number"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.total_students} } )"
          :chartable="true"
        />
        <data-listing
          label="Revenue"
          :data="currentRecord.total_benefits"
          type="currency"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.total_benefits} } )"
          :chartable="true"
        />
        <data-listing
          label="Avg. Per Student"
          :data="currentRecord.average_benefits"
          type="number"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.average_benefits} } )"
          :chartable="true"
        />
      </div>
      <!-- END col 1 -->

      <!-- START col 2 -->
      <div class="column">
        <data-listing
          label="Undergraduate"
          :data="currentRecord.total_undergraduate_students"
          type="number"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.total_undergraduate_students} } )"
          :chartable="true"
        />
        <data-listing
          label="Revenue"
          :data="currentRecord.total_undergraduate_benefits"
          type="currency"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.total_undergraduate_benefits} } )"
          :chartable="true"
        />
        <data-listing
          label="Avg. Per Student"
          :data="currentRecord.average_undergraduate_benefits"
          type="number"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.average_undergraduate_benefits} } )"
          :chartable="true"
        />
      </div>
      <!-- END col 2 -->

      <!-- START col 3 -->
      <div class="column">
        <data-listing
          label="Graduate"
          :data="currentRecord.total_graduate_students"
          type="number"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.total_graduate_students} } )"
          :chartable="true"
        />
        <data-listing
          label="Revenue"
          :data="currentRecord.total_graduate_benefits"
          type="currency"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.total_graduate_benefits} } )"
          :chartable="true"
        />
        <data-listing
          label="Avg. Per Student"
          :data="currentRecord.average_graduate_benefits"
          type="number"
          :series="veterans.map( (obj) => { return {year: obj.year, value: obj.average_graduate_benefits} } )"
          :chartable="true"
        />
      </div>
      <!-- END col 3 -->

    </div>
  </data-section>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import DataListing from '@/components/common/DataListing'
import { mapGetters } from 'vuex'
import DataSection from '@/components/common/DataSection'

const components = {
  DataListing,
  DataSection,
}

const methods = {
  getData() {
    this.loading = true

    const url = `/schools/${this.school.id}/veterans`
    ApiClient.get(url)
      .then(response => {
        this.veterans = response.data.data
        this.loading = false
      })
  },

  onToggle(showing) {
    if(showing && !this.veterans) {
      this.getData()
    }
  }
}

const computed = {
  ...mapGetters([
      'displayYear',
  ]),
  currentRecord() {
    return this.veterans.find(i => i.year == this.displayYear)
  },
}

export default {
  props: {
    school: {},
  },

  data() {
    return {
      veterans: null,
      loading: true,
    }
  },

  methods: methods,
  components: components,
  computed: computed,
}
</script>
