<template>
  <div v-if="isDrizzleInitialized" id="app">
    <img alt="Vue logo" src="./assets/logo.png" />

    <div class="section">
      <h2>My Account</h2>
      <drizzle-account units="Ether" :precision="2" />
    </div>

    <div class="section">
      <h2>Mint</h2>
      <h4>Choose Audio Format: </h4>
      <MintItems />
    </div>


    <div class="section">
      <h2>Storefront</h2>
      <TangibleItems />
    </div>

  </div>

  <div v-else>Loading app...</div>
</template>

<script>
import TangibleItems from './TangibleItems'
import MintItems from './MintItems'
import { mapGetters } from 'vuex'

export default {
  name: 'app',
  components: {
    TangibleItems,
    MintItems
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
