<template>
  <div v-if="isDrizzleInitialized">
    <drizzle-contract
      contractName="TangibleItems"
      method="_tokenIds"
      label="ID"
    />

    <drizzle-contract
      contractName="TangibleItems"
      method="_itemIds"
      label="Item"
    />

    <drizzle-contract-form
        contractName="TangibleItems"
        method="addItem"
        :placeholders="['Price']"
    />
    <drizzle-contract-form
        contractName="TangibleItems"
        method="safeTransferFrom"
        :placeholders="['']"
    />

<!--
    <drizzle-contract-form
        contractName="TangibleItems"
        method="getItem"
        :placeholders="['Get Item by Item ID']"
      />

    <drizzle-contract-form
        contractName="TangibleItems"
        method="purchaseItem"
        :placeholders="['Purchase by Item ID']"
      />

    <drizzle-contract-form
        contractName="TangibleItems"
        method="getPayments"
        :placeholders="['Recieve Payment']"
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
