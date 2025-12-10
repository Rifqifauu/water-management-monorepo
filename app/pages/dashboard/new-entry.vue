<template>
  <Header title="New Observation Entry"></Header>
  
  <div class="container mx-auto mt-6 max-w-5xl">
      <div class="flex justify-center ">
        <div class="bg-gray-100 p-1.5 rounded-xl inline-flex items-center shadow-inner border border-gray-200">
          
          <button 
            @click="showDailyForm = true"
            :class="[
              'px-8 py-3 rounded-lg text-sm font-bold transition-all duration-300 ease-out',
              showDailyForm 
                ? 'bg-white text-blue-600 shadow-md transform scale-105' 
                : 'text-gray-500 hover:text-gray-700 hover:bg-gray-200/50'
            ]"
          >
            Daily Observation
          </button>

          <button 
            @click="showDailyForm = false"
            :class="[
              'px-8 py-3 rounded-lg text-sm font-bold transition-all duration-300 ease-out',
              !showDailyForm 
                ? 'bg-white text-indigo-600 shadow-md transform scale-105' 
                : 'text-gray-500 hover:text-gray-700 hover:bg-gray-200/50'
            ]"
          >
            Weekly Report
          </button>

        </div>
      </div>

      <transition 
        mode="out-in"
        enter-active-class="transition ease-out duration-200"
        enter-from-class="opacity-0 translate-y-2"
        enter-to-class="opacity-100 translate-y-0"
        leave-active-class="transition ease-in duration-150"
        leave-from-class="opacity-100 translate-y-0"
        leave-to-class="opacity-0 translate-y-2"
      >
          <div :key="showDailyForm ? 'daily' : 'weekly'">
            <DailyForm 
              v-if="showDailyForm"
              :edit-id="selectedId"
              @success="handleSuccess"
              @close="closeModal"
            />
            <WeeklyForm 
              v-else
              :edit-id="selectedId"
              @success="handleSuccess"
              @close="closeModal"
            />
          </div>
      </transition>

  </div>
</template>

<script setup>
import { ref } from 'vue'
// Pastikan path import komponen sudah benar
import Header from '@/components/Header.vue' 
import DailyForm from '@/components/Observation/DailyForm.vue'
import WeeklyForm from '@/components/Observation/WeeklyForm.vue'

// State untuk toggle (True = Daily, False = Weekly)
const showDailyForm = ref(true) 

// State dummy (sesuaikan dengan logic parent Anda yang sebenarnya)
const selectedId = ref(null)
const showModal = ref(false)
const tableRef = ref(null)

const closeModal = () => {
  showModal.value = false
  // Reset ID setelah modal tertutup (delay sedikit untuk animasi)
  setTimeout(() => { selectedId.value = null }, 300)
}

const handleSuccess = () => {

  console.log('Data berhasil disimpan! Mode:', showDailyForm.value ? 'Daily' : 'Weekly')
  
  closeModal() 
}
</script>