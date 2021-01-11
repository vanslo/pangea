<template>
  <div v-if="isDrizzleInitialized">
    <drizzle-contract
      contractName="TangibleItems"
      method="_tokenIds"
      label="ID"
    />

<!--    
    <drizzle-contract
      contractName="TangibleItems"
      method="symbol"
      label="Symbol"
    />
    <drizzle-contract
      contractName="TangibleItems"
      method="balanceOf"
      label="Your Balance"
      :methodArgs="accounts"
    />

    <drizzle-contract-form
      contractName="TangibleItems"
      method="transfer"
      :placeholders="placeholders"
    /> 
    
    -->

  </div>

  <div v-else>Loading TI contract...</div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'TangibleItems',
  computed: {
    //...mapGetters('accounts', ['activeAccount', 'activeBalance']),
    ...mapGetters('drizzle', ['isDrizzleInitialized']),

    accounts() {
      return [this.activeAccount]
    },

    placeholders() {
      return ['To Address', 'Amount to Send']
    }
  }
}
</script>

<style></style>
