<template>
  <data-section title="Enrollments" @showToggle="onToggle">
    <div class="columns" v-if="enrollments">
      <!-- START col 1 -->
      <div class="column is-one-third">
        <data-listing
        label="Total Enrolled"
        :data="currentRecord.total"
        type="number"
        :series="enrollments.map( (obj) => { return {year: obj.year, value: obj.total} } )"
        :chartable="true"
        />
        <data-listing
        label="Total Male"
        :data="currentRecord.male"
        type="number"
        :series="enrollments.map( (obj) => { return {year: obj.year, value: obj.male} } )"
        :chartable="true"
        :aside="percentMale"
        />
        <data-listing
        label="Total Female"
        :data="currentRecord.female"
        type="number"
        :series="enrollments.map( (obj) => { return {year: obj.year, value: obj.female} } )"
        :chartable="true"
        :aside="percentFemale"
        />

      </div>
      <!-- END col 1 -->
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

    const url = `/schools/${this.school.id}/enrollments`
    ApiClient.get(url)
      .then(response => {
        this.enrollments = response.data.data
        this.loading = false
      })
  },

  onToggle(showing) {
    if(showing && !this.enrollments) {
      this.getData()
    }
  }
}

const computed = {
  ...mapGetters([
      'displayYear',
     ]),
    currentRecord() {
      return this.enrollments.find(i => i.year == this.displayYear)
    },

    percentFemale() {
      const record = this.currentRecord
      const total = record.total
      const female = record.female
      return `${Math.round((female / total) * 100)}%`
    },

    percentMale() {
      const record = this.currentRecord
      const total = record.total
      const male = record.male
      return `${Math.round((male / total) * 100)}%`
    }
}

export default {
  props: {
    school: {},
  },

  data() {
    return {
      loading: true,
      enrollments: null,
      show: false,
    }
  },

  methods: methods,
  components: components,
  computed: computed,
}
</script>
