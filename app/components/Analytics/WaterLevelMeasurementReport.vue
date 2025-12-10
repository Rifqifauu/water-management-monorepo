<template>
  <div class="dashboard-container">
    <div class="card">
      <div class="card-header">
        <div>
          <h3>Water Level Measurement Report</h3>
          <p class="subtitle">Detailed water level records with statistics</p>
        </div>
        <button class="export-btn">
          Export Report
        </button>
      </div>

      <div class="table-responsive">
        <table class="data-table">
          <thead>
            <tr>
              <th>Date</th>
              <th>Afdeling</th>
              <th>Block</th>
              <th>Sungai (cm)</th>
              <th>Blok (cm)</th>
              <th>Difference (cm)</th>
              <th>Condition</th>
            </tr>
          </thead>
          <tbody>
            <tr v-if="paginatedData.length === 0">
              <td colspan="7" class="text-center">No data available</td>
            </tr>
            <tr v-for="item in paginatedData" :key="item.id">
              <td>{{ formatDate(item.date) }}</td>
              <td class="font-bold">{{ item.afdeling }}</td>
              <td>{{ item.block }}</td>
              
              <td class="val-river">{{ item.sungai.toFixed(1) }}</td>
              
              <td class="val-block">{{ item.blok.toFixed(1) }}</td>
              
              <td class="val-diff">{{ calculateDiff(item.sungai, item.blok) }}</td>
              
              <td>
                <span :class="['badge', getStatusClass(item.condition)]">
                  {{ item.condition }}
                </span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="pagination-footer">
        <span class="page-info">
          Showing {{ startItem }} to {{ endItem }} of {{ totalItems }} entries
        </span>
        
        <div class="pagination-controls">
          <button 
            @click="prevPage" 
            :disabled="currentPage === 1"
            class="page-btn"
          >
            Previous
          </button>
          
          <button 
            v-for="page in visiblePages" 
            :key="page"
            @click="goToPage(page)"
            :class="['page-number', { active: currentPage === page }]"
          >
            {{ page }}
          </button>

          <button 
            @click="nextPage" 
            :disabled="currentPage === totalPages"
            class="page-btn"
          >
            Next
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// 1. DATA DUMMY KHUSUS WATER LEVEL
const dummyData = Array.from({ length: 45 }, (_, i) => {
  const conditions = ['Baik', 'Perlu Perbaikan', 'Rusak'];
  const afdelings = ['OA', 'OB', 'OC', 'OD', 'OE'];
  
  // Random values for simulation
  const sungai = 150 + Math.random() * 50;
  const blok = 140 + Math.random() * 50;
  
  return {
    id: i + 1,
    date: new Date(2025, 9, 1 + (i % 30)).toISOString(),
    afdeling: afdelings[i % 5],
    block: `Block ${10 + (i % 20)}`,
    sungai: sungai,
    blok: blok,
    condition: conditions[i % 3]
  }
})

// 2. STATE PAGINATION
const itemsPerPage = 5
const currentPage = ref(1)
const totalItems = computed(() => dummyData.length)
const totalPages = computed(() => Math.ceil(totalItems.value / itemsPerPage))

// 3. LOGIC PAGINATION
const paginatedData = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage
  const end = start + itemsPerPage
  return dummyData.slice(start, end)
})

const startItem = computed(() => (currentPage.value - 1) * itemsPerPage + 1)
const endItem = computed(() => Math.min(currentPage.value * itemsPerPage, totalItems.value))

const visiblePages = computed(() => {
  const delta = 2
  const range = []
  for (let i = Math.max(1, currentPage.value - delta); i <= Math.min(totalPages.value, currentPage.value + delta); i++) {
    range.push(i)
  }
  return range
})

// 4. ACTION HANDLERS
const nextPage = () => { if (currentPage.value < totalPages.value) currentPage.value++ }
const prevPage = () => { if (currentPage.value > 1) currentPage.value-- }
const goToPage = (page) => { currentPage.value = page }

// 5. HELPER FORMATTING & CALCULATION
const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('id-ID', {
    day: 'numeric', month: 'short', year: 'numeric'
  })
}

// Menghitung selisih absolute antara sungai dan blok
const calculateDiff = (sungai, blok) => {
  return Math.abs(sungai - blok).toFixed(1)
}

const getStatusClass = (status) => {
  switch (status) {
    case 'Baik': return 'badge-success'
    case 'Perlu Perbaikan': return 'badge-warning'
    case 'Rusak': return 'badge-danger'
    default: return 'badge-default'
  }
}
</script>
<style scoped>
@import url('~/assets/css/table.css');
</style>