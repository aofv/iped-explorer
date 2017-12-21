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
          <drop-down-item v-for="option in options" :key="option[0]" :item="option" @changed="selectItem" />
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

export default {
  props: {
    options: {},
    label: { default: null },
  },

  data() {
    return {
      selectedItems: [],
      isShowingMenu: false,
    }
  },

  components: components,
  methods: methods,
}
</script>

<style scoped lang="scss">
.ie-multiselect {
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
    max-height: 400px;
    overflow-y: scroll;
  }
}
</style>
