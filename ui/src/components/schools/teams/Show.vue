<template>
  <data-section title="Sports Teams">
    <div class="columns">
      <div class="column">
        <table class="table is-hoverable is-fullwidth">
          <thead>
            <tr>
              <th>Sport</th>
              <th>Affiliation</th>
              <th>Division</th>
              <th>Roster Size</th>
              <th>Expenses</th>
              <th>Revenue</th>
            </tr>
          </thead>
          <tbody>
            <team-row
              v-for="team in teams"
              :key="team.id"
              :team="team"
            />
          </tbody>
        </table>
      </div>
    </div>
  </data-section>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import DataListing from '@/components/common/DataListing'
import { mapGetters } from 'vuex'
import DataSection from '@/components/common/DataSection'
import TeamRow from './Item'

const components = {
  DataListing,
  DataSection,
  TeamRow,
}

const methods = {
  getData() {
    ApiClient.get(`/schools/${this.school.id}/sport_teams`)
      .then(response => {
        this.teams = response.data.data
      })
  }
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
      teams: null,
    }
  },

  components,
  methods,
  computed,
}
</script>
