<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <div>
          <h3>Location-based Analysis</h3>
          <p class="subtitle">Data distribution by afdeling</p>
        </div>
      </div>
      
      <div class="chart-container">
        <Bar
          id="location-analysis-chart"
          :options="chartOptions"
          :data="chartData"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
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

// Register komponen Chart.js
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

// 1. DATA DUMMY
// Merepresentasikan jumlah record per Afdeling
const locationData = [
  { name: 'Afdeling OA', infra: 15, water: 10 },
  { name: 'Afdeling OB', infra: 8, water: 12 },
  { name: 'Afdeling OC', infra: 20, water: 5 },
  { name: 'Afdeling OD', infra: 12, water: 15 },
  { name: 'Afdeling OE', infra: 5, water: 8 }
]

// 2. TRANSFORMASI DATA
const chartData = computed(() => {
  return {
    // Ambil nama Afdeling sebagai label sumbu X
    labels: locationData.map(d => d.name),
    datasets: [
      {
        label: 'Infrastructure',
        data: locationData.map(d => d.infra),
        backgroundColor: '#3B82F6', // Blue-500
        borderRadius: 4,
        barPercentage: 0.6,
        categoryPercentage: 0.7
      },
      {
        label: 'Water Level',
        data: locationData.map(d => d.water),
        backgroundColor: '#10B981', // Green-500
        borderRadius: 4,
        barPercentage: 0.6,
        categoryPercentage: 0.7
      }
    ]
  }
})

// 3. KONFIGURASI OPTIONS
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: 'bottom',
      labels: {
        usePointStyle: true, // Icon bulat
        padding: 20,
        font: {
          family: 'Inter, sans-serif',
          size: 12,
          weight: '600'
        },
        color: '#4B5563'
      }
    },
    tooltip: {
      backgroundColor: 'rgba(17, 24, 39, 0.9)',
      padding: 12,
      cornerRadius: 8,
      titleFont: { size: 13 },
      bodyFont: { size: 12 },
      displayColors: true
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      grid: {
        color: '#F3F4F6', // Garis grid halus
        drawBorder: false
      },
      ticks: {
        font: { size: 11 },
        color: '#6B7280'
      }
    },
    x: {
      grid: {
        display: false // Hilangkan grid vertikal agar lebih bersih
      },
      ticks: {
        font: { size: 11, weight: '500' },
        color: '#374151'
      }
    }
  },
  // Interaction mode 'index' penting agar saat hover di satu afdeling,
  // muncul tooltip untuk Infra DAN Water sekaligus
  interaction: {
    mode: 'index',
    intersect: false,
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
  border-radius: 16px;
  padding: 24px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  width: 100%;
  max-width: 800px; /* Lebar max agak dibesarkan karena kolomnya banyak */
  transition: all 0.3s ease;
}

.card:hover {
  box-shadow: 0 12px 24px rgba(0,0,0,0.1);
}

.card-header {
  margin-bottom: 24px;
}

h3 {
  margin: 0;
  font-size: 20px;
  font-weight: 700;
  color: #111827;
}

.subtitle {
  margin: 4px 0 0 0;
  font-size: 12px;
  color: #6B7280;
  font-weight: 500;
}

.chart-container {
  position: relative;
  height: 300px;
  width: 100%;
}
</style>