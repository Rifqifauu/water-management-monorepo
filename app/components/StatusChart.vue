<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <h3>Status Distribution</h3>
        <span class="subtitle">Current Overview</span>
      </div>
      
      <div class="chart-container">
        <Doughnut
          id="status-pie-chart"
          :options="chartOptions"
          :data="chartData"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Doughnut } from 'vue-chartjs'
import { 
  Chart as ChartJS, 
  Title, 
  Tooltip, 
  Legend, 
  ArcElement 
} from 'chart.js'

// Registrasi komponen Chart.js (Hapus CategoryScale & LinearScale karena tidak dipakai di Pie)
ChartJS.register(Title, Tooltip, Legend, ArcElement)

// 3. DATA CHART
const chartData = ref({
  labels: ['Baik', 'Perlu Perbaikan', 'Rusak'], // Label Kategori
  datasets: [
    {
      label: 'Jumlah Unit',
      data: [0, 0, 0],
      backgroundColor: [
        '#10B981', 
        '#F59E0B', 
        '#EF4444' 
      ],
      hoverOffset: 4
    }
  ]
})

// 4. OPSI KONFIGURASI
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
          family: 'Arial',
          size: 12
        }
      }
    },
    tooltip: {
      callbacks: {
        label: function(context) {
          let label = context.label || '';
          if (label) {
            label += ': ';
          }
          let value = context.parsed;
          label += value ; // Tambahkan simbol persen atau unit lain
          return label;
        }
      }
    }
  },
  // Hapus bagian 'scales' (x dan y) karena Pie Chart tidak punya sumbu kartesius
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
  max-width: 400px; /* Lebar max dikecilkan sedikit agar Pie Chart terlihat proporsional */
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
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
  height: 300px; 
  width: 100%;
}
</style>