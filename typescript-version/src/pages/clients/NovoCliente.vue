<script setup lang="ts">
import NewClientForm from '@/views/pages/form-layouts/clients/NewClientForm.vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})
const router = useRouter()
const createProduct = (newProduct: { name: string; amount: number }) => {
  instance.post('clients', newProduct).then(response => {
    router.push('clientes')
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
        <NewClientForm @criaORole="createProduct" />
      </VCol>
    </VRow>
  </div>
</template>
