<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <div class="header-left">
          <h3>Water Level Trend Analysis</h3>
          <span class="subtitle">Historical water level measurements</span>
        </div>
        <div class="header-right">
          <button class="filter-btn">Last 15 Records</button>
        </div>
      </div>
      
      <div class="chart-container" >
        <Line
          id="water-level-chart"
          :options="chartOptions"
          :data="chartData"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Line } from 'vue-chartjs'
import { 
  Chart as ChartJS, 
  Title, 
  Tooltip, 
  Legend, 
  LineElement,    // Ganti BarElement dengan LineElement
  PointElement,   // Tambahkan PointElement untuk titik data
  CategoryScale, 
  LinearScale 
} from 'chart.js'

// Registrasi komponen Chart.js untuk Line Chart
ChartJS.register(Title, Tooltip, Legend, LineElement, PointElement, CategoryScale, LinearScale)

// 1. DATA CHART
const chartData = ref({
  labels: ['05 Des', '06 Des', '07 Des', '08 Des', '09 Des'], // Contoh tanggal
  datasets: [
    {
      label: 'Sungai',
      // Data dummy, sesuaikan dengan logic Anda (contoh nilai 12 cm di tgl 05 Des)
      data: [0, null, null, null, null], 
      borderColor: '#3B82F6', // Warna Biru
      backgroundColor: 'white', // Tengahnya putih
      pointBorderColor: '#3B82F6',
      pointBackgroundColor: 'white',
      pointBorderWidth: 3, // Ketebalan garis lingkaran
      pointRadius: 6,      // Ukuran lingkaran
      pointHoverRadius: 8,
      tension: 0.4         // Membuat garis agak melengkung (halus)
    },
    {
      label: 'Blok',
      data: [0, null, null, null, null], // Data kosong untuk contoh
      borderColor: '#10B981', // Warna Hijau
      backgroundColor: 'white',
      pointBorderColor: '#10B981',
      pointBackgroundColor: 'white',
      pointBorderWidth: 3,
      pointRadius: 6,
      tension: 0.4
    }
  ]
})

// 2. OPSI KONFIGURASI
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: 'top',
      align: 'end', // Taruh legend di pojok kanan atas
      labels: {
        usePointStyle: true, // Gunakan style bulat
        pointStyle: 'circle',
        boxWidth: 8,
        padding: 20,
        font: {
          family: 'Arial',
          size: 14,
          weight: 'bold'
        },
        color: '#374151' // Warna teks legend
      }
    },
    tooltip: {
      mode: 'index',
      intersect: false,
      callbacks: {
        label: function(context) {
          return context.dataset.label + ': ' + context.parsed.y + ' cm';
        }
      }
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      max: 14, // Sesuaikan max tinggi (sedikit di atas 12cm)
      grid: {
        color: '#E5E7EB',
        borderDash: [5, 5], // Membuat garis grid putus-putus
        drawBorder: false   // Hilangkan garis vertikal paling kiri axis
      },
      ticks: {
        stepSize: 2, // Kelipatan 2 (0, 2, 4, 6...)
        color: '#6B7280',
        font: {
          weight: 'bold'
        },
        // Menambahkan text "cm" di samping angka
        callback: function(value) {
          return value + ' cm';
        }
      }
    },
    x: {
      grid: {
        display: false, // Hilangkan grid vertikal
        drawBorder: false
      },
      ticks: {
        color: '#6B7280',
        font: {
          weight: 'bold'
        }
      }
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
  font-family: 'Inter', sans-serif; /* Pastikan font bagus */
}

.card {
  background: white;
  border-radius: 16px; /* Lebih rounded */
  padding: 30px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
  width: 100%;
  max-width: 1100px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 30px;
}

.header-left {
  display: flex;
  flex-direction: column;
}

h3 {
  margin: 0 0 8px 0;
  font-size: 24px;
  font-weight: 800;
  color: #111827;
}

.subtitle {
  font-size: 14px;
  color: #6B7280;
  font-weight: 400;
}

.filter-btn {
  background-color: #DBEAFE; /* Biru muda pucat */
  color: #1E40AF; /* Biru tua text */
  border: none;
  padding: 8px 16px;
  border-radius: 20px;
  font-weight: 600;
  font-size: 13px;
  cursor: pointer;
  transition: all 0.2s;
}

.filter-btn:hover {
  background-color: #BFDBFE;
}

.chart-container {
  position: relative;
  height: 400px; /* Tinggi diperbesar sedikit */
  width: 100%;
}
</style>