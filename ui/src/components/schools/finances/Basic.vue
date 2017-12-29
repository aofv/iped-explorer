<template>
  <div class="columns">
    <div class="column">
      <data-listing label="Last Reporting Year" :data="mostRecentRecord.year" />
      <data-listing label="Total Revenue" :data="formatCurrency(mostRecentRecord.total_revenue)" />
      <data-listing label="Discounts" :data="formatCurrency(mostRecentRecord.total_discounts)" />
    </div>

    <div class="column">
      <data-listing label="Assets" :data="formatCurrency(mostRecentRecord.total_assets)" />
      <data-listing label="Liabilities" :data="formatCurrency(mostRecentRecord.total_liabilities)" />
    </div>

    <div class="column">
      <data-listing label="Donations" :data="formatCurrency(mostRecentRecord.donations)" />
      <data-listing label="Endowment" :data="formatCurrency(mostRecentRecord.endowment)" />
    </div>
  </div>
</template>

<script>
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
}

export default {
  props: {
    finances: {},
  },

  computed: computed,
  components: components,
  methods: methods,
}
</script>
