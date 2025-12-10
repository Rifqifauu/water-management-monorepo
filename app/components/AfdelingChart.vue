<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <h3>Afdeling Performance</h3>
        <span class="subtitle">By Location</span>
      </div>
      
      <div class="chart-container">
        <Bar
          id="afdeling-chart"
          :options="chartOptions"
          :data="chartData"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
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

// Registrasi komponen Chart.js
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

// 1. DATA CHART
// Kita buat 3 dataset untuk mewakili: Baik, Perlu Perbaikan, Rusak
const chartData = ref({
  labels: ['Baik', 'Perlu Perbaikan', 'Rusak'], // Label Kategori
  datasets: [
    {
      label: '',
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

// 2. OPSI KONFIGURASI
// 2. OPSI KONFIGURASI
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: 'bottom',
      // Tambahkan handler onClick null agar saat legend diklik tidak menyembunyikan dataset
      onClick: null, 
      labels: {
        usePointStyle: true,
        padding: 20,
        font: {
          family: 'Arial',
          size: 12
        },
        // --- TAMBAHKAN BAGIAN INI ---
        generateLabels: (chart) => {
          const data = chart.data;
          if (data.labels.length && data.datasets.length) {
            // Kita ambil label dari chartData.labels ('Baik', dll)
            // Dan warna dari chartData.datasets[0].backgroundColor
            return data.labels.map((label, i) => {
              const ds = data.datasets[0];
              const color = ds.backgroundColor[i];
              
              return {
                text: label,           // Nama label: "Baik", "Rusak", dll
                fillStyle: color,      // Warna isi bulat
                strokeStyle: color,    // Warna garis pinggir
                lineWidth: 0,
                hidden: false,         // Selalu tampilkan
                index: i               // Index data
              };
            });
          }
          return [];
        }
        // -----------------------------
      }
    },
    tooltip: {
      mode: 'index',
      intersect: false,
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      max: 1.0, 
      grid: {
        color: '#f3f3f3',
      },
      ticks: {
        stepSize: 0.1
      }
    },
    x: {
      grid: {
        display: false
      }
    }
  }
})
</script>

<style scoped>
/* Styling sederhana agar terlihat seperti Card putih di gambar */
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
  max-width: 600px; /* Atur lebar sesuai kebutuhan */
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
  height: 300px; /* Penting untuk maintainAspectRatio: false */
  width: 100%;
}
</style>