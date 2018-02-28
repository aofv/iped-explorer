<template>
  <tr>
    <td>
      {{ team.sport }}
    </td>
    <td>
      {{ team.affiliation }}
    </td>
    <td>
      {{ team.division }}
    </td>
    <td>
      {{ team.roster_size }}
    </td>
    <td>
      {{ expenses }}
    </td>
    <td>
      {{ revenue }}
    </td>
  </tr>
</template>

<script>
import numeral from 'numeral'

const computed = {
  revenue() {
    return numeral(this.team.revenue).format('($0,0.00a)')
  },

  expenses() {
    return numeral(this.team.expenses).format('($0,0.00a)')
  },
}

export default {
  props: {
    team: {},
  },

  computed,
}
</script>
