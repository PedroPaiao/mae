<script setup lang="ts">
import NewOrderForm from '@/views/pages/form-layouts/orders/NewOrderForm.vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})
const router = useRouter()
const clients = ref([])
const products = ref([])
const createOrder = (newOrder: { client_id: string; products: any[] }) => {
  instance.post('orders', newOrder).then(response => {
    router.push('pedidos')
  })
}
const loadClients = () => {
  instance.get('clients').then(response => (clients.value = response.data.data))
}
const loadProducts = () => {
  instance.get('products').then(response => (products.value = response.data.data))
}
loadClients()
loadProducts()
</script>

<template>
  <div>
    <VRow>
      <VCol
        cols="12"
        class="pa-0 pt-3"
      >
        <NewOrderForm
          :clients="clients"
          :products="products"
          @criaORole="createOrder"
        />
      </VCol>
    </VRow>
  </div>
</template>
