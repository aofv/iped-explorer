<template>
  <data-section title="Finances" v-if="finances">

    <div class="columns">
      <div class="column">
        <data-listing
        label="Total Revenue"
        :data="mostRecentRecord.total_revenue"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.total_revenue }})"
        chartable="true"
        />
        <data-listing
        label="Total Expenses"
        :data="mostRecentRecord.total_expenses"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.total_expenses }})"
        chartable="true"
        />
        <data-listing
        label="Assets"
        :data="mostRecentRecord.total_assets"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.total_assets }})"
        chartable="true"
        />
        <data-listing
        label="Liabilities"
        :data="mostRecentRecord.total_liabilities"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.total_liabilities }})"
        chartable="true"
        />
      </div>

      <div class="column">
        <data-listing
        label="Tuition Revenue"
        :data="mostRecentRecord.tuition_revenue"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.tuition_revenue }})"
        chartable="true"
        />
        <data-listing
        label="Tuition Discounts"
        :data="mostRecentRecord.total_discounts"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.total_discounts }})"
        chartable="true"
        />
        <data-listing
        label="Discount Rate"
        :data="discountRate"
        type="percent"
        />
      </div>

      <div class="column">
        <data-listing
        label="Donations"
        :data="mostRecentRecord.donations"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.donations }})"
        chartable="true"
        />
        <data-listing
        label="Endowment"
        :data="mostRecentRecord.endowment"
        type="currency"
        :series="finances.map((obj) => {return {year: obj.year, value: obj.endowment }})"
        chartable="true"
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

const computed = {
  mostRecentRecord() {
    return this.finances.sort( (a,b) => {
      if(a.year > b.year)
        return -1
      if(a.year < b.year)
        return 1
    })[0]
  },

  discountRate() {
    const tuition = this.mostRecentRecord.tuition_revenue
    const discount = this.mostRecentRecord.total_discounts
    return discount / tuition
  },
}

const methods = {
  formatCurrency(value) {
    if(value) {
      return value.toLocaleString('en-US', {
        style: 'currency',
        currency: 'USD',
      })
    }

    return ''
  },

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
      show: false,
    }
  },

  components: components,
  methods: methods,
  computed: computed,
}
</script>
