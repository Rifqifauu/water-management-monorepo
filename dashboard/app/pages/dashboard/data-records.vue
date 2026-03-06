<template>
  <Header title="Data Records" />

  <div class="container p-6">

    <!-- Tombol Switch -->
    <div class="flex gap-3 mb-4">
      <button 
        @click="selectedTable = 'daily'"
        :class="selectedTable === 'daily' 
          ? 'bg-blue-600 text-white px-4 py-2 rounded-lg' 
          : 'bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300'">
        Daily Report
      </button>

      <button 
        @click="selectedTable = 'weekly'"
        :class="selectedTable === 'weekly' 
          ? 'bg-blue-600 text-white px-4 py-2 rounded-lg' 
          : 'bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300'">
        Weekly Report
      </button>
      <button 
        @click="selectedTable = 'water-level'"
        :class="selectedTable === 'water-level' 
          ? 'bg-blue-600 text-white px-4 py-2 rounded-lg' 
          : 'bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300'">
        Water Level Report
      </button>
    </div>

    <!-- Tabel berganti -->
    <DailyReportTable v-if="selectedTable === 'daily'" />
    <WeeklyReportTable v-if="selectedTable === 'weekly'" />
    <WaterLevelTable v-if="selectedTable === 'water-level'" />

  </div>
</template>

<script setup>
import { ref } from 'vue'

import DailyReportTable from '@/components/DataRecords/DailyReportTable.vue'
import WeeklyReportTable from '@/components/DataRecords/WeeklyReportTable.vue'
import WaterLevelTable from '~/components/DataRecords/WaterLevelTable.vue';
const selectedTable = ref('daily') // default yg muncul
</script>
