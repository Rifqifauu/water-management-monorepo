<script setup lang="ts">
import { ref, watch, computed, onMounted } from 'vue'

/**
 * TIDE WIDGET COMPONENT
 * Fitur: SSR Safe, Dark Mode, Auto-cache, Responsive
 */

// --- 1. Definisi Tipe Data ---
interface TideHeight {
  dt: number
  height: number
}

interface TideExtreme {
  dt: number
  height: number
  type: 'High' | 'Low'
}

interface WorldTidesResponse {
  status?: number
  error?: string
  heights?: TideHeight[]
  extremes?: TideExtreme[]
}

interface CacheData {
  timestamp: number
  data: WorldTidesResponse
}

// --- 2. State & Hooks ---
const { coords } = useLocation() // Diasumsikan auto-import dari composables
const loading = ref<boolean>(false)
const errorMsg = ref<string | null>(null)
const tideData = ref<WorldTidesResponse | null>(null)

const CACHE_KEY = 'kebun_gis_tides_cache'
const CACHE_DURATION = 60 * 60 * 1000 // 1 Jam

// --- 3. Computed Properties ---

// Mengambil data ketinggian air paling awal (saat ini)
const currentHeight = computed(() => {
  return tideData.value?.heights?.[0]?.height?.toFixed(2) ?? '-'
})

// Mencari kejadian ekstrim (pasang/surut) berikutnya
const nextExtreme = computed(() => {
  if (!tideData.value?.extremes) return null
  const nowUnix = Math.floor(Date.now() / 1000)
  return tideData.value.extremes.find(ex => ex.dt > nowUnix) || tideData.value.extremes[0]
})

const extremeTime = computed(() => {
  if (!nextExtreme.value) return '-'
  return new Date(nextExtreme.value.dt * 1000).toLocaleTimeString('id-ID', {
    hour: '2-digit',
    minute: '2-digit',
  })
})

const extremeDate = computed(() => {
  if (!nextExtreme.value) return '-'
  return new Date(nextExtreme.value.dt * 1000).toLocaleDateString('id-ID', {
    weekday: 'short',
    day: 'numeric',
    month: 'short',
  })
})

// --- 4. Fungsi Fetching (SSR Safe) ---
const fetchTideData = async (lat: number, lng: number) => {
  // Guard Clause: Mencegah eksekusi di server (LocalStorage error)
  if (!import.meta.client || !lat || !lng || lat === 0) return
  
  errorMsg.value = null
  
  // A. Cek Cache di LocalStorage
  const cached = localStorage.getItem(CACHE_KEY)
  if (cached) {
    try {
      const parsed: CacheData = JSON.parse(cached)
      if (Date.now() - parsed.timestamp < CACHE_DURATION) {
        tideData.value = parsed.data
        return
      }
    } catch (e) {
      localStorage.removeItem(CACHE_KEY)
    }
  }

  // B. Hit API WorldTides
  loading.value = true
  try {
    const apiKey = '7f90c801-6e70-4e74-9569-770df53bdd32' 
    const url = `https://www.worldtides.info/api/v3?heights&extremes&lat=${lat}&lon=${lng}&days=1&step=3600&key=${apiKey}&localtime`
    
    const res = await fetch(url)
    if (!res.ok) throw new Error("Gagal menghubungi server WorldTides")
    
    const data = (await res.json()) as WorldTidesResponse
    if (data.error) throw new Error(data.error)

    tideData.value = data
    
    // Simpan ke Cache
    localStorage.setItem(CACHE_KEY, JSON.stringify({
      timestamp: Date.now(),
      data: data
    }))
  } catch (err: any) {
    errorMsg.value = err.message || "Gagal mengambil data pasang surut"
    console.error("Tide Error:", err)
  } finally {
    loading.value = false
  }
}

// --- 5. Watcher & Lifecycle ---

// Watcher lokasi: fetch data saat koordinat berubah
watch(() => coords.value, (newCoords) => {
  if (newCoords?.lat && newCoords?.lng) {
    fetchTideData(newCoords.lat, newCoords.lng)
  }
}, { deep: true })

// Jalankan saat komponen terpasang di Browser
onMounted(() => {
  if (coords.value?.lat && coords.value?.lng) {
    fetchTideData(coords.value.lat, coords.value.lng)
  }
})
</script>

<template>
  <div class="w-full bg-white/90 dark:bg-slate-900/40 backdrop-blur-md rounded-2xl border border-slate-200 dark:border-slate-800 p-4 font-sans transition-all duration-300 shadow-sm">
    
    <div class="flex items-center justify-between mb-4 border-b border-slate-100 dark:border-slate-800/50 pb-2">
      <h3 class="flex items-center gap-2 font-bold text-slate-700 dark:text-slate-200 text-xs uppercase tracking-wider">
        <UIcon name="i-heroicons-swatch" class="text-blue-500 w-4 h-4" /> 
        Pasang Surut
      </h3>
      <div v-if="loading" class="flex items-center">
        <UIcon name="i-heroicons-arrow-path" class="w-3.5 h-3.5 animate-spin text-blue-500" />
      </div>
    </div>

    <div v-if="errorMsg" class="mb-3 p-2.5 bg-red-50 dark:bg-red-900/20 text-red-600 dark:text-red-400 rounded-xl border border-red-100 dark:border-red-900/30 text-[10px] flex items-start gap-2">
      <UIcon name="i-heroicons-exclamation-triangle" class="w-4 h-4 flex-shrink-0" />
      <span>{{ errorMsg }}</span>
    </div>

    <div v-if="tideData" class="space-y-4 animate-in fade-in duration-500">
      
      <div class="text-center py-3 bg-gradient-to-b from-slate-50 to-white dark:from-slate-800/50 dark:to-slate-800/30 rounded-2xl border border-slate-100 dark:border-slate-700/50">
        <span class="text-[9px] text-slate-400 dark:text-slate-500 uppercase tracking-[0.2em] font-black">Level Air Sekarang</span>
        <div class="flex items-baseline justify-center gap-1 mt-1">
          <span class="text-4xl font-black text-slate-800 dark:text-white tracking-tighter">{{ currentHeight }}</span>
          <span class="text-sm font-bold text-blue-500">m</span>
        </div>
        <div class="flex items-center justify-center gap-2 mt-2">
          <p class="text-[9px] font-mono text-slate-400 dark:text-slate-500 bg-slate-100 dark:bg-slate-700 px-2 py-0.5 rounded-full">
            {{ coords?.lat?.toFixed(4) }}, {{ coords?.lng?.toFixed(4) }}
          </p>
        </div>
      </div>

      <div v-if="nextExtreme" class="group relative overflow-hidden transition-all duration-300">
        <div class="relative p-3.5 rounded-2xl border border-slate-100 dark:border-slate-800 bg-white dark:bg-slate-800/60 shadow-sm transition-all group-hover:border-blue-200 dark:group-hover:border-blue-800">
          
          <div class="flex justify-between items-center mb-3">
            <div class="flex items-center gap-2">
              <div :class="nextExtreme.type === 'High' ? 'bg-rose-500 shadow-rose-500/20' : 'bg-emerald-500 shadow-emerald-500/20'" 
                   class="w-2.5 h-2.5 rounded-full shadow-lg animate-pulse"></div>
              <span class="text-[10px] font-black text-slate-600 dark:text-slate-300 uppercase tracking-tight">
                {{ nextExtreme.type === 'High' ? 'Pasang Berikutnya' : 'Surut Berikutnya' }}
              </span>
            </div>
            <span class="text-[9px] font-bold text-slate-400 dark:text-slate-500">{{ extremeDate }}</span>
          </div>

          <div class="flex justify-between items-end">
            <div class="flex flex-col">
              <div class="flex items-baseline gap-1">
                <span class="text-2xl font-black text-slate-800 dark:text-white leading-none">{{ extremeTime }}</span>
                <span class="text-[10px] font-bold text-slate-400 uppercase tracking-tighter">WIB</span>
              </div>
            </div>
            <div class="text-right">
              <span class="text-[8px] text-slate-400 dark:text-slate-500 block font-black uppercase mb-0.5">Prediksi</span>
              <span class="text-lg font-black text-blue-600 dark:text-blue-400 leading-none">{{ nextExtreme.height.toFixed(2) }}m</span>
            </div>
          </div>
          
        </div>
      </div>
    </div>

    <div v-else class="space-y-3">
      <div class="h-20 bg-slate-100 dark:bg-slate-800/50 animate-pulse rounded-2xl"></div>
      <div class="h-16 bg-slate-50 dark:bg-slate-800/30 animate-pulse rounded-2xl"></div>
    </div>

    <div class="mt-4 pt-3 border-t border-slate-100 dark:border-slate-800/50 flex justify-between items-center text-[9px]">
      <div class="flex items-center gap-1 text-slate-400">
        <UIcon name="i-heroicons-check-badge" class="w-3 h-3 text-emerald-500" />
        <span>Update Otomatis</span>
      </div>
      <button 
        @click="() => fetchTideData(coords.lat, coords.lng)" 
        class="flex items-center gap-1 text-blue-500 hover:text-blue-600 dark:hover:text-blue-400 font-bold transition-colors active:scale-95"
      >
        <UIcon name="i-heroicons-arrow-path-20-solid" class="w-3 h-3" /> Segarkan
      </button>
    </div>
  </div>
</template>

<style scoped>
/* Optional: Menambahkan animasi fade-in yang halus */
.animate-in {
  animation-duration: 0.5s;
  animation-fill-mode: both;
}
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(5px); }
  to { opacity: 1; transform: translateY(0); }
}
.fade-in {
  animation-name: fadeIn;
}
</style>