<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <h3>Kondisi Infrastruktur</h3>
        <span class="subtitle">Analisis status per komponen</span>
      </div>
      
      <div class="chart-container">
        <Bar
          v-if="loaded"
          id="infrastructure-bar-chart"
          :options="chartOptions"
          :data="chartData"
        />
        <div v-else class="h-full flex items-center justify-center text-gray-400 text-sm">
           Memuat data...
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Bar } from 'vue-chartjs' // GANTI KE BAR
import { 
  Chart as ChartJS, 
  Title, 
  Tooltip, 
  Legend, 
  BarElement,    // GANTI KE BAR ELEMENT
  CategoryScale, // PERLU SKALA X
  LinearScale    // PERLU SKALA Y
} from 'chart.js'
import { useApi } from '@/composables/useApi' // Pastikan import ini ada

// Registrasi komponen Chart.js
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const loaded = ref(false)
const chartData = ref({ labels: [], datasets: [] })

// Mapping Warna Status agar Semantik (Merah = Rusak, Hijau = Bagus)
const statusColors = {
  'Kelas 1': '#10B981',
  'Kelas 2': '#F59E0B',      // Amber 500
  'Kelas 3': '#EF4444',          // Red 500
}
const defaultColors = ['#3B82F6', '#6366F1', '#EC4899', '#14B8A6']

onMounted(async () => {
  try {
    // Panggil endpoint yang sudah kita buat
    const response = await useApi('analytics/infra-breakdown')
    const rawData = response.data.mingguan.breakdown || {}

    const labels = Object.keys(rawData) // Akan berisi: Jembatan, Pipa (PVC), dll
    
    // Kita kunci urutan status agar warna tidak tertukar
    const statuses = ['Kelas 1', 'Kelas 2', 'Kelas 3']

    const datasets = statuses.map((status) => {
      return {
        label: status,
        backgroundColor: statusColors[status],
        data: labels.map(infraKey => {
          const found = rawData[infraKey].find(i => i.status === status)
          return found ? found.jumlah : 0
        }),
        barPercentage: 0.6,
        borderRadius: 4 // Sedikit membulat agar modern
      }
    })

    chartData.value = {
      labels: labels,
      datasets: datasets
    }
    
    loaded.value = true
  } catch (error) {
    console.error("Gagal memuat data chart:", error)
  }
})

// OPSI KONFIGURASI STACKED BAR
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: false, 
  plugins: {
    legend: {
      position: 'bottom', 
      labels: {
        usePointStyle: true,
        pointStyle: 'circle',
        padding: 20,
        font: { family: "'Inter', sans-serif", size: 12 },
        color: '#6B7280'
      }
    },
    tooltip: {
      mode: 'index',      // Hover satu batang, muncul semua status
      intersect: false,
      backgroundColor: 'rgba(255, 255, 255, 0.95)',
      titleColor: '#111827',
      bodyColor: '#4B5563',
      borderColor: '#E5E7EB',
      borderWidth: 1,
    }
  },
  scales: {
    x: {
      stacked: true, // KUNCI AGAR BERTUMPUK
      grid: { display: false },
      ticks: { color: '#6B7280', font: { size: 11 } }
    },
    y: {
      stacked: true, // KUNCI AGAR BERTUMPUK
      beginAtZero: true,
      grid: { color: '#F3F4F6', borderDash: [4, 4] },
      ticks: { stepSize: 1, color: '#6B7280' } // Angka bulat
    }
  }
})
</script>

<style scoped>
.dashboard-container {
  padding: 20px;
  background-color: #f4f6f8;
  display: flex;
  justify-content: center;
}

.card {
  background: white;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 600px; /* Sedikit lebih lebar dari Pie Chart */
}

.card-header {
  margin-bottom: 20px;
}

h3 {
  margin: 0;
  font-size: 18px;
  font-weight: 700;
  color: #111827;
}

.subtitle {
  font-size: 12px;
  color: #9CA3AF;
  font-weight: 500;
}

.chart-container {
  position: relative;
  height: 350px; 
  width: 100%;
}
</style>