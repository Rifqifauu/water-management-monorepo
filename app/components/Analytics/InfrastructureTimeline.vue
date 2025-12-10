<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <div>
          <h3>Infrastructure Timeline</h3>
          <p class="subtitle">Recent infrastructure entries</p>
        </div>
      </div>
      
      <div class="chart-container">
        <Bar
          id="infra-timeline-chart"
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

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const recentInfraData = [
  { date: '2025-10-01', condition: 'Baik' },
  { date: '2025-10-03', condition: 'Baik' },
  { date: '2025-10-05', condition: 'Perlu Perbaikan' },
  { date: '2025-10-06', condition: 'Baik' },
  { date: '2025-10-08', condition: 'Rusak' },
  { date: '2025-10-10', condition: 'Baik' },
  { date: '2025-10-12', condition: 'Perlu Perbaikan' },
  { date: '2025-10-14', condition: 'Baik' },
  { date: '2025-10-15', condition: 'Baik' },
  { date: '2025-10-16', condition: 'Baik' }
]

const getColor = (condition) => {
  switch (condition) {
    case 'Baik': return '#10B981'
    case 'Perlu Perbaikan': return '#F59E0B'
    case 'Rusak': return '#EF4444'
    default: return '#E5E7EB'
  }
}

// --- BAGIAN INI DIMODIFIKASI UNTUK LEBAR BAR ---
const chartData = computed(() => {
  return {
    labels: recentInfraData.map(item => {
      const d = new Date(item.date)
      return d.toLocaleDateString('id-ID', { day: '2-digit', month: 'short' })
    }),
    datasets: [
      {
        label: 'Infrastructure Entries',
        data: recentInfraData.map(() => 1),
        backgroundColor: recentInfraData.map(item => getColor(item.condition)),
        borderRadius: 8,
        barPercentage: 0.8,      // 0.1 sampai 1.0 (Semakin besar, semakin lebar barnya)
        categoryPercentage: 0.8,  // Menggunakan seluruh lebar kategori
        
        borderSkipped: false
      }
    ]
  }
})

// --- BAGIAN INI DIMODIFIKASI UNTUK TINGGI BAR ---
const chartOptions = ref({
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: { display: false },
    tooltip: {
      callbacks: {
        label: (context) => {
          const index = context.dataIndex
          const item = recentInfraData[index]
          return `Status: ${item.condition}`
        }
      }
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      
    
      max: 1.1, 
      
      ticks: {
        display: false,
        stepSize: 1
      },
      grid: {
        color: '#f3f4f6',
        drawBorder: false
      }
    },
    x: {
      grid: { display: false },
      ticks: {
        font: { size: 11 }
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
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
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
  /* Anda juga bisa menambah tinggi pixel di sini jika ingin chart secara fisik lebih besar */
  height: 250px; 
  width: 100%;
}
</style>