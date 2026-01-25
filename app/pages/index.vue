<script setup>
// Gunakan shallowRef khusus untuk objek yang memiliki siklus hidup internal sendiri (seperti Leaflet)
import { ref, computed, watch, onMounted, shallowRef, nextTick } from 'vue'
import { LMap, LTileLayer, LControlZoom } from '@vue-leaflet/vue-leaflet'
import 'leaflet/dist/leaflet.css'

definePageMeta({ layout: false })
useHead({ title: 'GIS - Water Management System' })
// Tambahkan di bagian state (bersama showBlok, dll)
const selectedBlock = ref(null) 

// Fungsi untuk reset jika ingin (opsional)
const handleMapClick = () => {
  selectedBlock.value = null
}
const colorMode = useColorMode()
const isOpen = ref(false)
const { coords, isLocating } = useLocation()
const weather = ref(null)

// --- STATE MAP ---
const mapRef = shallowRef(null) // PERBAIKAN: Gunakan shallowRef
const zoom = ref(14)
const initialCenter = ref([1.24644, 117.90811])
const currentBasemap = ref('satellite')

// --- STATE LAYERS ---
const showRainOverlay = ref(false)
const showBlok = ref(false)
const showInfra = ref(false)
const showWaterLevel = ref(false)
const showGroupDAS = ref(false)
const showBmkg = ref(false)

const loadingLayers = ref({
  blok: false, infra: false, water: false, das: false
})

// --- DATA GEOJSON ---
const infraRawData = shallowRef(null) // PERBAIKAN: Data besar sebaiknya shallow
const waterLevelRawData = shallowRef(null)
const infraCategoriesList = ref([])
const selectedInfraCategories = ref([])
const afdelingList = ref([])
const selectedAfd = ref(['All'])

// --- WAKTU & FILTER ---
const now = new Date()
const selectedYear = ref(now.getFullYear())
const selectedMonth = ref(now.getMonth() + 1)

const monthList = [
  { id: 1, name: 'JAN' }, { id: 2, name: 'FEB' }, { id: 3, name: 'MAR' },
  { id: 4, name: 'APR' }, { id: 5, name: 'MEI' }, { id: 6, name: 'JUN' },
  { id: 7, name: 'JUL' }, { id: 8, name: 'AGU' }, { id: 9, name: 'SEP' },
  { id: 10, name: 'OKT' }, { id: 11, name: 'NOV' }, { id: 12, name: 'DES' }
]

const yearList = computed(() => {
  const currentYear = now.getFullYear()
  return Array.from({ length: 5 }, (_, i) => currentYear - i)
})

// --- LOGIC: WEATHER ---
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

// --- LOGIC: MAP HELPERS ---
const triggerLoading = (key, isActive) => {
  if (isActive) {
    loadingLayers.value[key] = true
    setTimeout(() => { loadingLayers.value[key] = false }, 800)
  }
}

// Invalidate size saat sidebar dibuka/tutup agar map tidak glitch/abu-abu
watch(isOpen, async () => {
  await nextTick()
  setTimeout(() => {
    if (mapRef.value?.leafletObject) {
      mapRef.value.leafletObject.invalidateSize()
    }
  }, 350) // sedikit lebih lama dari transisi CSS (300ms)
})

const recenterMap = () => {
  if (coords.value?.lat && mapRef.value?.leafletObject) {
    mapRef.value.leafletObject.flyTo([coords.value.lat, coords.value.lng], 16)
  }
}

// --- DATA FETCHING ---
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
    
    // Extract categories
    const categoryMap = {}
    dataInfra.features.forEach(f => {
      const cat = f.properties.KATEGORY
      if (cat) categoryMap[cat] = (categoryMap[cat] || 0) + 1
    })

    infraCategoriesList.value = Object.keys(categoryMap).map(key => ({
      name: key,
      count: categoryMap[key]
    }))
    selectedInfraCategories.value = infraCategoriesList.value.map(c => c.name)
  } catch (e) {
    console.error("Gagal memuat Data GeoJSON:", e)
  }
})

// --- WATCHERS FOR UI ---
watch([selectedMonth, selectedYear], () => {
  if (showBlok.value) triggerLoading('blok', true)
  if (showInfra.value) triggerLoading('infra', true)
  if (showWaterLevel.value) triggerLoading('water', true)
})

const isDark = computed({
  get() { return colorMode.value === 'dark' },
  set() { colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark' }
})

const printMap = () => { window.print() }
</script>

<template>
  <div class="flex h-screen w-screen bg-white dark:bg-gray-900 overflow-hidden relative print:block">
    <div v-if="isOpen" class="fixed inset-0 bg-gray-900/50 backdrop-blur-sm z-[60] lg:hidden" @click="isOpen = false"></div>
    
    <div class="h-full absolute z-[90] lg:static print:hidden">
      <Sidebar 
        :is-open="isOpen" 
        @close="isOpen = false" 
        v-model:showBlok="showBlok" 
        v-model:showInfra="showInfra"
        v-model:showGroupDAS="showGroupDAS" 
        v-model:showWaterLevel="showWaterLevel" 
        v-model:showRain="showRainOverlay"
        v-model:showBmkg="showBmkg" 
        :loading-states="loadingLayers"
        v-model:basemap="currentBasemap" 
        :infra-categories="infraCategoriesList"
        v-model:selectedInfra="selectedInfraCategories" 
        @recenter="recenterMap" 
      />
    </div>

    <div class="flex-1 flex flex-col min-w-0 h-full relative transition-all duration-300" :class="isOpen ? 'lg:pl-72' : 'lg:pl-0'">
      
      <header class="sticky top-0 z-50 w-full border-b border-gray-200 dark:border-gray-800 bg-white/80 dark:bg-gray-900/80 backdrop-blur-md print:hidden">
        <div class="max-w-7xl mx-auto px-4 h-16 lg:h-20 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <UButton icon="i-heroicons-bars-3-20-solid" color="gray" variant="ghost" class="lg:hidden" @click="isOpen = !isOpen" />
            <div>
              <h1 class="text-lg lg:text-2xl font-bold text-green-900 dark:text-green-400 leading-tight">Web GIS Water Management</h1>
              <p class="text-[10px] lg:text-sm text-gray-500 uppercase font-bold tracking-wider">Monitoring System</p>
            </div>
          </div>

          <div class="flex items-center gap-4">
            <div v-if="weather" class="hidden md:flex items-center gap-3 px-4 py-2 bg-gray-50 dark:bg-gray-800 rounded-2xl border border-gray-100 dark:border-gray-700">
              <div class="text-right leading-none">
                <p class="text-[10px] font-bold text-gray-400 uppercase mb-1">Cuaca</p>
                <p class="text-sm font-bold text-gray-700 dark:text-gray-200">{{ weather.temp }}°C</p>
              </div>
              <img :src="`https://openweathermap.org/img/wn/${weather.icon}@2x.png`" class="w-10 h-10 -my-2" alt="weather icon" />
            </div>
            <UButton icon="i-heroicons-printer" color="gray" variant="ghost" @click="printMap" class="hidden sm:flex" />
            <ClientOnly>
              <UButton :icon="isDark ? 'i-heroicons-moon-20-solid' : 'i-heroicons-sun-20-solid'" color="gray" variant="ghost" @click="isDark = !isDark" />
            </ClientOnly>
          </div>
        </div>
      </header>

      <main class="flex-1 relative overflow-hidden">
        <div class="absolute top-3 inset-x-3 z-[80] flex flex-col gap-2 pointer-events-none sm:top-4 sm:inset-x-4 sm:flex-row sm:justify-between items-start print:hidden">
          <div class="pointer-events-auto w-full sm:w-auto">
            <ToggleDate 
              v-model:selectedMonth="selectedMonth" 
              v-model:selectedYear="selectedYear" 
              :month-list="monthList"
              :year-list="yearList" 
            />
          </div>
          <div class="pointer-events-auto w-full sm:w-auto flex justify-start sm:justify-end">
            <ToggleAfdeling v-model="selectedAfd" :afdeling-list="afdelingList" />
          </div>
        </div>

        <ClientOnly>
          <LMap 
            ref="mapRef" 
            :zoom="zoom" 
            :center="initialCenter" 
            :use-global-leaflet="false" 
            class="h-full w-full z-0" 
            :options="{ zoomControl: false, attributionControl: false }"
          >
            <LControlZoom position="bottomright" />
            
            <LTileLayer v-if="currentBasemap === 'street'" url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
            <LTileLayer v-if="currentBasemap === 'satellite'" url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}" />
            
            <MapGroupDASLayer v-if="showGroupDAS" />
            
            <MapAfdelingLayer />

      <MapBlokLayer 
  v-if="showBlok" 
  :key="`blok-${selectedMonth}-${selectedYear}`" 
  :filter-afd="selectedAfd"
  :selected-month="selectedMonth" 
  :selected-year="selectedYear"
  @update-afdelings="list => afdelingList = list"
  @block-selected="name => selectedBlock = name" 
/>
            <MapInfrastructureLayer 
  v-if="showInfra && infraRawData" 
  :key="`infra-${selectedMonth}-${selectedYear}`"
              :geo-json="infraRawData" 
              :filter-afd="selectedAfd" 
              :selected-month="selectedMonth"
              :selected-year="selectedYear" 
              :active-categories="selectedInfraCategories" 
              :selected-block="selectedBlock"
            />

       <MapWaterLevelLayer 
  v-if="showWaterLevel && waterLevelRawData" 
  :key="`wl-${selectedMonth}-${selectedYear}`"
              :selected-month="selectedMonth" 
              :selected-year="selectedYear" 
              :geo-json="waterLevelRawData"
              :filter-afd="selectedAfd" 
              :selected-block="selectedBlock"
            />

            <LTileLayer 
              v-if="showRainOverlay" 
              :key="'rain-layer'"
              url="https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=4a192ab87b2343ada7da03f7712b7988" 
              :opacity="0.7" 
            />
          </LMap>
        </ClientOnly>

        <MapRainLegend v-if="showRainOverlay" />
        <MapLoadingOverlay v-if="isLocating" />

        <div class="absolute bottom-6 left-2 z-[80] pointer-events-auto sm:left-4 max-w-[calc(100%-2rem)] print-legend">
          <MapLegends 
            :active-layers="{ blok: showBlok, infra: showInfra, water: showWaterLevel }"
            :selected-infra="selectedInfraCategories"
            :infra-categories="infraCategoriesList"
          />
        </div>
      </main>
    </div>
  </div>
</template>

<style>
body {
  margin: 0;
  overflow: hidden;
}

.scrollbar-hide::-webkit-scrollbar { display: none; }
.scrollbar-hide { -ms-overflow-style: none; scrollbar-width: none; }

.leaflet-container { background: #0f172a !important; }

/* CSS PRINT */
@media print {
  @page { margin: 0; size: landscape; }
  body { -webkit-print-color-adjust: exact; print-color-adjust: exact; overflow: visible !important; }
  .print\:hidden, aside, header, .leaflet-control-zoom, .leaflet-control-attribution { display: none !important; }
  .flex-1 { position: absolute !important; top: 0; left: 0; width: 100% !important; height: 100% !important; margin: 0 !important; padding: 0 !important; }
  .print-legend { display: block !important; position: fixed !important; bottom: 20px !important; left: 20px !important; transform: none !important; z-index: 9999 !important; background: white !important; border: 1px solid #ccc !important; width: auto !important; }
}

/* Mobile Legends */
@media (max-width: 640px) {
  .map-legends-container { max-width: 180px; max-height: 200px; overflow-y: auto; font-size: 10px; }
  .leaflet-bottom.leaflet-right { bottom: 20px; }
}
</style>