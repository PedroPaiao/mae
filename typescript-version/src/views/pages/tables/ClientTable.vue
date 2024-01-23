<script setup lang="ts">
import axios from 'axios'
defineProps<{
  clients: any[]
}>()
const emit = defineEmits(['reload'])
const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})

const deleteclient = (client: any) => {
  instance.delete(`clients/${client.id}`).then(_ => {
    emit('reload')
  })
}

const retirarQuantidade = (client: any, isActive: any) => {
  instance
    .put(`clients/${client.id}`, {
      amount: client.amount - parseInt(removerQuantidade.value),
    })
    .then(_ => {
      isActive.value = false
      emit('reload')
    })
}

const adicionarQuantidade = (client: any, isActive: any) => {
  instance
    .put(`clients/${client.id}`, {
      amount: client.amount + parseInt(adicionarQuantidadeRef.value),
    })
    .then(_ => {
      isActive.value = false
      emit('reload')
    })
}

const removerQuantidade = ref('')
const adicionarQuantidadeRef = ref('')
</script>

<template>
  <div>
    <VTable>
      <thead>
        <tr>
          <th class="text-uppercase">Nome</th>
          <th class="text-uppercase text-center">Ações</th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="item in clients"
          :key="item.name"
        >
          <td>
            {{ item.name }}
          </td>

          <td class="text-center d-flex ga-3 align-center justify-center">
            <VBtn
              size="small"
              @click="deleteclient(item)"
            >
              Deletar
            </VBtn>
            <VBtn size="small"> Editar </VBtn>
          </td>
        </tr>
      </tbody>
    </VTable>
  </div>
</template>
