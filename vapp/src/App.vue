<template>
  <div v-if="isDrizzleInitialized" id="app">
    <img alt="Vue logo" src="./assets/logo.png" />

    <div class="section">
      <h2>Show the Accounts</h2>
      <drizzle-account units="Ether" :precision="2" />
    </div>

    <div class="section">
      <h2>Simple Storage</h2>
      <SimpleStorage />
    </div>

<!--
    <div class="section">
      <h2>TangibleItems</h2>
      <TangibleItems />
    </div>
    -->
  </div>

  <div v-else>Loading app...</div>
</template>

<script>
import SimpleStorage from './SimpleStorage'
//import TangibleItems from './TangibleItems'
import { mapGetters } from 'vuex'

export default {
  name: 'app',
  components: {
    //TangibleItems,
    SimpleStorage
  },

  computed: mapGetters('drizzle', ['isDrizzleInitialized'])
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
