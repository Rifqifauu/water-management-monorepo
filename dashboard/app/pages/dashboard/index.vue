<script setup>
import { ref, onMounted, watch, nextTick } from 'vue';
import { useRoute } from 'vue-router';

// Component imports
import Header from '~/components/Header.vue'
import StatsCard from '~/components/StatsCard.vue'
import RecentActivities from '~/components/RecentActivities.vue'
import InfrastructureStatus from '~/components/InfrastructureStatus.vue';
import WLStatusChart from '~/components/WLStatusChart.vue';

const route = useRoute();

// --- STATE FILTER PERIODE ---
const selectedMonth = ref(new Date().getMonth() + 1); // Default: Bulan sekarang (1-12)
const selectedYear = ref(new Date().getFullYear());    // Default: Tahun sekarang

const months = [
  { name: 'Januari', value: 1 }, { name: 'Februari', value: 2 },
  { name: 'Maret', value: 3 }, { name: 'April', value: 4 },
  { name: 'Mei', value: 5 }, { name: 'Juni', value: 6 },
  { name: 'Juli', value: 7 }, { name: 'Agustus', value: 8 },
  { name: 'September', value: 9 }, { name: 'Oktober', value: 10 },
  { name: 'November', value: 11 }, { name: 'Desember', value: 12 }
];

// Generate list 5 tahun terakhir
const years = Array.from({ length: 5 }, (_, i) => new Date().getFullYear() - i);

// --- LOGIKA SCROLL (DARI KODE ANDA) ---
const handleScrollLogic = async () => {
    await nextTick(); 
    const scrollContainer = document.getElementById('main-scroll-container');
    if (!scrollContainer) return;

    if (!route.hash) {
        scrollContainer.scrollTo({ top: 0, left: 0, behavior: 'smooth' });
        return;
    }

    const targetId = route.hash;
    let attempts = 0;
    
    const interval = setInterval(() => {
        const element = document.querySelector(targetId);
        if (element) {
            clearInterval(interval);
            element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
        attempts++;
        if (attempts >= 50) clearInterval(interval); 
    }, 50);
};

onMounted(() => {
    const savedMonth = localStorage.getItem('dashboard-month');
    const savedYear = localStorage.getItem('dashboard-year');

    if (savedMonth) selectedMonth.value = parseInt(savedMonth);
    if (savedYear) selectedYear.value = parseInt(savedYear);
    if ('scrollRestoration' in history) {
        history.scrollRestoration = 'manual'; 
    }
    handleScrollLogic();
});

watch(() => route.fullPath, () => {
    handleScrollLogic();
});

// --- WATCHER UNTUK FILTER ---
// Opsional: Jika Anda ingin melakukan sesuatu (misal: log atau trigger API manual) saat filter berubah
watch([selectedMonth, selectedYear], ([newMonth, newYear]) => {
    console.log(`Filter berubah ke: ${newMonth} / ${newYear}`);
   localStorage.setItem('dashboard-month', newMonth);
    localStorage.setItem('dashboard-year', newYear);
});
</script>

<template>
  <div class="min-h-screen bg-slate-50 pb-12 w-full overflow-x-hidden">
    <Header title="Water Management Dashboard" />

    <main class="w-full">
      
      <section class="w-full px-3 md:px-8 pt-6">
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 bg-white p-5 rounded-xl shadow-sm border border-slate-200">
             <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 mb-6 md:mb-8 px-2">
      <div>
        <h1 class="text-2xl md:text-3xl font-black tracking-tight text-slate-800 uppercase">
          WM Monitoring Status
        </h1>
        <p class="text-xs md:text-sm font-medium text-slate-500 mt-1">
          Monitoring overview from all active locations
        </p>
      </div>
      
    </div>
<div class="grid gap-4">
    <div>
            <h2 class="text-sm font-bold text-slate-700 uppercase tracking-wider">Periode Data</h2>
            <p class="text-slate-500 text-xs">Menampilkan laporan berdasarkan bulan dan tahun terpilih</p>
          </div>
          
          <div class="flex items-center gap-3">
            <div class="relative min-w-[140px]">
              <select 
                v-model="selectedMonth"
                class="w-full bg-slate-50 border border-slate-300 text-slate-700 text-sm rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 block p-2.5 appearance-none outline-none cursor-pointer"
              >
                <option v-for="month in months" :key="month.value" :value="month.value">
                  {{ month.name }}
                </option>
              </select>
              <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-slate-500">
                <svg class="h-4 w-4 fill-current" viewBox="0 0 20 20"><path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/></svg>
              </div>
            </div>

            <div class="relative min-w-[100px]">
              <select 
                v-model="selectedYear"
                class="w-full bg-slate-50 border border-slate-300 text-slate-700 text-sm rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 block p-2.5 appearance-none outline-none cursor-pointer"
              >
                <option v-for="year in years" :key="year" :value="year">
                  {{ year }}
                </option>
              </select>
              <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-slate-500">
                <svg class="h-4 w-4 fill-current" viewBox="0 0 20 20"><path d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"/></svg>
              </div>
            </div>
          </div>
</div>
        
        </div>
      </section>

      <section class="w-full px-3 md:px-8 pt-4 md:pt-4 pb-2 md:pb-4">
        <StatsCard :month="selectedMonth" :year="selectedYear" />
      </section>

      <section class="w-full px-3 md:px-8 py-2 md:py-4">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-4 md:gap-8">
          <div class="w-full min-w-0">
            <WLStatusChart :month="selectedMonth" :year="selectedYear" />
          </div>

          <div id="critical-issues" class="w-full min-w-0 scroll-mt-20 md:scroll-mt-32">
            <InfrastructureStatus :month="selectedMonth" :year="selectedYear" />
          </div>
        </div>
      </section>

      <section class="w-full px-3 md:px-8 py-2 md:py-4">
        <RecentActivities />
      </section>
    </main>
  </div>
</template>

<style scoped>
@import url('~/assets/css/main.css');

/* Force prevent overflow */
main,
section,
section > * {
  max-width: 100% !important;
  overflow-x: hidden;
}

* {
  box-sizing: border-box;
}

/* Memperhalus tampilan select di mobile */
select {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
</style>