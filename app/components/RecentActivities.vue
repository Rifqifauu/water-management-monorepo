<template>
  <div class="card">
    <div class="card-header">
      <h3>Recent Activities</h3>
      <span class="meta-text">Last 5 entries</span>
    </div>

    <div class="activity-list">
      <div 
        v-for="(item, index) in activities" 
        :key="index" 
        class="activity-item"
      >
        <div class="icon-box">
          </div>

        <div class="content">
          <div class="item-title">{{ item.value }}</div>
          <div class="item-subtitle">
            {{ item.label }} &bull; {{ item.date }}
          </div>
        </div>

        <div class="status-badge" :class="getStatusClass(item.status)">
          {{ item.status }}
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// Data Dummy (Bisa diganti dengan props atau fetch API)
const activities = ref([
  {
    value: '12 - 12',
    label: 'Tes',
    date: '5 Des 2025',
    status: 'Baik'
  },
  // Contoh data lain untuk melihat list (opsional)
  // {
  //   value: '10 - 15',
  //   label: 'Cek Rutin',
  //   date: '4 Des 2025',
  //   status: 'Perlu Perbaikan'
  // }
])

// Helper untuk warna badge status dinamis
const getStatusClass = (status) => {
  switch (status) {
    case 'Baik':
      return 'badge-success'
    case 'Rusak':
      return 'badge-danger'
    case 'Perlu Perbaikan':
      return 'badge-warning'
    default:
      return 'badge-default'
  }
}
</script>

<style scoped>
/* Container Utama (Card Putih Besar) */
.card {
  background: white;
  border-radius: 16px;
  padding: 24px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05); /* Shadow halus */
  width: 100%;
  font-family: 'Inter', sans-serif; /* Pastikan font sesuai project */
}

/* Header Styles */
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

h3 {
  margin: 0;
  font-size: 20px;
  font-weight: 700;
  color: #111827; /* Dark Gray */
}

.meta-text {
  font-size: 13px;
  color: #6B7280; /* Gray 500 */
  font-weight: 500;
}

/* List Item Styles */
.activity-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.activity-item {
  display: flex;
  align-items: center;
  padding: 16px;
  border: 1px solid #F3F4F6; /* Border abu-abu sangat muda */
  border-radius: 12px;
  transition: background-color 0.2s;
}

.activity-item:hover {
  background-color: #F9FAFB;
}

/* Icon Box (Kotak Hijau Kiri) */
.icon-box {
  width: 48px;
  height: 48px;
  background-color: #DCFCE7; /* Hijau muda pudar (Tailwind green-100) */
  border-radius: 10px;
  margin-right: 16px;
  flex-shrink: 0;
}

/* Content Text */
.content {
  flex-grow: 1; /* Mengisi ruang tengah */
}

.item-title {
  font-size: 16px;
  font-weight: 700;
  color: #111827;
  margin-bottom: 4px;
}

.item-subtitle {
  font-size: 14px;
  color: #6B7280;
  font-weight: 400;
}

/* Status Badge (Pill Kanan) */
.status-badge {
  padding: 6px 16px;
  border-radius: 9999px; /* Pill shape */
  font-size: 12px;
  font-weight: 600;
  white-space: nowrap;
}

/* Warna-warna Badge */
.badge-success {
  background-color: #DCFCE7; /* Hijau muda background */
  color: #166534;            /* Hijau tua text */
}

.badge-warning {
  background-color: #FEF3C7;
  color: #92400E;
}

.badge-danger {
  background-color: #FEE2E2;
  color: #991B1B;
}

.badge-default {
  background-color: #F3F4F6;
  color: #374151;
}
</style>