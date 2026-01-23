<template>
  <div class="p-4 md:p-6 max-w-7xl mx-auto">
    <div v-if="loading" class="grid grid-cols-2 md:grid-cols-4 gap-4">
      <div v-for="i in 4" :key="i" class="h-32 md:h-48 bg-slate-200 animate-pulse rounded-2xl md:rounded-3xl"></div>
    </div>

    <div v-else class="grid grid-cols-2 md:grid-cols-4 gap-4">
      <NuxtLink
        v-for="(item, index) in stats"
        :key="index"
        to="/dashboard/analytics"
        :class="item.color"
        class="group relative overflow-hidden rounded-2xl md:rounded-3xl p-6 md:p-8 text-white shadow-lg transition-all duration-300 hover:-translate-y-1 hover:shadow-xl border-2 border-white/20"
      >
        <div class="absolute top-4 right-4 z-20">
          <div class="flex items-center justify-center w-10 h-10 md:w-12 md:h-12 bg-white/20 rounded-xl backdrop-blur-md border border-white/10 shadow-inner">
            <component :is="item.iconComponent" />
          </div>
        </div>

        <div class="relative z-10 pr-12">
          <h3 class="text-[10px] md:text-xs font-black uppercase tracking-[0.2em] opacity-80 mb-2">
            {{ item.title }}
          </h3>
          
          <div class="flex items-baseline gap-2">
            <span class="text-3xl md:text-5xl font-black tracking-tighter">
              {{ item.count }}
            </span>
          </div>

          <p class="mt-3 text-[10px] md:text-xs font-bold uppercase tracking-widest opacity-60 leading-tight">
            {{ item.info }}
          </p>
        </div>

        <div class="absolute -bottom-4 -right-4 w-24 h-24 bg-white/5 rounded-full blur-3xl group-hover:bg-white/10 transition-colors"></div>
      </NuxtLink>
    </div>
  </div>
</template>

<script setup>
import { h, ref, computed, onMounted, watch } from 'vue'

// 1. Definisi Props (Menerima input dari dashboard utama)
const props = defineProps({
  month: {
    type: [String, Number],
    required: true
  },
  year: {
    type: [String, Number],
    required: true
  },
})

const response = ref(null)
const loading = ref(true)

// 2. Icons sebagai Functional Components
const SquareIcon = { render() { return h('svg', { viewBox: '0 0 24 24', fill: 'currentColor', class: 'w-6 h-6 md:w-8 md:h-8' }, [h('rect', { x: '3', y: '3', width: '18', height: '18', rx: '2' })]) } }
const StarIcon = { render() { return h('svg', { viewBox: '0 0 24 24', fill: 'currentColor', class: 'w-6 h-6 md:w-8 md:h-8' }, [h('path', { d: 'M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z' })]) } }
const HeartIcon = { render() { return h('svg', { viewBox: '0 0 24 24', fill: 'currentColor', class: 'w-6 h-6 md:w-8 md:h-8' }, [h('path', { d: 'M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z' })]) } }
const CircleIcon = { render() { return h('svg', { viewBox: '0 0 24 24', fill: 'currentColor', class: 'w-6 h-6 md:w-8 md:h-8' }, [h('circle', { cx: '12', cy: '12', r: '10' })]) } }

// 3. Fungsi Fetch Data
const fetchDashboardStats = async () => {
  loading.value = true
  try {
    // Memanggil API dengan parameter month & year
    const res = await useApi('dashboard', {
      params: {
        month: props.month,
        year: props.year,
      }
    })
    response.value = res
  } catch (error) {
    console.error("Gagal memuat data statistik:", error)
  } finally {
    loading.value = false
  }
}

// 4. Watcher untuk mendeteksi perubahan Filter
// Jika props month atau year berubah di parent, fungsi ini akan dijalankan ulang
watch(() => [props.month, props.year], () => {
  fetchDashboardStats()
})

// 5. Lifecycle Hooks
onMounted(() => {
  fetchDashboardStats()
})

// 6. Computed Data untuk UI
const stats = computed(() => {
  const d = response.value?.data || {}
  
  return [
    { 
      title: 'Kelas 1', 
      count: d['Kelas 1'] || 0, 
      info: 'Kondisi Optimal', 
      color: 'bg-gradient-to-br from-emerald-400 to-emerald-600', 
      iconComponent: SquareIcon
    },
    { 
      title: 'Kelas 2', 
      count: d['Kelas 2'] || 0, 
      info: 'Perlu Pantauan', 
      color: 'bg-gradient-to-br from-amber-400 to-orange-500', 
      iconComponent: StarIcon
    },
    { 
      title: 'Kelas 3', 
      count: d['Kelas 3'] || 0, 
      info: 'Tindakan Segera', 
      color: 'bg-gradient-to-br from-rose-400 to-rose-600', 
      iconComponent: HeartIcon
    },
    { 
      title: 'Rata-rata Score', 
      count: d.rata_rata_keseluruhan || 0, 
      info: 'Performa Bulanan', 
      color: 'bg-gradient-to-br from-slate-500 to-slate-700', 
      iconComponent: CircleIcon
    },
  ]
})
</script>

<style scoped>
/* Smooth transition untuk efek hover */
.group {
  -webkit-tap-highlight-color: transparent;
}
</style>