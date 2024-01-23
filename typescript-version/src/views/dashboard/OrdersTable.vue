<script setup lang="ts">
import avatar1 from '@images/avatars/avatar-1.png'

const headers = [
  { title: 'Cliente', key: 'name' },
  { title: 'Valor total', key: 'total_price' },
  { title: 'Estado', key: 'status' },
  { title: 'Ações', key: 'actions' },
]

defineProps<{ orders: { client: { name: string }; total_price: number; status: string }[] }>()

const resolveUserStatusVariant = (stat: string) => {
  const statLowerCase = stat.toLowerCase()
  if (statLowerCase === 'pending') return 'warning'
  if (statLowerCase === 'active') return 'success'
  if (statLowerCase === 'incompleto') return 'secondary'

  return 'primary'
}
</script>

<template>
  <VCard>
    <VDataTable
      :headers="headers"
      :items="orders"
      item-value="id"
      class="text-no-wrap"
    >
      <!-- User -->
      <template #item.name="{ item }">
        <div class="d-flex align-center gap-x-4">
          <VAvatar
            size="34"
            :variant="'tonal'"
            :color="undefined"
          >
            <VImg
              v-if="avatar1"
              :src="avatar1"
            />
          </VAvatar>

          <div class="d-flex flex-column">
            <span class="text-sm text-medium-emphasis">@{{ item.client.name }}</span>
          </div>
        </div>
      </template>
      <!-- Status -->
      <template #item.total_price="{ item }"> R$ {{ item.total_price / 100 }} </template>
      <!-- Status -->
      <template #item.status="{ item }">
        <VChip
          :color="resolveUserStatusVariant(item.status)"
          size="small"
          class="text-capitalize"
        >
          {{ item.status }}
        </VChip>
      </template>

      <template #bottom />

      <template #item.actions>
        <VBtn>Detalhes</VBtn>
      </template>
    </VDataTable>
  </VCard>
</template>
