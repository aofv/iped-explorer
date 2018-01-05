<template>
  <data-section title="Basic" v-if="school">
    <div class="columns">
      <div class="column is-one-third">
        <data-listing label="Region" :data="school.region_name" />
        <data-listing label="Address" :data="school.address.street" />
        <data-listing label="City" :data="school.address.city" />
        <data-listing label="State" :data="school.address.state" />
        <data-listing label="Zip" :data="school.address.zip" />
      </div>

      <div class="column is-one-third">
        <data-listing label="Chief Admin Title" :data="school.chief_administrator_title" />
        <data-listing label="Chief Admin Name" :data="school.chief_administrator" />
        <data-listing label="Sector" :data="school.sector_name" />
        <data-listing label="Highest Offering" :data="school.highest_offering_name" />
        <data-listing label="Control" :data="school.control_name" />
        <data-listing label="Size Category" :data="school.size_category_name" />
      </div>

    </div>
  </data-section>
</template>

<script>
import DataListing from '@/components/common/DataListing'
import DataSection from '@/components/common/DataSection'

const components = {
  DataListing,
  DataSection,
}

export default {
  props: {
    school: {},
  },

  data() {
    return {
      show: false,
    }
  },

  components: components,
}
</script>
