<template>
  <tr>
    <td>
      <router-link :to="{name: 'school', params: {'school_id': school.id}}">
        {{ school.name }}
      </router-link>
    </td>
    <td>
      {{ school.control_name }}
    </td>
    <td>
      {{ school.address.city }}, {{ school.address.state }}
    </td>
  </tr>
</template>

<script>
export default {
  props: {
    school: {},
  },
}
</script>
