<template>
  <table class="table is-fullwidth is-size-7">
    <thead>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Location</th>
      </tr>
    </thead>
    <tbody>
      <table-item v-for="school in schools" :key="school.id" :school="school" />
    </tbody>
  </table>
</template>

<script>
import TableItem from './TableItem'

const components = {
  TableItem,
}

export default {

  props: {
    schools: {},
  },

  components: components,
}
</script>
