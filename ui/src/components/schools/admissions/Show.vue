<template>
  <data-section title="Admissions" @showToggle="onToggle">
    <div class="columns" v-if="admissions">
      <div class="column is-one-third">
        <data-listing
          label="Admissions"
          :data="mostRecent.admissions"
          :aside="admissionsPercent"
          type="number"
          :series="admissions.map( (obj) => { return {year: obj.year, value: obj.admissions} } )"
          chartable="true"
        />
        <data-listing
          label="Male Admissions"
          :data="mostRecent.admissions_male"
          :aside="admissionsMale"
          type="number"
          :series="admissions.map( (obj) => { return {year: obj.year, value: obj.admissions_male} } )"
          chartable="true"
        />
        <data-listing
          label="Female Admissions"
          :data="mostRecent.admissions_female"
          :aside="admissionsFemale"
          type="number"
          :series="admissions.map( (obj) => { return {year: obj.year, value: obj.admissions_female} })"
          :chartable="true"
        />
      </div>
      <div class="column is-one-third">
        <data-listing
          label="Applications"
          :data="mostRecent.applications"
          type="number"
          :series="admissions.map( (obj) => { return {year: obj.year, value: obj.applications} })"
          :chartable="true"
        />
        <data-listing
          label="Male Applications"
          :data="mostRecent.applications_male"
          :series="admissions.map( (obj) => { return {year: obj.year, value: obj.applications_male} })"
          type="number"
          :chartable="true"
        />
        <data-listing
          label="Female Applications"
          :data="mostRecent.applications_female"
          :series="admissions.map( (obj) => { return {year: obj.year, value: obj.applications_female} })"
          type="number"
          :chartable="true"
        />
      </div>
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

    const url = `/schools/${this.school.id}/admissions`
    ApiClient.get(url)
      .then(response => {
        this.admissions = response.data.data
        this.loading = false
      })
  },

  onToggle(showing) {
    if(showing && !this.admissions) {
      this.getData()
    }
  },
}

const computed = {
  mostRecent() {
    return this.admissions.sort( (a,b) => {
      if(a.year > b.year)
        return -1
      if(a.year < b.year)
        return 1
    })[0]
  },

  admissionsPercent() {
    const percent = Math.round((this.mostRecent.admissions / this.mostRecent.applications) * 100)
    return `${percent}%`
  },

  admissionsMale() {
    const percent = Math.round((this.mostRecent.admissions_male / this.mostRecent.applications_male) * 100)
    return `${percent}%`
  },

  admissionsFemale() {
    const percent = Math.round((this.mostRecent.admissions_female / this.mostRecent.applications_female) * 100)
    return `${percent}%`
  },

  applicationsMale() {

  },

  applicationsFemale() {

  },
}

export default {
  props: {
    school: {},
  },

  data() {
    return {
      loading: true,
      admissions: null,
      show: false,
    }
  },

  computed: computed,
  methods: methods,
  components: components,
}
</script>
