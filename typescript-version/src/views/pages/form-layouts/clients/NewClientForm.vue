<script lang="ts" setup>
import { ref } from 'vue'

const name = ref('')

const emit = defineEmits(['criaORole'])

const createNewProduct = () => {
  const newProduct = {
    name: name.value,
  }
  emit('criaORole', newProduct)
}
</script>

<template>
  <div>
    <VCard
      title="Novo cliente"
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
                  placeholder="Cnpjoto"
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
              href="/clientes"
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
