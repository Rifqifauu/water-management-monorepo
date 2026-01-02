<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'

/**
 * TIDE WIDGET - ENHANCED UI VERSION
 */

// --- 1. DEFINISI TYPE & INTERFACE ---
interface RawTideResponse {
  waktu: string
  tinggi: string
}

interface TideItem {
  originalTime: string
  heightString: string
  val: number
  date: Date
  isHigh: boolean
  isLow: boolean
}

type TideTrend = 'rising' | 'falling' | 'stable'

// --- 2. STATE ---
const loading = ref<boolean>(false)
const errorMsg = ref<string | null>(null)
const tideData = ref<TideItem[]>([])

// --- 3. HELPER FUNCTIONS ---

const parseBmkgDate = (str: string): Date => {
  const cleanStr = str.replace(' WITA', '').trim()
  return new Date(cleanStr)
}

const formatTime = (date: Date): string => {
  return date.toLocaleTimeString('id-ID', { hour: '2-digit', minute: '2-digit' }).replace('.', ':')
}

// --- 4. COMPUTED PROPERTIES ---

// Data Saat Ini (Closest to Now)
const currentTide = computed<TideItem | null>(() => {
  if (tideData.value.length === 0) return null
  const now = new Date().getTime()
  
  return tideData.value.reduce((prev, curr) => {
    const prevDiff = Math.abs(prev.date.getTime() - now)
    const currDiff = Math.abs(curr.date.getTime() - now)
    return currDiff < prevDiff ? curr : prev
  })
})

// Menentukan Trend
const tideTrend = computed<TideTrend>(() => {
  const current = currentTide.value
  if (!current || tideData.value.length === 0) return 'stable'
  
  const idx = tideData.value.findIndex(item => item === current)
  if (idx === -1 || idx >= tideData.value.length - 1) return 'stable'

  const nextItem = tideData.value[idx + 1]
  if (!nextItem) return 'stable'

  if (nextItem.val > current.val) return 'rising'
  if (nextItem.val < current.val) return 'falling'
  return 'stable'
})

const nextExtreme = computed<TideItem | undefined>(() => {
  if (tideData.value.length === 0) return undefined
  const now = new Date()
  return tideData.value.find(item => {
    return item.date > now && (item.isHigh || item.isLow)
  })
})

const forecastData = computed<TideItem[]>(() => {
  const current = currentTide.value
  if (!current) return []
    const currentIdx = tideData.value.indexOf(current)
  if (currentIdx === -1) return []
  return tideData.value.slice(currentIdx + 1, currentIdx + 7)
})

const getBarHeight = (val: number): string => {
  const data = forecastData.value.map(d => d.val)
  if (data.length === 0) return '0%'

  const min = Math.min(...data)
  const max = Math.max(...data)
  
  // Jika datar (min == max), set setengah
  if (max === min) return '50%'

  // Normalisasi: (val - min) / (range)
  const percent = ((val - min) / (max - min)) * 100
  
  // Pastikan minimal ada tinggi dikit (10%) biar bar-nya kelihatan
  const adjusted = Math.max(percent, 10) 
  
  return `${adjusted}%`
}

// --- 6. FETCHING LOGIC ---

const fetchTideData = async () => {
  loading.value = true
  errorMsg.value = null
  
  try {
    const { data } = await axios.get<RawTideResponse[]>('https://api.palmwateros-tap.com/api/gis/tide-samarinda')
    
    if (!Array.isArray(data)) throw new Error("Format data tidak valid")

    const processed: TideItem[] = data.map((item) => {
      const val = parseFloat(item.tinggi)
      return {
        originalTime: item.waktu,
        heightString: item.tinggi,
        val: isNaN(val) ? 0 : val,
        date: parseBmkgDate(item.waktu),
        isHigh: false, 
        isLow: false
      }
    })

    // SORTING (PENTING: Pastikan urut waktu agar forecast bener)
    processed.sort((a, b) => a.date.getTime() - b.date.getTime())

    // Peak Detection
    for (let i = 1; i < processed.length - 1; i++) {
      const prevItem = processed[i - 1]
      const currItem = processed[i]
      const nextItem = processed[i + 1]

      if (prevItem && currItem && nextItem) {
        const prev = prevItem.val
        const curr = currItem.val
        const next = nextItem.val

        if (curr > prev && curr > next) currItem.isHigh = true
        else if (curr < prev && curr < next) currItem.isLow = true
      }
    }

    tideData.value = processed

  } catch (err: any) {
    console.error("Tide fetch error:", err)
    errorMsg.value = "Gagal memuat data BMKG."
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  fetchTideData()
})
</script>

<template>
  <div class="relative w-full overflow-hidden bg-white/95 dark:bg-slate-900/90 backdrop-blur-xl rounded-2xl border border-slate-200 dark:border-slate-800 p-5 font-sans shadow-lg transition-all duration-300">
    
    <div class="flex items-center justify-between mb-6 pb-3 border-b border-slate-100 dark:border-slate-800/60">
      <div class="flex items-center gap-3">
        <div class="p-2 bg-blue-50 dark:bg-blue-900/20 rounded-xl text-blue-600 dark:text-blue-400">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <path d="M2 12c.6 0 1.2.4 1.6 1 .7 1.3 2 2.3 3.6 2.3s2.9-1 3.6-2.3c.4-.6 1-.9 1.6-.9s1.2.4 1.6 1c.7 1.3 2 2.3 3.6 2.3s2.9-1 3.6-2.3c.4-.6 1-.9 1.6-.9s1.2.4 1.6 1"></path>
            <path d="M2 7c.6 0 1.2.4 1.6 1 .7 1.3 2 2.3 3.6 2.3s2.9-1 3.6-2.3c.4-.6 1-.9 1.6-.9s1.2.4 1.6 1c.7 1.3 2 2.3 3.6 2.3s2.9-1 3.6-2.3c.4-.6 1-.9 1.6-.9s1.2.4 1.6 1"></path>
          </svg>
        </div>
        <div>
          <h3 class="font-bold text-slate-800 dark:text-white text-sm tracking-wide">
            Pasang Surut
          </h3>
          <p class="text-[10px] font-medium text-slate-400 dark:text-slate-500">
            Samarinda &middot; Ref. Kutai Timur
          </p>
        </div>
      </div>
      
      <div v-if="!loading" class="px-2.5 py-1 rounded-lg bg-slate-100 dark:bg-slate-800 border border-slate-200 dark:border-slate-700">
        <span class="text-[10px] font-bold text-slate-600 dark:text-slate-300">WITA</span>
      </div>
    </div>

    <div v-if="currentTide" class="space-y-6 animate-in">
      
      <div class="flex items-end justify-between px-1">
        
        <div>
          <span class="text-[10px] font-bold text-slate-400 dark:text-slate-500 uppercase tracking-wider mb-1 block">
            Permukaan Air (MSL)
          </span>
          <div class="flex items-baseline gap-1.5">
            <span class="text-4xl font-black text-slate-800 dark:text-white tracking-tighter">
              {{ currentTide.val.toFixed(2) }}
            </span>
            <span class="text-sm font-bold text-slate-500 dark:text-slate-400">m</span>
          </div>
          <div class="flex items-center gap-1.5 mt-2">
            <div class="w-1.5 h-1.5 rounded-full bg-blue-500 animate-pulse"></div>
            <p class="text-[11px] font-mono font-medium text-slate-500 dark:text-slate-400">
               {{ formatTime(currentTide.date) }}
            </p>
          </div>
        </div>

        <div class="text-right">
          <div v-if="tideTrend === 'rising'" class="flex flex-col items-end gap-1">
            <div class="p-2 rounded-full bg-rose-50 dark:bg-rose-900/20 text-rose-500 border border-rose-100 dark:border-rose-900/30">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="m18 15-6-6-6 6"/></svg>
            </div>
            <span class="text-[10px] font-bold text-rose-600 dark:text-rose-400 uppercase">Air Pasang</span>
          </div>
          
          <div v-else-if="tideTrend === 'falling'" class="flex flex-col items-end gap-1">
            <div class="p-2 rounded-full bg-emerald-50 dark:bg-emerald-900/20 text-emerald-500 border border-emerald-100 dark:border-emerald-900/30">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="m6 9 6 6 6-6"/></svg>
            </div>
            <span class="text-[10px] font-bold text-emerald-600 dark:text-emerald-400 uppercase">Air Surut</span>
          </div>

          <div v-else class="flex flex-col items-end gap-1">
             <div class="p-2 rounded-full bg-slate-50 text-slate-400">
               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14"/></svg>
             </div>
            <span class="text-[10px] font-bold text-slate-400 uppercase">Stabil</span>
          </div>
        </div>
      </div>

      <div v-if="nextExtreme" class="relative overflow-hidden p-4 bg-gradient-to-r from-slate-50 to-white dark:from-slate-800/50 dark:to-slate-800/30 rounded-xl border border-slate-100 dark:border-slate-700/50">
        <div class="flex items-center justify-between relative z-10">
          <div class="flex items-center gap-3">
             <div :class="nextExtreme.isHigh ? 'bg-rose-500 shadow-rose-500/40' : 'bg-emerald-500 shadow-emerald-500/40'" class="w-1.5 h-10 rounded-full shadow-lg"></div>
            <div>
              <span class="text-[9px] font-bold text-slate-400 uppercase tracking-wider block mb-0.5">
                {{ nextExtreme.isHigh ? 'Puncak Pasang' : 'Puncak Surut' }}
              </span>
              <span class="text-base font-bold text-slate-700 dark:text-slate-200 font-mono">
                {{ formatTime(nextExtreme.date) }} <span class="text-[10px] text-slate-400">WITA</span>
              </span>
            </div>
          </div>
          <div class="text-right">
             <span class="text-xs font-bold text-slate-400 block mb-0.5">Prediksi</span>
            <span class="text-xl font-black text-blue-600 dark:text-blue-400">
              {{ nextExtreme.val.toFixed(2) }}<span class="text-sm text-blue-400/70">m</span>
            </span>
          </div>
        </div>
      </div>

      <div class="pt-2">
        <div class="flex items-center justify-between mb-3">
           <span class="text-[10px] text-slate-400 font-bold uppercase tracking-wider">6 Jam Kedepan</span>
        </div>
        
        <div class="flex items-end justify-between h-24 gap-2 pb-1 border-b border-slate-100 dark:border-slate-800/50">
          <div 
            v-for="(item, idx) in forecastData" 
            :key="idx" 
            class="flex-1 flex flex-col items-center justify-end h-full group relative"
          >
            <div class="opacity-0 group-hover:opacity-100 absolute -top-8 transition-opacity duration-200 bg-slate-800 text-white text-[10px] font-bold px-2 py-1 rounded-md shadow-lg whitespace-nowrap z-20">
              {{ item.val.toFixed(2) }} m
            </div>

            <div 
              class="w-full rounded-t-md transition-all duration-500 ease-out hover:opacity-80 relative overflow-hidden"
              :class="item.val >= 0 ? 'bg-blue-500/20 dark:bg-blue-500/30' : 'bg-indigo-500/20 dark:bg-indigo-500/30'"
              :style="{ height: getBarHeight(item.val) }" 
            >
               <div class="absolute top-0 w-full h-1" :class="item.val >= 0 ? 'bg-blue-500' : 'bg-indigo-500'"></div>
            </div>

            <span class="mt-2 text-[9px] font-bold text-slate-400 font-mono group-hover:text-blue-500 transition-colors">
              {{ formatTime(item.date).split(':')[0] }}
            </span>
          </div>
        </div>
      </div>

    </div>

    <div v-else-if="errorMsg" class="flex flex-col items-center justify-center py-10 text-center gap-3">
       <div class="p-3 bg-red-50 text-red-500 rounded-full">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><line x1="12" x2="12" y1="8" y2="12"/><line x1="12" x2="12.01" y1="16" y2="16"/></svg>
       </div>
       <p class="text-xs font-medium text-slate-500">{{ errorMsg }}</p>
       <button @click="fetchTideData" class="text-xs text-blue-500 font-bold hover:underline">Coba Lagi</button>
    </div>

    <div v-else class="space-y-5 animate-pulse">
      <div class="flex items-center gap-4">
        <div class="w-10 h-10 bg-slate-100 dark:bg-slate-800 rounded-xl"></div>
        <div class="space-y-2">
           <div class="h-3 w-24 bg-slate-100 dark:bg-slate-800 rounded"></div>
           <div class="h-2 w-16 bg-slate-100 dark:bg-slate-800 rounded"></div>
        </div>
      </div>
      <div class="h-20 bg-slate-100 dark:bg-slate-800 rounded-xl"></div>
      <div class="h-24 bg-slate-100 dark:bg-slate-800 rounded-xl"></div>
    </div>
    
    <div class="mt-5 pt-3 flex justify-between items-center text-[9px] text-slate-400 font-medium">
      <span>Update Realtime</span>
      <button 
        @click="fetchTideData" 
        class="flex items-center gap-1 hover:text-blue-500 transition-colors active:scale-95"
      >
        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"/><path d="M3 3v5h5"/></svg>
        Refresh
      </button>
    </div>

  </div>
</template>

<style scoped>
.animate-in {
  animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
}

@keyframes slideUp {
  from { opacity: 0; transform: translateY(12px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>