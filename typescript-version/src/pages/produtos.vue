<script setup lang="ts">
// import axios from '@/plugins/axios';
import ProductTable from '@/views/pages/tables/ProductTable.vue'
import axios from 'axios'
const products = ref([])
const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})
const loadProducts = () => {
  instance.get('products').then(response => {
    products.value = response.data.data
  })
}

loadProducts()
</script>

<template>
  <div>
    <VRow>
      <VBtn
        size="small"
        href="/novo-produto"
      >
        Adicionar novo produto
      </VBtn>
      <VCol
        cols="12"
        class="pa-0 pt-3"
      >
        <VCard title="Produtos">
          <ProductTable
            @reload="loadProducts"
            :products="products"
          />
        </VCard>
      </VCol>
    </VRow>
  </div>
</template>
