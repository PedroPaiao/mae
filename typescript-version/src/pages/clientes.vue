<script setup lang="ts">
// import axios from '@/plugins/axios';
import ClientTable from '@/views/pages/tables/ClientTable.vue'
import axios from 'axios'
const clients = ref([])
const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})
const loadClients = () => {
  instance.get('clients').then(response => {
    clients.value = response.data.data
  })
}

loadClients()
</script>

<template>
  <div>
    <VRow>
      <VBtn
        size="small"
        href="/novo-cliente"
      >
        Adicionar novo cliente
      </VBtn>
      <VCol
        cols="12"
        class="pa-0 pt-3"
      >
        <VCard title="Produtos">
          <ClientTable
            @reload="loadClients"
            :clients="clients"
          />
        </VCard>
      </VCol>
    </VRow>
  </div>
</template>
