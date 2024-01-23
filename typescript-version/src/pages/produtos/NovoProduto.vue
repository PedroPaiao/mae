<script setup lang="ts">
import NewProductForm from '@/views/pages/form-layouts/products/NewProductForm.vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})
const router = useRouter()
const createProduct = (newProduct: { name: string; amount: number }) => {
  instance.post('products', newProduct).then(response => {
    router.push('produtos')
  })
}
</script>

<template>
  <div>
    <VRow>
      <VCol
        cols="12"
        class="pa-0 pt-3"
      >
        <NewProductForm @criaORole="createProduct" />
      </VCol>
    </VRow>
  </div>
</template>
