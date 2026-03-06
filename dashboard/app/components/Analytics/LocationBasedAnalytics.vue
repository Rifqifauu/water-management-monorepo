<template>
  <div class="dashboard-container">
    <div class="card card-modern">
      <div class="card-header">
        <div class="title-section">
          <h3>Lokasi Perlu Perhatian</h3>
          <span class="subtitle">5 Blok dengan skor monitoring harian terendah</span>
        </div>
        <div class="badge-legend">
          <span class="dot red"></span> &lt; 1.5 Buruk
        </div>
      </div>
      
      <div class="chart-container">
        <Bar
          v-if="loaded"
          id="worst-locations-chart"
          :options="chartOptions"
          :data="chartData"
        />
        <div v-else class="status-display">
           <div v-if="isLoading" class="loader"></div>
           <span v-if="isLoading">Menganalisis data...</span>
           <span v-else>Tidak ada data laporan bulan ini.</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Bar } from 'vue-chartjs'
import { 
  Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale    
} from 'chart.js'
import { useApi } from '@/composables/useApi'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const loaded = ref(false)
const isLoading = ref(false)
const chartData = ref({ labels: [], datasets: [] })

const getWorstLocations = async () => {
  try {
    isLoading.value = true
    const response = await useApi('analytics/stats')
    const rawData = response.data?.harian?.top_locations || []

    if (rawData.length > 0) {
      chartData.value = {
        labels: rawData.map(item => `Blok ${item.blok} (Afd ${item.afdeling})`),
        datasets: [{
          label: 'Skor Kondisi',
          data: rawData.map(item => item.skor),
          // DYNAMIC COLOR LOGIC
          backgroundColor: (context) => {
            const val = context.parsed.x;
            if (val <= 1.5) return '#EF4444'; // Merah (Kritis)
            if (val <= 2.2) return '#F59E0B'; // Oranye (Waspada)
            return '#10B981'; // Hijau (Baik)
          },
          borderRadius: 20, // Membuat ujung bar membulat (pill style)
          barThickness: 12, // Membuat bar lebih ramping & clean
        }]
      }
      loaded.value = true
    }
  } catch (error) {
    console.error("Error:", error)
  } finally {
    isLoading.value = false
  }
}

const chartOptions = ref({
  indexAxis: 'y', 
  responsive: true,
  maintainAspectRatio: false, 
  plugins: {
    legend: { display: false },
    tooltip: {
      backgroundColor: 'rgba(17, 24, 39, 0.9)',
      titleFont: { size: 13, weight: 'bold' },
      bodyFont: { size: 12 },
      padding: 12,
      displayColors: false,
      callbacks: {
        label: (context) => {
          const val = context.parsed.x;
          let status = val <= 1.5 ? 'Buruk' : (val <= 2.2 ? 'Sedang' : 'Baik');
          return ` Skor: ${val} / 3.0 (${status})`;
        }
      }
    }
  },
  scales: {
    x: {
      beginAtZero: true,
      min: 0,
      max: 3,
      grid: { color: '#F3F4F6', borderDash: [4, 4], drawBorder: false },
      ticks: { 
        stepSize: 1,
        color: '#9CA3AF',
        font: { size: 11 }
      } 
    },
    y: {
      grid: { display: false },
      ticks: { 
        font: { family: "'Inter', sans-serif", weight: '500', size: 12 },
        color: '#374151'
      }
    }
  }
})

onMounted(getWorstLocations)
</script>

<style scoped>
@import '~/assets/css/main.css';

.dashboard-container { padding: 20px; width: 100%; }

.card-modern {
  background: white;
  padding: 24px;
  border-radius: 16px;
  border: 1px solid #F1F5F9;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.04);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 28px;
}

h3 { 
  margin: 0; 
  font-size: 15px; 
  color: #1E293B;
  letter-spacing: -0.01em;
  font-weight: 700;
}

.subtitle { font-size: 12px; color: #64748B; margin-top: 4px; display: block; }

.badge-legend {
  font-size: 11px;
  color: #64748B;
  display: flex;
  align-items: center;
  gap: 6px;
  background: #F8FAFC;
  padding: 4px 10px;
  border-radius: 20px;
}

.dot { width: 8px; height: 8px; border-radius: 50%; display: inline-block; }
.dot.red { background: #EF4444; }

.chart-container { position: relative; height: 280px; width: 100%; }

.status-display {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 12px;
  color: #94A3B8;
}

.loader {
  width: 24px;
  height: 24px;
  border: 3px solid #F1F5F9;
  border-top: 3px solid #3B82F6;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>