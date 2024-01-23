<script setup lang="ts">
import axios from 'axios'
defineProps<{
  products: any[]
}>()
const emit = defineEmits(['reload'])
const instance = axios.create({
  withCredentials: false,
  baseURL: import.meta.env.VITE_API_ENDPOINT,
})

const deleteProduct = (product: any) => {
  instance.delete(`products/${product.id}`).then(_ => {
    emit('reload')
  })
}

const retirarQuantidade = (product: any, isActive: any) => {
  instance
    .put(`products/${product.id}`, {
      amount: product.amount - parseInt(removerQuantidade.value),
    })
    .then(_ => {
      isActive.value = false
      emit('reload')
    })
}

const adicionarQuantidade = (product: any, isActive: any) => {
  instance
    .put(`products/${product.id}`, {
      amount: product.amount + parseInt(adicionarQuantidadeRef.value),
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
          <th class="text-uppercase text-center">Quantidade em estoque</th>
          <th class="text-uppercase text-center">Ações</th>
        </tr>
      </thead>

      <tbody>
        <tr
          v-for="item in products"
          :key="item.name"
        >
          <td>
            {{ item.name }}
          </td>
          <td class="text-center">
            {{ item.amount }}
          </td>

          <td class="text-center d-flex ga-3 align-center justify-center">
            <v-dialog
              transition="dialog-bottom-transition"
              width="auto"
            >
              <template v-slot:activator="{ props }">
                <v-btn
                  color="primary"
                  v-bind="props"
                  >Adicionar quantidade</v-btn
                >
              </template>
              <template v-slot:default="{ isActive }">
                <v-card
                  title="Retire uma quantidade do estoque"
                  class="pa-3"
                >
                  <h1 class="pb-3">{{ item.name }}</h1>
                  <VTextField
                    id="amount"
                    v-model="adicionarQuantidadeRef"
                    type="number"
                    placeholder="100"
                    persistent-placeholder
                  />
                  <v-card-actions class="justify-end">
                    <v-btn
                      variant="text"
                      @click="adicionarQuantidade(item, isActive)"
                      >Adicionar</v-btn
                    >
                    <v-btn
                      variant="text"
                      @click="isActive.value = false"
                      >Close</v-btn
                    >
                  </v-card-actions>
                </v-card>
              </template>
            </v-dialog>
            <v-dialog
              transition="dialog-bottom-transition"
              width="auto"
            >
              <template v-slot:activator="{ props }">
                <v-btn
                  color="primary"
                  v-bind="props"
                  >Remover quantidade</v-btn
                >
              </template>
              <template v-slot:default="{ isActive }">
                <v-card
                  title="Retire uma quantidade do estoque"
                  class="pa-3"
                >
                  <h1 class="pb-3">{{ item.name }}</h1>
                  <VTextField
                    id="amount"
                    v-model="removerQuantidade"
                    type="number"
                    placeholder="100"
                    persistent-placeholder
                  />
                  <v-card-actions class="justify-end">
                    <v-btn
                      variant="text"
                      @click="retirarQuantidade(item, isActive)"
                      >Retirar</v-btn
                    >
                    <v-btn
                      variant="text"
                      @click="isActive.value = false"
                      >Close</v-btn
                    >
                  </v-card-actions>
                </v-card>
              </template>
            </v-dialog>
            <VBtn
              size="small"
              @click="deleteProduct(item)"
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
