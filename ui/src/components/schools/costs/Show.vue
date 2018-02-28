<template>
  <data-section title="Cost" @showToggle="onToggle">
    <div class="columns" v-if="costs">

      <!-- START col 1 -->
      <div class="column is-one-third">
        <data-listing
          label="In State Tuition"
          :data="currentRecord.average_in_state_tuition"
          type="number"
          :series="costs.map( (obj) => { return {year: obj.year, value: obj.average_in_state_tuition} } )"
          :chartable="true"
        />
        <data-listing
          label="In State Fees"
          :data="currentRecord.in_state_fees"
          type="number"
          :series="costs.map( (obj) => { return {year: obj.year, value: obj.in_state_fees} } )"
          :chartable="true"
        />
        <data-listing
          label="On-Campus Room"
          :data="currentRecord.on_campus_room_and_board"
          type="number"
          :series="costs.map( (obj) => { return {year: obj.year, value: obj.on_campus_room_and_board} } )"
          :chartable="true"
        />
        <data-listing
          label="Books and Supplies"
          :data="currentRecord.books_and_supplies"
          type="number"
        />
        <data-listing
          label="Total In State"
          type="number"
          :data="totalInStateCost"
        />
      </div>
      <!-- END col 1 -->

      <!-- START col 2 -->
      <div class="column is-one-third">
        <data-listing
          label="Out of State Tuition"
          :data="currentRecord.average_out_of_state_tuition"
          type="number"
          :series="costs.map( (obj) => { return {year: obj.year, value: obj.average_out_of_state_tuition} } )"
          :chartable="true"
        />
        <data-listing
          label="Out of State Fees"
          :data="currentRecord.out_of_state_fees"
          type="number"
          :series="costs.map( (obj) => { return {year: obj.year, value: obj.out_of_state_fees} } )"
          :chartable="true"
        />
        <data-listing
          label="On-Campus Room"
          :data="currentRecord.on_campus_room_and_board"
          type="number"
          :series="costs.map( (obj) => { return {year: obj.year, value: obj.on_campus_room_and_board} } )"
          :chartable="true"
        />
        <data-listing
          label="Books and Supplies"
          :data="currentRecord.books_and_supplies"
          type="number"
        />
        <data-listing
          label="Total Out of State"
          type="number"
          :data="totalOutOfStateCost"
        />
      </div>
      <!-- END col 2 -->

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
    const url = `/schools/${this.school.id}/costs`

    ApiClient.get(url)
      .then(response => {
        this.costs = response.data.data
        this.loading = false
      })
  },

  onToggle(showing) {
    if(showing && !this.costs) {
      this.getData()
    }
  }
}

const computed = {
  ...mapGetters([
    'displayYear'
  ]),

  currentRecord() {
    return this.costs.find(i => i.year == this.displayYear)
  },

  totalInStateCost() {
    const record = this.currentRecord
    return record.average_in_state_tuition +
      record.in_state_fees +
      record.on_campus_room_and_board +
      record.books_and_supplies
  },

  totalOutOfStateCost() {
    const record = this.currentRecord
    return record.average_out_of_state_tuition
      + record.out_of_state_fees
      + record.on_campus_room_and_board
      + record.books_and_supplies
  }
}

export default {
  props: {
    school: {},
  },

  data() {
    return {
      loading: true,
      costs: null,
    }
  },

  computed: computed,
  methods: methods,
  components: components,
}
</script>
