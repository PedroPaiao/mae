<script setup lang="ts">
// import axios from '@/plugins/axios';
import OrdersTable from '@/views/dashboard/OrdersTable.vue'
import axios from 'axios'
const orders = ref([])
const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})
const loadOrders = () => {
  instance.get('orders').then(response => {
    orders.value = response.data.data
  })
}

loadOrders()
</script>

<template>
  <div>
    <VRow>
      <VBtn
        size="small"
        href="/novo-pedido"
      >
        Adicionar novo pedido
      </VBtn>
      <VCol
        cols="12"
        class="pa-0 pt-3"
      >
        <OrdersTable :orders="orders" />
      </VCol>
    </VRow>
  </div>
</template>
