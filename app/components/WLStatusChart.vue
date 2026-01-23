<template>
  <div class="card-container">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-3 md:gap-4 mb-6 md:mb-8">
      <div class="min-w-0">
        <h3 class="text-base md:text-xl font-black text-slate-800 tracking-tight uppercase">Water Level Analysis</h3>
        <p class="text-[10px] text-slate-400 font-bold uppercase tracking-[0.2em] mt-1">Current condition distribution</p>
      </div>
      
      <div class="flex items-center gap-2 md:gap-3 bg-blue-50/50 border border-blue-100 px-3 py-2 md:px-5 md:py-3 rounded-xl md:rounded-2xl shadow-sm shrink-0">
        <div class="relative flex h-2 w-2 md:h-2.5 md:w-2.5">
          <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-400 opacity-75"></span>
          <span class="relative inline-flex rounded-full h-full w-full bg-blue-600"></span>
        </div>
        <div class="flex flex-col">
          <span class="text-[8px] md:text-[9px] font-black text-blue-400 uppercase leading-none mb-1 tracking-widest">Monitored WL</span>
          <span class="text-lg md:text-xl font-black text-blue-700 leading-none tabular-nums">
            {{ rawData.total_lokasi || 0 }} <small class="text-[9px] md:text-[10px] font-bold opacity-60">Points</small>
          </span>
        </div>
      </div>
    </div>

    <div class="flex flex-col lg:flex-row items-center gap-6 md:gap-10">
      <div class="h-[240px] md:h-[280px] w-full lg:w-1/2 relative bg-slate-50/30 rounded-2xl md:rounded-[2rem] p-4 md:p-6 border border-slate-100/50 flex items-center justify-center">
        <div v-if="isLoading" class="absolute inset-0 flex flex-col items-center justify-center bg-white/80 backdrop-blur-sm rounded-2xl md:rounded-[2rem] z-20">
          <div class="w-6 h-6 md:w-8 md:h-8 border-4 border-blue-600 border-t-transparent rounded-full animate-spin mb-3"></div>
          <span class="text-[9px] md:text-[10px] text-slate-400 font-black uppercase tracking-widest">Syncing Matrix...</span>
        </div>
        
        <Doughnut v-else :options="chartOptions" :data="chartData" />
      </div>

      <div class="w-full lg:w-1/2 space-y-2 md:space-y-3">
        <div v-for="item in legendData" :key="item.label" 
          class="group flex items-center justify-between p-3 md:p-4 rounded-xl md:rounded-2xl border border-slate-100 bg-white hover:border-slate-900 transition-all duration-300 shadow-sm">
          <div class="flex items-center gap-2 md:gap-4 min-w-0 flex-1">
            <div class="w-8 h-8 md:w-10 md:h-10 rounded-lg md:rounded-xl flex items-center justify-center shadow-sm shrink-0" :class="item.bg">
               <Icon :name="item.icon" class="w-4 h-4 md:w-5 md:h-5" :class="item.text" />
            </div>
            <div class="min-w-0 flex-1">
              <span class="block text-[9px] md:text-[10px] font-black text-slate-400 uppercase tracking-widest mb-0.5 truncate">{{ item.label }}</span>
              <span class="block text-[8px] md:text-[9px] font-bold text-slate-300 uppercase tracking-tighter truncate">{{ item.info }}</span>
            </div>
          </div>
          <div class="text-right shrink-0 ml-2">
            <span class="text-md md:text-xl font-black text-slate-800 tabular-nums">{{ item.value }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted } from 'vue' // Pastikan semua di-import
import { Doughnut } from 'vue-chartjs'
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'

ChartJS.register(ArcElement, Tooltip, Legend)

// 1. Definisikan Props
const props = defineProps({
  month: {
    type: [String, Number],
    required: true
  },
  year: {
    type: [String, Number],
    required: true
  }
})

const isLoading = ref(true)
const rawData = ref({ 'Kelas 1': 0, 'Kelas 2': 0, 'Kelas 3': 0, total_lokasi: 0 })

// 2. Logika Fetch Data dengan Parameter
const fetchData = async () => {
  isLoading.value = true
  try {
    const res = await useApi('water-level-status', {
      params: {
        month: props.month,
        year: props.year
      }
    })
    // Laravel controller mengembalikan response->json(['data' => [...]])
    rawData.value = res.data || { 'Kelas 1': 0, 'Kelas 2': 0, 'Kelas 3': 0, total_lokasi: 0 }
  } catch (e) {
    console.error("Error fetching WL Status:", e)
  } finally {
    isLoading.value = false
  }
}

// 3. Watcher: Re-fetch data ketika props berubah
watch(() => [props.month, props.year], () => {
  fetchData()
})

onMounted(fetchData)

// --- Chart & Legend Configuration ---

const chartData = computed(() => ({
  labels: ['Kelas 1', 'Kelas 2', 'Kelas 3'],
  datasets: [{
    data: [rawData.value['Kelas 1'], rawData.value['Kelas 2'], rawData.value['Kelas 3']],
    backgroundColor: ['#10B981', '#F59E0B', '#EF4444'],
    borderWidth: 0,
    hoverOffset: 15,
    cutout: '75%'
  }]
}))

const legendData = computed(() => [
  { label: 'Kelas 1', info: 'Skor ≥ 2.5', value: rawData.value['Kelas 1'], bg: 'bg-emerald-50', text: 'text-emerald-600', icon: 'ph:check-circle-bold' },
  { label: 'Kelas 2', info: 'Skor 1.5 - 2.4', value: rawData.value['Kelas 2'], bg: 'bg-amber-50', text: 'text-amber-600', icon: 'ph:warning-circle-bold' },
  { label: 'Kelas 3', info: 'Skor < 1.5', value: rawData.value['Kelas 3'], bg: 'bg-rose-50', text: 'text-rose-600', icon: 'ph:warning-diamond-bold' }
])

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: { display: false },
    tooltip: {
      backgroundColor: '#0f172a',
      padding: 12,
      cornerRadius: 12,
      titleFont: { size: 12, weight: 'bold' }
    }
  }
}
</script>

<style scoped>
@import '~/assets/css/main.css';

.card-container {
  @apply bg-white rounded-2xl md:rounded-[1rem] p-4 md:p-8 lg:p-12 border border-slate-200 shadow-sm w-full max-w-full;
}

/* Memastikan chart tidak melebihi container */
canvas {
  max-width: 100% !important;
}
</style>