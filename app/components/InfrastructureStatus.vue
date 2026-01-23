<template>
  <div class="card-container">
    <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-3 md:gap-4 mb-6 md:mb-8">
      <div class="min-w-0">
        <h3 class="text-base md:text-xl font-black text-slate-800 tracking-tight uppercase">Infrastructure Health</h3>
        <p class="text-[10px] text-slate-400 font-bold uppercase tracking-[0.2em] mt-1">Analysis by Infrastructure Type</p>
      </div>
      
      <div class="flex items-center gap-2 md:gap-3 bg-blue-50/50 border border-blue-100 px-3 py-2 md:px-5 md:py-3 rounded-xl md:rounded-2xl shadow-sm shrink-0">
        <div class="relative flex h-2 w-2 md:h-2.5 md:w-2.5">
          <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-400 opacity-75"></span>
          <span class="relative inline-flex rounded-full h-full w-full bg-blue-600"></span>
        </div>
        <div class="flex flex-col">
          <span class="text-[8px] md:text-[9px] font-black text-blue-400 uppercase leading-none mb-1 tracking-widest">Monitored Infra</span>
          <span class="text-lg md:text-xl font-black text-blue-700 leading-none tabular-nums">
            {{ totalLocations }} <small class="text-[9px] md:text-[10px] font-bold opacity-60">Units</small>
          </span>
        </div>
      </div>
    </div>

    <div class="h-[200px] md:h-[230px] w-full relative bg-slate-50/30 rounded-2xl md:rounded-[2rem] p-4 md:p-6 border border-slate-100/50">
      <div v-if="isLoading" class="absolute inset-0 flex flex-col items-center justify-center bg-white/80 backdrop-blur-sm rounded-2xl md:rounded-[2rem] z-20">
        <div class="w-6 h-6 md:w-8 md:h-8 border-4 border-blue-600 border-t-transparent rounded-full animate-spin mb-3"></div>
        <span class="text-[9px] md:text-[10px] text-slate-400 font-black uppercase tracking-widest">Syncing Matrix...</span>
      </div>
      
      <Bar v-else :options="chartOptions" :data="chartData" />
    </div>
  </div>
</template>

<script setup>
import { ref, watch, onMounted } from 'vue'
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

// 1. Definisikan Props untuk Filter
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
const totalLocations = ref(0)
const chartData = ref({ labels: [], datasets: [] })

// 2. Fetch Data dari API dengan Parameter
const fetchData = async () => {
  isLoading.value = true
  try {
    const res = await useApi('infrastructure-status', {
      params: {
        month: props.month,
        year: props.year
      }
    })
    
    // Perhatikan: res.details adalah array dari backend
    const data = res.details || []
    totalLocations.value = res.total_locations_checked || 0

    chartData.value = {
      labels: data.map(d => d.jenis),
      datasets: [
        { 
          label: 'Kelas 1', 
          data: data.map(d => d['Kelas 1']), // Sesuaikan dengan key dari Laravel Controller
          backgroundColor: '#10B981', 
          borderRadius: 6,
          barPercentage: 0.7,
          categoryPercentage: 0.6
        },
        { 
          label: 'Kelas 2', 
          data: data.map(d => d['Kelas 2']), 
          backgroundColor: '#F59E0B', 
          borderRadius: 6,
          barPercentage: 0.7,
          categoryPercentage: 0.6
        },
        { 
          label: 'Kelas 3', 
          data: data.map(d => d['Kelas 3']), 
          backgroundColor: '#EF4444', 
          borderRadius: 6,
          barPercentage: 0.7,
          categoryPercentage: 0.6
        }
      ]
    }
  } catch (e) {
    console.error("Infrastructure Chart Error:", e)
  } finally {
    isLoading.value = false
  }
}

// 3. Watcher untuk mendeteksi perubahan filter di Dashboard
watch(() => [props.month, props.year], () => {
  fetchData()
})

onMounted(fetchData)

// Konfigurasi Chart Options (Tetap Konsisten)
const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: { 
      position: 'top', 
      align: 'end',
      labels: { 
        usePointStyle: true, 
        pointStyle: 'circle',
        padding: 20, 
        font: { weight: 'bold', size: 10, family: 'Inter' },
        color: '#64748b'
      } 
    },
    tooltip: {
      backgroundColor: '#0f172a',
      padding: 12,
      titleFont: { size: 12, weight: 'bold' },
      bodyFont: { size: 12 },
      cornerRadius: 12,
      displayColors: true
    }
  },
  scales: {
    x: { 
      grid: { display: false }, 
      ticks: { font: { weight: 'bold', size: 10 }, color: '#94a3b8' } 
    },
    y: { 
      beginAtZero: true, 
      border: { display: false },
      grid: { color: '#f1f5f9', drawTicks: false }, 
      ticks: { 
        stepSize: 1, 
        font: { weight: 'bold', size: 10 }, 
        color: '#94a3b8' 
      } 
    }
  }
}
</script>

<style scoped>
@import '~/assets/css/main.css';

.card-container {
  @apply bg-white rounded-2xl md:rounded-[1rem] p-4 md:p-8 lg:p-14 border border-slate-200 shadow-sm w-full max-w-full;
}

/* Memastikan chart mengisi ruang secara responsif */
canvas {
  width: 100% !important;
  height: 100% !important;
}
</style>