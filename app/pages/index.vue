<script setup>
definePageMeta({ layout: false })
useHead({
  title: 'GIS - Water Management System'
})

import { ref, computed, watch, onMounted } from 'vue'
import { LMap, LTileLayer, LControlZoom } from '@vue-leaflet/vue-leaflet'
import 'leaflet/dist/leaflet.css'

// Import Components
import Sidebar from '~/components/Sidebar.vue' 
import AfdelingLayer from '~/components/map/AfdelingLayer.vue'
import BlokLayer from '~/components/map/BlokLayer.vue'
import InfrastructureLayer from '~/components/map/InfrastructureLayer.vue'
import WaterLevelLayer from '~/components/map/WaterLevelLayer.vue'
import GroupDASLayer from '~/components/map/GroupDASLayer.vue'
import RainLegend from '~/components/map/RainLegend.vue'
import LoadingOverlay from '~/components/map/LoadingOverlay.vue'

// --- 1. LOGIC LAYOUT & HEADER ---
const colorMode = useColorMode()
const isOpen = ref(false) 
const { coords, isLocating } = useLocation()
const weather = ref(null)

const isDark = computed({
  get() { return colorMode.value === 'dark' },
  set() { colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark' }
})

const printMap = () => { window.print() }

// Weather Logic
const fetchWeather = async (lat, lng) => {
  try {
    const API_KEY = '4a192ab87b2343ada7da03f7712b7988' 
    const res = await $fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&units=metric&lang=id&appid=${API_KEY}`)
    weather.value = {
      temp: Math.round(res.main.temp),
      description: res.weather[0].description,
      icon: res.weather[0].icon
    }
  } catch (err) { console.error('Gagal ambil cuaca', err) }
}

watch(() => coords.value, (newCoords) => {
  if (newCoords?.lat) fetchWeather(newCoords.lat, newCoords.lng)
}, { immediate: true, deep: true })

// --- 2. LOGIC PETA & DATA ---
const mapRef = ref(null)
const zoom = ref(14)
const initialCenter = ref([1.24644, 117.90811]) 
const currentBasemap = ref('satellite')

// State Toggle Layers
const showRainOverlay = ref(false)
const showBlok = ref(false)
const showInfra = ref(false)
const showWaterLevel = ref(false)
const showGroupDAS = ref(false)

// --- LOGIC LOADING LAYERS ---
const loadingLayers = ref({
  blok: false,
  infra: false,
  water: false,
  das: false
})

const triggerLoading = (key, isActive) => {
  if (isActive) {
    loadingLayers.value[key] = true
    setTimeout(() => { loadingLayers.value[key] = false }, 800)
  }
}

watch(showBlok, (val) => triggerLoading('blok', val))
watch(showInfra, (val) => triggerLoading('infra', val))
watch(showWaterLevel, (val) => triggerLoading('water', val))
watch(showGroupDAS, (val) => triggerLoading('das', val))

// BMKG State
const showBmkg = ref(false) 
const { tideData, tideBounds, loading: bmkgLoading, fetchTide } = useBmkg()

watch(showBmkg, (val) => {
  if (val && !tideData.value) { fetchTide() }
})

// --- 3. LOGIC FILTERING (Afdeling & Periode) ---
const showAfd = ref(false)
const showPeriod = ref(false)

// -- Logic Periode (Baru) --
const currentYear = new Date().getFullYear()
const currentMonth = new Date().getMonth() + 1 // 1-12

const selectedYear = ref(currentYear)
const selectedMonth = ref(currentMonth)

const yearList = computed(() => {
  // Generate 5 tahun ke belakang
  return Array.from({ length: 5 }, (_, i) => currentYear - i)
})

const monthList = [
  { id: 1, name: 'JAN' }, { id: 2, name: 'FEB' }, { id: 3, name: 'MAR' },
  { id: 4, name: 'APR' }, { id: 5, name: 'MEI' }, { id: 6, name: 'JUN' },
  { id: 7, name: 'JUL' }, { id: 8, name: 'AGU' }, { id: 9, name: 'SEP' },
  { id: 10, name: 'OKT' }, { id: 11, name: 'NOV' }, { id: 12, name: 'DES' }
]

// Toggle Logic (Agar tidak tumpang tindih)
const togglePeriodMenu = () => {
  showPeriod.value = !showPeriod.value
  if (showPeriod.value) showAfd.value = false
}

const toggleAfdelingMenu = () => {
  showAfd.value = !showAfd.value
  if (showAfd.value) showPeriod.value = false
}

// Watcher Perubahan Periode
watch([selectedMonth, selectedYear], ([newM, newY]) => {
  console.log(`Periode berubah ke: Bulan ${newM}, Tahun ${newY}`)
  // TODO: Masukkan logika fetch ulang data geojson berdasarkan periode di sini
  // contoh: fetchMapData(newM, newY)
  
  // Simulasi loading sebentar agar user tau ada proses
  triggerLoading('blok', true) 
})

// -- Logic Afdeling --
const afdelingList = ref([])      
const selectedAfd = ref(['All'])

const toggleAfdeling = (name) => {
  if (name === 'All') { selectedAfd.value = ['All']; return }
  let current = selectedAfd.value.filter(item => item !== 'All')
  if (current.includes(name)) { current = current.filter(item => item !== name) } 
  else { current.push(name) }
  selectedAfd.value = current.length > 0 ? current : ['All']
}

// --- DATA INFRA & WATER LEVEL ---
const infraRawData = ref(null)           
const waterLevelRawData = ref(null) 
const infraCategoriesList = ref([])      
const selectedInfraCategories = ref([])  

// --- DATA LEGENDA ---
const blokLegendItems = [
  { label: 'Aman / Normal', color: '#22c55e' },
  { label: 'Sedang', color: '#eab308' },
  { label: 'Tinggi', color: '#f97316' },
  { label: 'Kritis', color: '#ef4444' },
  { label: 'No Data', color: '#f8fafc', border: true }
]

const infraLegendItems = [
  { label: 'Jembatan Kayu', color: '#59281E' },
  { label: 'Pipa / PVC', color: '#06b6d4' },
  { label: 'NF / Gate', color: '#64748b' },
  { label: 'Titik Monitoring', color: '#f8fafc' },
  { label: 'Titik Monitoring (Tidak Dieksekusi)', color: '#ef4444' },
]

// LEAFLET RESIZE FIX
watch(isOpen, async () => {
  setTimeout(() => {
    if (mapRef.value?.leafletObject) {
      mapRef.value.leafletObject.invalidateSize()
    }
  }, 300)
})

onMounted(async () => {
  try {
    const [resInfra, resWater] = await Promise.all([
        fetch('/Infra.json'),
        fetch('/WaterLevel.json') 
    ])

    const dataInfra = await resInfra.json()
    const dataWater = await resWater.json()
    
    infraRawData.value = dataInfra
    waterLevelRawData.value = dataWater

    const categoryMap = {}
    dataInfra.features.forEach(f => {
       const cat = f.properties.KATEGORY
       if(cat) categoryMap[cat] = (categoryMap[cat] || 0) + 1
    })
    
    const categories = Object.keys(categoryMap).map(key => ({
      name: key,
      count: categoryMap[key]
    }))

    infraCategoriesList.value = categories
    selectedInfraCategories.value = categories.map(c => c.name)

  } catch (e) {
    console.error("Gagal memuat Data GeoJSON:", e)
  }
})

const recenterMap = () => {
  if (coords.value?.lat && mapRef.value?.leafletObject) {
    mapRef.value.leafletObject.flyTo([coords.value.lat, coords.value.lng], 16)
  }
}
</script>

<template>
  <div class="flex h-screen w-screen bg-white dark:bg-gray-900 overflow-hidden relative print:block">
    
    <div 
      v-if="isOpen" 
      class="fixed inset-0 bg-gray-900/50 backdrop-blur-sm z-[60] lg:hidden print:hidden" 
      @click="isOpen = false"
    ></div>

    <div class="print:hidden h-full absolute z-[90] lg:static">
      <Sidebar 
        :is-open="isOpen"
        @close="isOpen = false"

        v-model:showBlok="showBlok"
        v-model:showInfra="showInfra"
        v-model:showGroupDAS="showGroupDAS"
        v-model:showWaterLevel="showWaterLevel" 
        v-model:showRain="showRainOverlay"
        
        v-model:showBmkg="showBmkg"
        :loading-bmkg="bmkgLoading"
        
        :loading-states="loadingLayers" 

        v-model:basemap="currentBasemap"
        
        :infra-categories="infraCategoriesList"
        v-model:selectedInfra="selectedInfraCategories"
        
        @recenter="recenterMap"
      />
    </div>
    
    <div 
      class="flex-1 flex flex-col min-w-0 h-full relative transition-all duration-300 ease-in-out print:w-full print:pl-0"
      :class="isOpen ? 'lg:pl-72' : 'lg:pl-0'"
    >
        <header class="sticky top-0 z-50 w-full border-b border-gray-200 dark:border-gray-800 bg-white/80 dark:bg-gray-900/80 backdrop-blur-md print:hidden">
        <div class="max-w-7xl mx-auto px-3 sm:px-4 lg:px-8">
          <div class="flex justify-between items-center h-14 sm:h-16 lg:h-20">
            <div class="flex items-center gap-2 sm:gap-4 min-w-0 flex-1">
              <UButton
                icon="i-heroicons-bars-3-20-solid"
                color="gray"
                variant="ghost"
                class="lg:hidden rounded-full flex-shrink-0"
                @click="isOpen = !isOpen"
              />

              <div class="min-w-0 flex-1">
                <h1 class="text-sm sm:text-lg md:text-xl lg:text-2xl font-bold text-green-900 dark:text-green-400 leading-tight truncate">
                  Web GIS Water Management
                </h1>
                <p class="text-[10px] sm:text-xs md:text-sm text-gray-500 dark:text-gray-400 truncate">
                  Monitoring & Predictive Analytics System
                </p>
              </div>
            </div>

            <div class="flex items-center gap-2 sm:gap-3 md:gap-4 flex-shrink-0">
              <div v-if="weather" class="hidden sm:flex items-center gap-2 md:gap-3 px-2 md:px-4 py-1.5 md:py-2 bg-gray-50 dark:bg-gray-800/50 rounded-xl md:rounded-2xl border border-gray-100 dark:border-gray-700">
                <div class="text-right">
                  <p class="text-[9px] md:text-[10px] font-bold uppercase text-gray-400 leading-none mb-0.5 md:mb-1">Kondisi Saat Ini</p>
                  <p class="text-xs md:text-sm font-bold text-gray-700 dark:text-gray-200">
                    {{ weather.temp }}°C <span class="text-gray-400 font-medium ml-1 hidden md:inline">| {{ weather.description }}</span>
                  </p>
                </div>
                <img 
                  :src="`https://openweathermap.org/img/wn/${weather.icon}@2x.png`" 
                  alt="Weather Icon"
                  class="w-8 h-8 md:w-10 md:h-10 -my-2"
                />
              </div>

              <UButton 
                  icon="i-heroicons-printer"
                  color="gray" 
                  variant="ghost"
                  title="Print Map"
                  class="rounded-full transition-transform active:scale-95 hidden md:flex"
                  @click="printMap" 
                />

              <div class="h-6 sm:h-8 w-[1px] bg-gray-200 dark:bg-gray-800 hidden sm:block" />

              <ClientOnly>
                <UButton 
                  :icon="isDark ? 'i-heroicons-moon-20-solid' : 'i-heroicons-sun-20-solid'"
                  color="gray" 
                  variant="ghost" 
                  aria-label="Toggle dark mode"
                  class="rounded-full transition-transform active:scale-95"
                  @click="isDark = !isDark" 
                />
                <template #fallback>
                  <div class="w-8 h-8" />
                </template>
              </ClientOnly>
            </div>
          </div>
        </div>
      </header>

      <main class="flex-1 relative overflow-hidden print:overflow-visible print:h-screen">
      
      <div class="absolute top-2 sm:top-4 right-2 sm:right-4 z-[80] pointer-events-none print:hidden">
        <div
            class="pointer-events-auto w-[160px] sm:w-[180px] md:w-[190px] bg-white/90 sm:bg-white/80 backdrop-blur-md rounded-lg sm:rounded-xl shadow-md border border-gray-200/50"
        >
            <button
            @click="toggleAfdelingMenu"
            class="w-full flex items-center justify-between px-2 sm:px-3 py-1.5 sm:py-2 text-[10px] sm:text-[11px] font-semibold rounded-t-lg sm:rounded-t-xl text-gray-800 hover:bg-gray-50 transition"
            >
            <span>PILIH AFDELING</span>
            <svg
                :class="['w-3 h-3 sm:w-4 sm:h-4 text-gray-500 transition-transform duration-200', showAfd ? 'rotate-180' : '']"
                fill="none" viewBox="0 0 24 24" stroke="currentColor"
            >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
            </button>
            
            <div v-show="showAfd" class="p-1.5 sm:p-2 border-t border-gray-200/50">
            <div class="grid grid-cols-2 gap-1 sm:gap-1.5 max-h-[100px] sm:max-h-[120px] overflow-y-auto scrollbar-hide">
                <button
                @click="toggleAfdeling('All')"
                :class="['col-span-2 px-1.5 sm:px-2 py-1 sm:py-1.5 rounded-md text-[9px] sm:text-[10px] font-semibold transition', selectedAfd.includes('All') ? 'bg-green-600 text-white shadow' : 'bg-gray-100 text-gray-700 hover:bg-gray-200']"
                >
                SEMUA BLOK
                </button>
                <button
                v-for="afd in afdelingList"
                :key="afd.name"
                @click="toggleAfdeling(afd.name)"
                :class="['px-1.5 sm:px-2 py-1 sm:py-1.5 rounded-md text-[9px] sm:text-[10px] font-semibold uppercase transition text-center', selectedAfd.includes(afd.name) ? 'bg-green-600 text-white shadow' : 'bg-gray-100 text-gray-700 hover:bg-gray-200']"
                >
                AFD {{ afd.name }}
                </button>
            </div>
            </div>
        </div>
      </div>

      <div             v-if="showBlok"
 class="absolute top-2 sm:top-4 left-2 z-[80] pointer-events-none print:hidden">
        <div
            class="pointer-events-auto w-[180px] sm:w-[200px] bg-white/90 sm:bg-white/80 backdrop-blur-md rounded-lg sm:rounded-xl shadow-md border border-gray-200/50"
        >
            <button
            @click="togglePeriodMenu"
            class="w-full flex items-center justify-between px-2 sm:px-3 py-1.5 sm:py-2 text-[10px] sm:text-[11px] font-semibold rounded-t-lg sm:rounded-t-xl text-gray-800 hover:bg-gray-50 transition"
            >
            <div class="flex flex-col items-start leading-none">
               <span class="text-[9px] text-gray-400 font-normal">PERIODE DATA</span>
               <span>{{ monthList[selectedMonth - 1].name }} {{ selectedYear }}</span>
            </div>
            <svg
                :class="['w-3 h-3 sm:w-4 sm:h-4 text-gray-500 transition-transform duration-200', showPeriod ? 'rotate-180' : '']"
                fill="none" viewBox="0 0 24 24" stroke="currentColor"
            >
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
            </button>
            
            <div v-show="showPeriod" class="p-2 border-t border-gray-200/50">
               
               <div class="mb-2">
                 <p class="text-[9px] text-gray-400 font-bold mb-1 ml-1">TAHUN</p>
                 <div class="flex gap-1 overflow-x-auto scrollbar-hide pb-1">
                    <button 
                      v-for="y in yearList" 
                      :key="y"
                      @click="selectedYear = y"
                      :class="['px-2 py-1 rounded text-[10px] font-bold transition whitespace-nowrap', selectedYear === y ? 'bg-green-600 text-white shadow' : 'bg-gray-100 text-gray-600 hover:bg-gray-200']"
                    >
                      {{ y }}
                    </button>
                 </div>
               </div>

               <div>
                 <p class="text-[9px] text-gray-400 font-bold mb-1 ml-1">BULAN</p>
                 <div class="grid grid-cols-4 gap-1">
                    <button
                      v-for="m in monthList"
                      :key="m.id"
                      @click="selectedMonth = m.id"
                      :class="['py-1 rounded text-[9px] font-semibold transition text-center', selectedMonth === m.id ? 'bg-green-600 text-white shadow' : 'bg-gray-100 text-gray-600 hover:bg-gray-200']"
                    >
                      {{ m.name }}
                    </button>
                 </div>
               </div>
            </div>
        </div>
      </div>
      

      <ClientOnly>
          <LMap ref="mapRef" :zoom="zoom" :max-zoom="18" :center="initialCenter" :use-global-leaflet="false" class="h-full w-full z-0 print:absolute print:inset-0 print:h-screen print:w-screen" :options="{ zoomControl: false, attributionControl: false }">
            <LControlZoom position="bottomright" />
            
            <LTileLayer v-if="currentBasemap === 'street'" url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" layer-type="base" name="Street" />
            <LTileLayer v-if="currentBasemap === 'satellite'" url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}" layer-type="base" name="Satellite" />
            <LTileLayer v-if="currentBasemap === 'topo'" url="https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png" layer-type="base" name="Topography" />

            <GroupDASLayer v-if="showGroupDAS" />
            <AfdelingLayer />
<BlokLayer 
  v-if="showBlok" 
  :filter-afd="selectedAfd" 
  :selected-month="selectedMonth" 
  :selected-year="selectedYear"
  @update-afdelings="list => afdelingList = list" 
/>            
            <InfrastructureLayer 
              v-if="showInfra && infraRawData" 
              :geo-json="infraRawData"
              :filter-afd="selectedAfd" 
              :active-categories="selectedInfraCategories"
            />
            
            <WaterLevelLayer 
               v-if="showWaterLevel && waterLevelRawData"
               :geo-json="waterLevelRawData"
               :filter-afd="selectedAfd"
            />
            
            <LTileLayer v-if="showRainOverlay" url="https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=4a192ab87b2343ada7da03f7712b7988" :opacity="0.7" :z-index="1001" />
          </LMap>
        </ClientOnly>

        <RainLegend v-if="showRainOverlay" class="print:hidden" />
        <LoadingOverlay v-if="isLocating" class="print:hidden" />

        <div class="hidden print:block absolute bottom-6 left-6 z-[9999] bg-white/95 p-4 rounded-lg border border-gray-400 shadow-xl max-w-xs break-inside-avoid">
            <h3 class="font-bold text-sm text-gray-800 uppercase tracking-wider border-b border-gray-300 pb-2 mb-3">
               Legenda Peta
            </h3>
            
            <div v-if="showBlok" class="mb-4">
               <h4 class="text-[10px] font-bold text-gray-500 uppercase mb-2">Status Blok</h4>
               <div class="space-y-1.5">
                  <div v-for="item in blokLegendItems" :key="item.label" class="flex items-center gap-2">
                     <div 
                        class="w-4 h-4 border"
                        :class="item.border ? 'border-gray-400' : 'border-transparent'"
                        :style="{ backgroundColor: item.color }"
                     ></div>
                     <span class="text-[10px] font-semibold text-gray-700 uppercase">{{ item.label }}</span>
                  </div>
               </div>
            </div>

            <div v-if="showInfra">
               <h4 class="text-[10px] font-bold text-gray-500 uppercase mb-2">Infrastruktur</h4>
               <div class="grid grid-cols-2 gap-x-2 gap-y-1.5">
                  <div v-for="item in infraLegendItems" :key="item.label" class="flex items-center gap-2">
                     <div 
                        class="w-3 h-3 rounded-full border border-gray-300 shadow-sm flex-shrink-0"
                        :style="{ backgroundColor: item.color }"
                     ></div>
                     <span class="text-[10px] font-semibold text-gray-700 uppercase leading-none">{{ item.label }}</span>
                  </div>
                  <div v-if="showWaterLevel" class="flex items-center gap-2">
                      <div class="w-3 h-3 rounded-full border border-gray-300 shadow-sm flex-shrink-0 bg-blue-800"></div>
                      <span class="text-[10px] font-semibold text-gray-700 uppercase leading-none">Water Level</span>
                  </div>
               </div>
            </div>
            
            <div v-if="showGroupDAS" class="mt-4">
               <h4 class="text-[10px] font-bold text-gray-500 uppercase mb-2">Group DAS</h4>
               <div class="grid grid-cols-2 gap-2 text-[9px] text-gray-700">
                  <div class="flex items-center gap-1"><div class="w-3 h-3 bg-red-500"></div> Group 1</div>
                  <div class="flex items-center gap-1"><div class="w-3 h-3 bg-yellow-500"></div> Group 2</div>
                  <div class="flex items-center gap-1"><div class="w-3 h-3 bg-lime-500"></div> Group 2A</div>
                  <div class="flex items-center gap-1"><div class="w-3 h-3 bg-blue-500"></div> Group 3</div>
                  <div class="flex items-center gap-1"><div class="w-3 h-3 bg-purple-500"></div> Group 4</div>
               </div>
            </div>

            <div class="mt-4 pt-2 border-t border-gray-300 text-[9px] text-gray-500 italic text-center">
               Dicetak pada: {{ new Date().toLocaleString('id-ID') }}
            </div>
        </div>
        </main>
    </div>
  </div>
</template>

<style>
body { margin: 0; overflow: hidden; }
.scrollbar-hide::-webkit-scrollbar { display: none; }
.scrollbar-hide { -ms-overflow-style: none; scrollbar-width: none; }
.leaflet-container { background: #0f172a !important; }

.mask-fade-right {
  mask-image: linear-gradient(to right, black 90%, transparent 100%);
  -webkit-mask-image: linear-gradient(to right, black 90%, transparent 100%);
}

/* Mobile Optimization */
@media (max-width: 640px) {
  .leaflet-control-zoom {
    transform: scale(0.85);
  }
  
  .leaflet-popup-content-wrapper {
    font-size: 12px;
  }
}

/* --- CSS PRINT UPDATE --- */
@media print {
  @page { margin: 0; size: landscape; }
  body { -webkit-print-color-adjust: exact; overflow: visible !important; }
  
  .print\:hidden, 
  aside, 
  header, 
  .leaflet-control-zoom,
  .leaflet-control-attribution {
    display: none !important;
  }

  .flex-1 { 
    margin: 0 !important; 
    padding: 0 !important; 
    width: 100vw !important; 
    height: 100vh !important;
  }
  
  .leaflet-container {
    width: 100% !important;
    height: 100% !important;
    z-index: 0;
  }

  .print\:block {
    display: block !important;
    z-index: 9999 !important;
  }
}
</style>