<template>
  <div>
    <basic-finances :finances="finances" v-if="finances" />

    <div class="tabs">
      <ul>
        <router-link tag="li" :to="{name: 'school.finances.revenue'}">
          <a>Total Revenue</a>
        </router-link>
        <router-link tag="li" :to="{name: 'school.finances.tuition'}">
          <a>Tuition Revenue</a>
        </router-link>
        <router-link tag="li" :to="{name: 'school.finances.discounts'}">
          <a>Tuition Discounts</a>
        </router-link>
      </ul>
    </div>

    <router-view :finances="finances" v-if="finances" />
  </div>
</template>

<script>
import ApiClient from '@/utils/ApiClient'
import BasicFinances from './Basic'

const components = {
  BasicFinances,
}

const methods = {
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

const computed = {

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
