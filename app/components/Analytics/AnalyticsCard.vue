<template>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-4 md:gap-6 mb-6 p-4 md:p-6">
    <div 
      v-for="(item, index) in stats" 
      :key="index"
      :class="item.color"
      class="group relative overflow-hidden rounded-2xl p-6 shadow-sm border border-black/5 flex flex-col justify-between transition-all duration-300 hover:-translate-y-1 hover:shadow-xl"
    >
      <div class="pointer-events-none absolute top-0 left-[-150%] h-full w-3/4 z-10 transform bg-gradient-to-r from-transparent via-white/40 to-transparent transition-all duration-[1000ms] ease-in-out group-hover:left-[150%]"></div>
      
      <div class="absolute top-5 right-5 opacity-20 group-hover:opacity-40 transition-opacity scale-125">
         <UIcon :name="item.icon" class="w-12 h-12" />
      </div>

      <div class="relative z-20"> 
        <h3 class="text-[10px] md:text-xs font-black uppercase tracking-[0.2em] opacity-70">{{ item.title }}</h3>
      </div>

      <div class="mt-4 relative z-20">
        <span v-if="isLoading" class="block text-2xl font-black opacity-30 animate-pulse">...</span>
        
        <div v-else>
            <div class="flex items-baseline gap-2">
                <span class="block text-3xl md:text-4xl font-black tracking-tighter mb-1 drop-shadow-sm">
                    {{ item.count }}
                </span>
                <span class="text-[10px] font-black uppercase opacity-60">
                  {{ item.unit }}
                </span>
            </div>
            <span class="text-[10px] md:text-xs font-medium opacity-80 flex items-center gap-1 uppercase tracking-wider">
                {{ item.subtitle }}
            </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const isLoading = ref(true)
const stats = ref([
  { title: 'Daily Reports', count: 0, unit: 'Laporan', subtitle: '', color: 'bg-blue-200 text-blue-800', icon: 'i-heroicons-clipboard-document-list' },
  { title: 'Weekly Reports', count: 0, unit: 'Laporan', subtitle: '', color: 'bg-indigo-200 text-indigo-800', icon: 'i-heroicons-building-office-2' },
  { title: 'Water Level', count: 0, unit: 'Laporan', subtitle: '', color: 'bg-orange-200 text-orange-800', icon: 'i-heroicons-chart-bar' },
])

// Fungsi Fetch Data
const fetchData = async () => {
  // Ambil langsung dari localStorage
  const m = localStorage.getItem('dashboard-month') || new Date().getMonth() + 1
  const y = localStorage.getItem('dashboard-year') || new Date().getFullYear()

  isLoading.value = true
  try {
    const response = await useApi('analytics/counts', {
      params: { month: m, year: y }
    }) 
    
    if (response.status && response.data) {
        const { stats: apiStats, periode } = response.data
        stats.value[0].count = apiStats.harian || 0
        stats.value[1].count = apiStats.mingguan || 0
        stats.value[2].count = apiStats.water_level || 0

        stats.value.forEach((item) => {
          item.subtitle = `Periode ${periode}`
        })
    }
  } catch (error) {
    console.error('Fetch Error:', error)
  } finally {
    isLoading.value = false
  }
}

// Handler untuk custom event agar reaktif
const handleFilterChange = () => {
  fetchData()
}

onMounted(() => {
  fetchData()
  // Dengerin event "filter-updated"
  window.addEventListener('filter-updated', handleFilterChange)
})

onUnmounted(() => {
  window.removeEventListener('filter-updated', handleFilterChange)
})


</script>