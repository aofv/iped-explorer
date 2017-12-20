<template>
  <tr>
    <td>
      {{ school.name }}
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
