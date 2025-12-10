<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <div>
          <h3>Infrastructure vs Water Level</h3>
          <p class="subtitle">Condition comparison by type</p>
        </div>
      </div>
      
      <div class="chart-container">
        <Bar
          id="comparison-chart"
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

// Register komponen yang dibutuhkan
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

// 1. DATA DUMMY (Sesuai contoh di dashboard asli)
// "Infrastructure" vs "Water Level" conditions
const infraStats = { baik: 12, perbaikan: 5, rusak: 2 }
const waterStats = { baik: 8, perbaikan: 3, rusak: 1 }

// 2. KONFIGURASI DATA CHART
const chartData = computed(() => {
  return {
    labels: ['Baik', 'Perlu Perbaikan', 'Rusak'],
    datasets: [
      {
        label: 'Infrastructure',
        data: [infraStats.baik, infraStats.perbaikan, infraStats.rusak],
        backgroundColor: '#3B82F6', // Blue-500
        borderRadius: 6,
        barPercentage: 0.6,
        categoryPercentage: 0.8
      },
      {
        label: 'Water Level',
        data: [waterStats.baik, waterStats.perbaikan, waterStats.rusak],
        backgroundColor: '#10B981', // Green-500
        borderRadius: 6,
        barPercentage: 0.6,
        categoryPercentage: 0.8
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
        usePointStyle: true,
        padding: 20,
        font: {
          family: 'Inter, sans-serif',
          size: 12,
          weight: '600'
        },
        color: '#4B5563' // Gray-600
      }
    },
    tooltip: {
      backgroundColor: 'rgba(17, 24, 39, 0.9)', // Gray-900
      padding: 12,
      cornerRadius: 8,
      titleFont: { size: 13 },
      bodyFont: { size: 12 }
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      grid: {
        color: '#F3F4F6', // Gray-100
        drawBorder: false
      },
      ticks: {
        font: { size: 11 },
        color: '#6B7280'
      }
    },
    x: {
      grid: {
        display: false
      },
      ticks: {
        font: { size: 12, weight: '500' },
        color: '#374151'
      }
    }
  },
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
  max-width: 500px;
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
  letter-spacing: -0.025em;
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