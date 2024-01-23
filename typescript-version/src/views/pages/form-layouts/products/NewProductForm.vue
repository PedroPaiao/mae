<script lang="ts" setup>
import { ref } from 'vue'

const name = ref('')
const amount = ref('')

const emit = defineEmits(['criaORole'])

const createNewProduct = () => {
  console.log('asd')
  const newProduct = {
    name: name.value,
    amount: parseInt(amount.value),
  }
  emit('criaORole', newProduct)
}
</script>

<template>
  <div>
    <VCard
      title="Novo produto"
      class="pa-3"
    >
      <VForm @submit.prevent="() => {}">
        <VRow>
          <VCol cols="12">
            <VRow no-gutters>
              <!-- 👉 First Name -->
              <VCol
                cols="12"
                md="3"
              >
                <label for="name">Nome</label>
              </VCol>

              <VCol
                cols="12"
                md="9"
              >
                <VTextField
                  id="name"
                  v-model="name"
                  placeholder="Coxinha"
                  persistent-placeholder
                />
              </VCol>
            </VRow>
          </VCol>

          <VCol cols="12">
            <VRow no-gutters>
              <!-- 👉 amount -->
              <VCol
                cols="12"
                md="3"
              >
                <label for="amount">Quantidade em estoque</label>
              </VCol>

              <VCol
                cols="12"
                md="9"
              >
                <VTextField
                  id="amount"
                  v-model="amount"
                  type="number"
                  placeholder="100"
                  persistent-placeholder
                />
              </VCol>
            </VRow>
          </VCol>

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
              @click="createNewProduct"
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
