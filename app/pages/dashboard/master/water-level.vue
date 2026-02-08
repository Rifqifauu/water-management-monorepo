<template>
  <Header title="Water Level"></Header>
  <div class="container p-6">
    <div class="flex justify-end">
      <button @click="openCreateModal" class="btn bg-blue-600 text-white px-2 py-2 rounded-lg font-bold shadow-md hover:bg-blue-700 cursor-pointer">
         Add New Water Level
      </button>
    </div>
   
    <WaterLevelTable 
      ref="tableRef" 
      @edit="openEditModal" 
    />

    <BaseModal 
      :show="showModal" 
      :title="selectedId ? 'Edit Water Level' : 'New Water Level'"
      @close="closeModal"
    >
      <WaterLevelForm 
        v-if="showModal"
        :edit-id="selectedId"
        @success="handleSuccess"
        @close="closeModal"
      />
    </BaseModal>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import WaterLevelTable from '@/components/WaterLevel/WaterLevelTable.vue'
import WaterLevelForm from '@/components/WaterLevel/WaterLevelForm.vue'

const tableRef = ref(null)

const showModal = ref(false)
const selectedId = ref(null)

const openCreateModal = () => {
  selectedId.value = null
  showModal.value = true
}

const openEditModal = (id) => {
  selectedId.value = id
  showModal.value = true
}

const closeModal = () => {
  showModal.value = false
  setTimeout(() => { selectedId.value = null }, 300)
}

const handleSuccess = () => {

  tableRef.value?.fetchData() 
  
  console.log('Data berhasil disimpan dan tabel di-refresh!')

  closeModal() 
}
</script>