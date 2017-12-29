<template>
  <div class="columns">
    <div class="column">
      <data-listing label="Admissions" :data="mostRecent.admissions" :aside="admissionsPercent" />
      <data-listing label="Male Admissions" :data="mostRecent.admissions_male" :aside="admissionsMale" />
      <data-listing label="Female Admissions" :data="mostRecent.admissions_female" :aside="admissionsFemale" />
    </div>
    <div class="column">
      <data-listing label="Applications" :data="mostRecent.applications" />
      <data-listing label="Male Applications" :data="mostRecent.applications_male" />
      <data-listing label="Female Applications" :data="mostRecent.applications_female" />
    </div>
  </div>
</template>

<script>
import DataListing from '@/components/common/DataListing'

const components = {
  DataListing,
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
    admissions: {},
  },

  components: components,
  computed: computed,
}
</script>
