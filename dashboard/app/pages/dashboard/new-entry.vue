<template>
  <Header title="New Observation Entry"></Header>
  
  <div class="container mx-auto mt-6 max-w-5xl px-4">
    <div class="flex justify-center mb-6">
      <div class="bg-gray-100 p-1.5 rounded-xl inline-flex items-center shadow-inner border border-gray-200">
        
        <button 
          @click="activeTab = 'daily'"
          :class="[
            'px-6 py-3 rounded-lg text-sm font-bold transition-all duration-300 ease-out',
            activeTab === 'daily' 
              ? 'bg-white text-blue-600 shadow-md transform scale-105' 
              : 'text-gray-500 hover:text-gray-700 hover:bg-gray-200/50'
          ]"
        >
          Daily Observation
        </button>

        <button 
          @click="activeTab = 'weekly'"
          :class="[
            'px-6 py-3 rounded-lg text-sm font-bold transition-all duration-300 ease-out',
            activeTab === 'weekly' 
              ? 'bg-white text-indigo-600 shadow-md transform scale-105' 
              : 'text-gray-500 hover:text-gray-700 hover:bg-gray-200/50'
          ]"
        >
          Weekly Report
        </button>

        <button 
          @click="activeTab = 'water_level'"
          :class="[
            'px-6 py-3 rounded-lg text-sm font-bold transition-all duration-300 ease-out',
            activeTab === 'water_level' 
              ? 'bg-white text-cyan-600 shadow-md transform scale-105' 
              : 'text-gray-500 hover:text-gray-700 hover:bg-gray-200/50'
          ]"
        >
          Water Level
        </button>

      </div>
    </div>

    <div v-if="isLoading" class="flex justify-center py-10">
      <span class="text-sm text-slate-500 animate-pulse font-medium">Memuat data skoring...</span>
    </div>

    <transition 
      v-else
      mode="out-in"
      enter-active-class="transition ease-out duration-200"
      enter-from-class="opacity-0 translate-y-2"
      enter-to-class="opacity-100 translate-y-0"
      leave-active-class="transition ease-in duration-150"
      leave-from-class="opacity-100 translate-y-0"
      leave-to-class="opacity-0 translate-y-2"
    >
        <div :key="activeTab">
          
          <DailyForm 
            v-if="activeTab === 'daily'"
            :skoring-data="filteredSkoringData"
            :edit-id="selectedId"
            @success="handleSuccess"
            @close="closeModal"
          />

          <WeeklyForm 
            v-else-if="activeTab === 'weekly'"
            :skoring-data="filteredSkoringData"
            :edit-id="selectedId"
            @success="handleSuccess"
            @close="closeModal"
          />

          <WaterLevelForm 
            v-else-if="activeTab === 'water_level'"
            :skoring-data="filteredSkoringData"
            :edit-id="selectedId"
            @success="handleSuccess"
            @close="closeModal"
          />

        </div>
    </transition>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import Header from '@/components/Header.vue' 
import DailyForm from '@/components/Observation/DailyForm.vue'
import WeeklyForm from '@/components/Observation/WeeklyForm.vue'
import WaterLevelForm from '@/components/Observation/WaterLevelForm.vue'

// -- States --
const activeTab = ref('daily') 
const rawSkoringData = ref([])
const isLoading = ref(false)
const selectedId = ref(null)
const showModal = ref(false) // Jika Anda menggunakan modal untuk edit

// -- Logic Filter Data Berdasarkan Unit --
const filteredSkoringData = computed(() => {
  if (!rawSkoringData.value.length) return []

  return rawSkoringData.value.filter(item => {
    const unitName = (item.unit || item.unit_penilaian || '').toUpperCase().trim()
    
    if (activeTab.value === 'daily') {
      // Harian: Genangan dan Parit
      return unitName === 'GENANGAN' || unitName === 'PARIT'
    } 
    
    if (activeTab.value === 'weekly') {
      // Mingguan: Infrastruktur
      return unitName === 'INFRASTRUKTUR'
    }
    
    if (activeTab.value === 'water_level') {
      // Water Level: Water Level
      return unitName === 'WATER LEVEL'
    }
    
    return false
  })
})

// -- Fetch Data Utama --
const fetchData = async () => {
  isLoading.value = true
  try {
    // Memanggil API Skoring
    const response = await useApi(`skoring`)
    rawSkoringData.value = Array.isArray(response) ? response : (response.data || [])
  } catch (error) {
    console.error("Fetch Error:", error)
  } finally {
    isLoading.value = false
  }
}

// -- Handlers --
const closeModal = () => {
  showModal.value = false
  setTimeout(() => { selectedId.value = null }, 300)
}

const handleSuccess = () => {
  alert(`Data ${activeTab.value} berhasil disimpan!`)

  closeModal() 
}

onMounted(() => {
  fetchData()
})
</script>