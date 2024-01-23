<script lang="ts" setup>
import { ref } from 'vue'

const emit = defineEmits(['criaORole'])
defineProps<{
  clients: any[]
  products: any[]
}>()

const createNewOrder = () => {
  console.log('asd')
  const newOrder = {
    client_id: client.value,
    products: orderProducts.value.map(orderProduct => {
      return {
        id: orderProduct.productId,
        amount: orderProduct.amount,
        price: orderProduct.price,
      }
    }),
  }
  emit('criaORole', newOrder)
}
const addMoreProduct = () => {
  orderProducts.value.push({ productId: undefined, price: undefined, amount: undefined })
}

const client = ref()
const orderProducts = ref<{ productId: number | undefined; price: number | undefined; amount: number | undefined }[]>([
  { productId: undefined, price: undefined, amount: undefined },
])
</script>

<template>
  <div>
    <VCard
      title="Novo Pedido"
      class="pa-3"
    >
      <VForm @submit.prevent="() => {}">
        <VRow>
          <VCol cols="12">
            <VRow no-gutters>
              <!-- 👉 First Name -->
              <VCol
                cols="12"
                md="2"
              >
                <label for="name">Cliente</label>
              </VCol>

              <VCol
                cols="12"
                md="10"
              >
                <v-select
                  label="Nome do cliente"
                  v-model="client"
                  :items="clients"
                  item-value="id"
                  item-title="name"
                  variant="outlined"
                ></v-select>
              </VCol>
            </VRow>
          </VCol>

          <VCol cols="12">
            <VRow
              v-for="product in orderProducts"
              no-gutters
              class="py-3"
              justify-md="space-around"
              align-md="center"
            >
              <!-- 👉 amount -->
              <VCol
                cols="12"
                md="2"
              >
                <label for="amount">Produto</label>
              </VCol>

              <VCol
                cols="12"
                md="4"
              >
                <v-select
                  label="Nome"
                  v-model="product.productId"
                  :items="products"
                  item-value="id"
                  item-title="name"
                  variant="outlined"
                ></v-select>
              </VCol>
              <VCol
                cols="12"
                md="2"
              >
                <VTextField
                  v-model="product.price"
                  type="number"
                  placeholder="100"
                  label="Preço"
                  persistent-placeholder
                />
              </VCol>
              <VCol
                cols="12"
                md="2"
              >
                <VTextField
                  v-model="product.amount"
                  type="number"
                  placeholder="100"
                  label="Quantidade"
                  persistent-placeholder
                />
              </VCol>
            </VRow>
          </VCol>

          <VRow
            justify="end"
            class="mr-8"
          >
            <VBtn
              @click="addMoreProduct"
              type="submit"
            >
              Adicionar produto
            </VBtn>
          </VRow>
          <!-- 👉 submit and reset button -->
          <VCol
            offset-md="3"
            cols="12"
            md="9"
            class="d-flex gap-4"
          >
            <VBtn
              href="/produtos"
              color="secondary"
              variant="outlined"
              type="reset"
            >
              Voltar
            </VBtn>
            <VBtn
              @click="createNewOrder"
              type="submit"
            >
              Criar
            </VBtn>
          </VCol>
        </VRow>
      </VForm>
    </VCard>
  </div>
</template>
