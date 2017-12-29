<template>
  <aside class="menu">
    <ul class="menu-list">
      <li>
        <router-link :to="{name: 'SchoolGeneral'}">
          General
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'school.admissions'}">
          Admissions
        </router-link>
      </li>
      <li>
        <router-link :to="{name: 'SchoolFinances'}">
          Finances
        </router-link>
      </li>
    </ul>
  </aside>
</template>

<script>
export default {

}
</script>
