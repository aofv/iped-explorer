<template>
  <div>
    <h2 class="title is-4">Finances</h2>
    <div class="columns" v-if="finances">
      <div class="column">
        <data-listing label="Last Reporting Year" :data="mostRecentRecord.year" />
        <data-listing label="Total Revenue" :data="formatCurrency(mostRecentRecord.total_revenue)" />
        <data-listing label="Total Expenses" :data="formatCurrency(mostRecentRecord.total_expenses)" />
        <data-listing label="Assets" :data="formatCurrency(mostRecentRecord.total_assets)" />
        <data-listing label="Liabilities" :data="formatCurrency(mostRecentRecord.total_liabilities)" />
      </div>

      <div class="column">
        <data-listing label="Tuition Revenue" :data="formatCurrency(mostRecentRecord.tuition_revenue)" />
        <data-listing label="Tuition Discounts" :data="formatCurrency(mostRecentRecord.total_discounts)" />
        <data-listing label="Discount Rate" :data="discountRate" />
      </div>

      <div class="column">
        <data-listing label="Donations" :data="formatCurrency(mostRecentRecord.donations)" />
        <data-listing label="Endowment" :data="formatCurrency(mostRecentRecord.endowment)" />
      </div>

    </div>
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import DataListing from '@/components/common/DataListing'

const components = {
  DataListing,
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
    return Math.round((discount / tuition) * 100) + '%'
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
    }
  },

  components: components,
  methods: methods,
  computed: computed,
}
</script>
