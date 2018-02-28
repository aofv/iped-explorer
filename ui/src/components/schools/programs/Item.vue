<template>
  <tr v-if="show">
    <td>
      <span class="program-title" @click="toggleDescription">
        {{ program.title }}
        <span class="icon">
          <i class="fa fa-question-circle"></i>
        </span>
      </span>
      <div class="description" v-if="showingDescription">
        {{ programDescription }}

        <div>
          <button class="button is-white is-size-7" @click="toggleDescription">
            <span class="icon">
              <i class="fa fa-times"></i>
            </span>
            <span>Hide Description</span>
          </button>
        </div>
      </div>
    </td>
    <td>
      <span class="tag is-success" v-if="program.associate">
        Yes
      </span>
    </td>
    <td>
      <span class="tag is-success" v-if="program.bachelor">
        Yes
      </span>
    </td>
    <td>
      <span class="tag is-success" v-if="program.master">
        Yes
      </span>
    </td>
    <td>
      <span class="tag is-success" v-if="program.distance">
        Yes
      </span>
    </td>
  </tr>
</template>

<script>
import ApiClient from '@/utils/ApiClient'

const methods = {
  toggleDescription() {
    this.showingDescription = !this.showingDescription

    if(this.showingDescription) {
      this.loading = true
      ApiClient.get(`degree_programs/${this.program.id}`)
        .then(response => {
          this.loading = false
          this.programDescription = response.data.data.description
        })
    }
  }
}

const computed = {
  show() {
    if(this.filter) {
      return this.filter.test(this.program.title)
    }

    return true
  }
}

export default {
  props: {
    program: {},
    filter: { default: null },
  },

  data() {
    return {
      showingDescription: false,
      loading: true,
      programDescription: null,
    }
  },

  methods,
  computed,
}
</script>

<style scoped lang="scss">
  .program-title {
    cursor: pointer;
  }
</style>
