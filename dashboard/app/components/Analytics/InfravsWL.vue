<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <div class="header-left">
          <h3>Status Infrastruktur vs Water Level</h3>
          <span class="subtitle">Perbandingan jumlah unit berdasarkan kondisi</span>
        </div>
        <div class="header-right">
          <span class="badge">Bulan Ini</span>
        </div>
      </div>
      
      <div class="chart-container">
        <Bar
          v-if="loaded"
          id="status-bar-chart"
          :options="chartOptions"
          :data="chartData"
        />
        <div v-else class="h-full flex items-center justify-center text-gray-400">
          <span v-if="isLoading">Memuat data status...</span>
          <span v-else>Tidak ada data status.</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Bar } from 'vue-chartjs'
import { 
  Chart as ChartJS, 
  Title, 
  Tooltip, 
  Legend, 
  BarElement, 
  CategoryScale, 
  LinearScale 
} from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const isLoading = ref(false)
const loaded = ref(false)
const chartData = ref({ labels: [], datasets: [] })

const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      display: true,
      position: 'top',
      align: 'end',
      labels: {
        usePointStyle: true,
        pointStyle: 'rectRounded',
        boxWidth: 10,
        font: { family: "'Inter', sans-serif", size: 12, weight: '600' },
        color: '#374151'
      }
    },
    tooltip: {
      backgroundColor: 'rgba(255, 255, 255, 0.95)',
      titleColor: '#111827',
      bodyColor: '#4B5563',
      borderColor: '#E5E7EB',
      borderWidth: 1,
      padding: 10,
      callbacks: {
        label: function(context) {
          return ` ${context.dataset.label}: ${context.raw} Unit`;
        }
      }
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      grid: { color: '#F3F4F6', borderDash: [4, 4] },
      ticks: { precision: 0, color: '#9CA3AF', font: { size: 10 } } // precision:0 agar tidak ada desimal
    },
    x: {
      grid: { display: false },
      ticks: { color: '#9CA3AF', font: { size: 11, weight: '500' } }
    }
  }
})
onMounted(async () => {
  try {
    isLoading.value = true
    
    // 1. Panggil API
    const response = await useApi('analytics/infra-vs-wl') 
    
    
    
    let result = response.data || response; 

    let finalData = null;

    if (result.datasets) {
        finalData = result; 
    } else if (result.data && result.data.datasets) {
        finalData = result.data;
    } else if (result.data && result.data.data && result.data.data.datasets) {
        finalData = result.data.data;
    }

    // 3. Render Chart jika data ketemu
    if (finalData) {
      chartData.value = {
        labels: finalData.labels, 
        datasets: [
          {
            label: 'Infrastruktur',
            data: finalData.datasets.infrastruktur, 
            backgroundColor: '#10B981', 
            borderRadius: 4,
            barPercentage: 0.6,
            categoryPercentage: 0.8
          },
          {
            label: 'Water Level',
            data: finalData.datasets.water_level, 
            backgroundColor: '#3B82F6', 
            borderRadius: 4,
            barPercentage: 0.6,
            categoryPercentage: 0.8
          }
        ]
      }
      loaded.value = true
    } else {
      console.error('Masih gagal menemukan datasets. Struktur saat ini:', result)
    }

  } catch (error) {
    console.error('Error sistem:', error)
  } finally {
    isLoading.value = false
  }
})
</script>

<style scoped>
/* Style sama persis seperti template Anda */
.dashboard-container {
  padding: 0 2em;
  font-family: 'Inter', sans-serif;
  width: 100%;
  box-sizing: border-box;
}

.card {
  background: white;
  border-radius: 12px;
  padding: 24px;
  border: 1px solid #E5E7EB;
  box-shadow: 0 1px 3px rgba(0,0,0,0.05);
  width: 100%;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 24px;
}

.header-left h3 {
  margin: 0 0 4px 0;
  font-size: 18px;
  font-weight: 700;
  color: #111827;
}

.subtitle {
  font-size: 13px;
  color: #6B7280;
  line-height: 1.4;
}

.badge {
  background-color: #ECFDF5;
  color: #059669;
  padding: 4px 12px;
  border-radius: 99px;
  font-size: 12px;
  font-weight: 600;
}

.chart-container {
  position: relative;
  height: 350px;
  width: 100%;
}

@media (max-width: 768px) {
  .dashboard-container { padding: 1em; }
  .card { border-radius: 0; border: none; padding: 16px; }
  .chart-container { height: 250px; }
}
</style>