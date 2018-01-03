<template>
  <div>
    <h2 class="title is-4">Finances</h2>
    <div class="columns" v-if="finances">
      <div class="column">
        <data-listing label="Total Revenue" :data="mostRecentRecord.total_revenue" type="currency" />
        <data-listing label="Total Expenses" :data="mostRecentRecord.total_expenses" type="currency" />
        <data-listing label="Assets" :data="mostRecentRecord.total_assets" type="currency" />
        <data-listing label="Liabilities" :data="mostRecentRecord.total_liabilities" type="currency" />
      </div>

      <div class="column">
        <data-listing label="Tuition Revenue" :data="mostRecentRecord.tuition_revenue" type="currency" />
        <data-listing label="Tuition Discounts" :data="mostRecentRecord.total_discounts" type="currency" />
        <data-listing label="Discount Rate" :data="discountRate" type="percent" />
      </div>

      <div class="column">
        <data-listing label="Donations" :data="mostRecentRecord.donations" type="currency" />
        <data-listing label="Endowment" :data="mostRecentRecord.endowment" type="currency" />
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
    }
  },

  components: components,
  methods: methods,
  computed: computed,
}
</script>
