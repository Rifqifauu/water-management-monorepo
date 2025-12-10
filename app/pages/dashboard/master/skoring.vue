<template>
  <Header title="Skoring"></Header>
  <div class="container p-6">
    <div class="flex justify-end">
      <button @click="openCreateModal" class="btn bg-blue-600 text-white px-2 py-2 rounded-lg font-bold shadow-md hover:bg-blue-700 cursor-pointer">
         Add New Skoring
      </button>
    </div>
   
    <SkoringTable 
      ref="tableRef" 
      @edit="openEditModal" 
    />

    <BaseModal 
      :show="showModal" 
      :title="selectedId ? 'Edit Skoring' : 'New Skoring'"
      @close="closeModal"
    >
      <SkoringForm 
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
import SkoringTable from '@/components/Skoring/SkoringTable.vue'
import SkoringForm from '@/components/Skoring/SkoringForm.vue'

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