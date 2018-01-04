import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const TOGGLE_CHART_FIELD = 'TOGGLE_CHART_FIELD'
const REMOVE_CHART_FIELD = 'REMOVE_CHART_FIELD'

const state = {
  chartFields: [],
  displayYear: 2016,
}

const mutations = {
  [TOGGLE_CHART_FIELD] (state, payload) {
    const existingItem = this.state.chartFields.find(i => i.field == payload.field)
    const index = this.state.chartFields.indexOf(existingItem)

    if(index < 0) {
      this.state.chartFields.push(payload)
    } else {
      this.state.chartFields.splice(index, 1)
    }
  },
}

const actions = {
  toggleChartField: ({ commit, state }, payload) => commit(TOGGLE_CHART_FIELD, payload)
}

const getters = {

}

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations,
})
