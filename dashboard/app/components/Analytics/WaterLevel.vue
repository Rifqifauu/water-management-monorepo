<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <div class="header-left">
          <h3> Analisis Water Level</h3>
          <span class="subtitle">Analisis tinggi level air</span>
        </div>
        <div class="header-right">
          <button class="filter-btn">7 Hari Terakhir</button>
        </div>
      </div>
      
      <div class="chart-container">
        <Line
          v-if="loaded"
          id="analytics-chart"
          :options="chartOptions"
          :data="chartData"
        />
        <div v-else class="h-full flex items-center justify-center text-gray-400">
          <span v-if="isLoading">Memuat data grafik...</span>
          <span v-else>Tidak ada data grafik.</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Line } from 'vue-chartjs'
import { 
  Chart as ChartJS, 
  Title, 
  Tooltip, 
  Legend, 
  LineElement,    
  PointElement,   
  CategoryScale, 
  LinearScale,
  Filler 
} from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, LineElement, PointElement, CategoryScale, LinearScale, Filler)

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
        pointStyle: 'circle',
        boxWidth: 8,
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
      displayColors: false,
      callbacks: {
        label: function(context) {
          let val = parseFloat(context.parsed.y).toFixed(2);
          return `Level: ${val} cm`;
        }
      }
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      grid: { color: '#F3F4F6', borderDash: [4, 4] },
      ticks: { color: '#9CA3AF', font: { size: 10 } }
    },
    x: {
      grid: { display: false },
      ticks: { 
        color: '#9CA3AF', 
        font: { size: 10 },
        maxRotation: 45,
        minRotation: 0
      } 
    }
  }
})

onMounted(async () => {
  try {
    isLoading.value = true
    const response = await useApi('analytics/water-level-trend')
    
    // API Anda mengembalikan object { labels: [], values: [] }
    // Bukan array [ {tanggal: ...}, {avg_level: ...} ]
    
    if (response && response.labels && response.labels.length > 0) {
      chartData.value = {
        labels: response.labels, // Langsung ambil array labels
        datasets: [
          {
            label: 'Rata-rata Tinggi Air',
            data: response.values, // Langsung ambil array values
            borderColor: '#3B82F6',
            backgroundColor: 'rgba(59, 130, 246, 0.2)', 
            borderWidth: 3,
            pointBackgroundColor: 'white',
            tension: 0.4, 
            fill: true
          }
        ]
      }
      loaded.value = true
    } else {
      console.warn('Data kosong dari API')
      loaded.value = false
    }
  } catch (error) {
    console.error('Error loading analytics:', error)
    loaded.value = false
  } finally {
    isLoading.value = false
  }
})
</script>

<style scoped>
/* Base Styles (Desktop First) */
.dashboard-container {
  padding: 0 2em;
  font-family: 'Inter', sans-serif;
  width: 100%;
  box-sizing: border-box; /* Pastikan padding tidak menambah lebar total */
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
  flex-wrap: wrap; /* Izinkan elemen turun ke bawah jika sempit */
  gap: 12px; /* Jarak antar elemen saat wrap */
}

.header-left {
  min-width: 200px; /* Mencegah teks terlalu gepeng */
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

.filter-btn {
  background-color: #F3F4F6;
  color: #374151;
  border: none;
  padding: 6px 12px;
  border-radius: 6px;
  font-size: 12px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
  white-space: nowrap; /* Teks tombol jangan turun baris */
}

.filter-btn:hover {
  background-color: #E5E7EB;
}

.chart-container {
  position: relative;
  height: 350px; /* Tinggi Default Desktop */
  width: 100%;
}

/* --- MOBILE RESPONSIVE --- */
@media (max-width: 768px) {
  .dashboard-container {
    padding: 1em; /* Hilangkan padding container luar di mobile agar full width */
  }

  .card {
    border-radius: 0; /* Opsional: card jadi kotak penuh di mobile */
    border-left: none;
    border-right: none;
    padding: 16px; /* Padding dalam card diperkecil */
  }

  .card-header {
    flex-direction: column; /* Susun vertikal */
    align-items: flex-start; /* Rata kiri */
    margin-bottom: 16px;
  }

  .header-right {
    width: 100%; /* Tombol full width di mobile */
    display: flex;
    justify-content: flex-end; /* Atau 'flex-start' jika ingin tombol di kiri */
  }

  .chart-container {
    height: 250px; /* Tinggi grafik diperpendek untuk HP */
  }
}
</style>