<template>
  <data-section title="Degree Programs" @showToggle="onToggle">
    <div class="columns">
      <div class="column content">
        <ul>
          <li v-for="program in degreePrograms">{{ program.title }}</li>
        </ul>
      </div>
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
    ApiClient.get(`/schools/${this.school.id}/degree_programs`)
      .then(response => {
        this.degreePrograms = response.data.data
      })
  },

  onToggle(showing) {
    if(showing && !this.degreePrograms) {
      this.getData()
    }
  }
}

const computed = {

}

export default {
  props: {
    school: {},
  },

  data() {
    return {
      degreePrograms: null,
    }
  },

  components,
  methods,
  computed,
}
</script>
