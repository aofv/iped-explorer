<template>
  <div class="ie-multiselect">
    <div class="overlay" v-if="isShowingMenu" @click="isShowingMenu = false"></div>

    <label v-if="label">{{ label }}</label>

    <div class="dropdown" :class="{'is-active': isShowingMenu}">
      <div class="dropdown-trigger" @click="isShowingMenu = !isShowingMenu">
        <button class="button">
          <div class="tags">
            <span class="tag is-info" v-for="selectedItem in selectedItems">
              {{ selectedItem[1] }}
            </span>
          </div>
        </button>
      </div>
      <div class="dropdown-menu">

        <div class="dropdown-content">
          <div class="control" v-if="options.length > 7">
            <input v-model="filterTerm" type="text" class="input" placeholder="Filter"/>
          </div>
          <div class="list-options">
            <drop-down-item v-for="option in filteredItems" :key="option[0]" :item="option" @changed="selectItem" />
          </div>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import DropDownItem from './DropDownItem'

const components = {
  DropDownItem,
}

const methods = {
  selectItem(e) {
    const item = this.options.find( (i) => {
      return i[0] == e.item
    })

    if(e.value === true) {
      // the item was selected
      this.selectedItems.push(item)
    } else {
      // An item was unselected
      const index = this.selectedItems.indexOf(item)
      this.selectedItems.splice(index, 1)
    }

    this.$emit('input', this.selectedItems.map ( (i) => { return i[0] } ) )
  },
}

const computed = {
  filteredItems() {
    if(this.filterTerm) {
      var pattern = new RegExp(this.filterTerm, 'gi')
      return this.options.filter( (i) => {
        return pattern.test(i[1])
      } )
    }
    return this.options
  }
}

export default {
  props: {
    options: {},
    label: { default: null },
  },

  data() {
    return {
      selectedItems: [],
      isShowingMenu: false,
      filterTerm: null,
    }
  },

  components: components,
  methods: methods,
  computed: computed,
}
</script>

<style scoped lang="scss">
.ie-multiselect {

  .dropdown-content {
    position: relative;

    .list-search {
      position: static;
      top: 0;
      right: 0;
      left: 0;
    }
  }

  label {
    display: block;
  }

  .button {
    min-width: 150px;
  }

  .overlay {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
  }

  .dropdown-content {
    padding-top: 0;

    .list-options {
      max-height: 400px;
      overflow-y: scroll;
    }

  }
}
</style>
