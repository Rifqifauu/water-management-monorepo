<script setup>
definePageMeta({ layout: false })
useHead({
  title: 'GIS - Water Management System'
})
import { ref, computed, watch, onMounted } from 'vue'
import { LMap, LTileLayer, LControlZoom } from '@vue-leaflet/vue-leaflet'
import 'leaflet/dist/leaflet.css'

const colorMode = useColorMode()
const isOpen = ref(false)
const { coords, isLocating } = useLocation()
const weather = ref(null)
const isDark = computed({
  get() { return colorMode.value === 'dark' },
  set() { colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark' }
})
const printMap = () => { window.print() }
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

const mapRef = ref(null)
const zoom = ref(14)
const initialCenter = ref([1.24644, 117.90811])
const currentBasemap = ref('satellite')

const showRainOverlay = ref(false)
const showBlok = ref(false)
const showInfra = ref(false)
const showWaterLevel = ref(false)
const showGroupDAS = ref(false)

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

const showBmkg = ref(false)
const { tideData, tideBounds, loading: bmkgLoading, fetchTide } = useBmkg()

watch(showBmkg, (val) => {
  if (val && !tideData.value) { fetchTide() }
})

const showAfd = ref(false)
const showPeriod = ref(false)

const currentYear = new Date().getFullYear()
const currentMonth = new Date().getMonth() + 1

const selectedYear = ref(null)
const selectedMonth = ref(null)

const yearList = computed(() => {
  return Array.from({ length: 5 }, (_, i) => currentYear - i)
})

const monthList = [
  { id: 1, name: 'JAN' }, { id: 2, name: 'FEB' }, { id: 3, name: 'MAR' },
  { id: 4, name: 'APR' }, { id: 5, name: 'MEI' }, { id: 6, name: 'JUN' },
  { id: 7, name: 'JUL' }, { id: 8, name: 'AGU' }, { id: 9, name: 'SEP' },
  { id: 10, name: 'OKT' }, { id: 11, name: 'NOV' }, { id: 12, name: 'DES' }
]



watch([selectedMonth, selectedYear], () => {
  if (showBlok.value) triggerLoading('blok', true)
  if (showInfra.value) triggerLoading('infra', true)
  if (showWaterLevel.value) triggerLoading('water', true)
})

const afdelingList = ref([])
const selectedAfd = ref(['All'])
const infraRawData = ref(null)
const waterLevelRawData = ref(null)
const infraCategoriesList = ref([])
const selectedInfraCategories = ref([])

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
      if (cat) categoryMap[cat] = (categoryMap[cat] || 0) + 1
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
    <div v-if="isOpen" class="fixed inset-0 bg-gray-900/50 backdrop-blur-sm z-[60] lg:hidden" @click="isOpen = false">
    </div>
    <div class="h-full absolute z-[90] lg:static print:hidden">
      <Sidebar :is-open="isOpen" @close="isOpen = false" v-model:showBlok="showBlok" v-model:showInfra="showInfra"
        v-model:showGroupDAS="showGroupDAS" v-model:showWaterLevel="showWaterLevel" v-model:showRain="showRainOverlay"
        v-model:showBmkg="showBmkg" :loading-bmkg="bmkgLoading" :loading-states="loadingLayers"
        v-model:basemap="currentBasemap" :infra-categories="infraCategoriesList"
        v-model:selectedInfra="selectedInfraCategories" @recenter="recenterMap" />
    </div>
    <div class="flex-1 flex flex-col min-w-0 h-full relative transition-all duration-300"
      :class="isOpen ? 'lg:pl-72' : 'lg:pl-0'">
      <header
        class="sticky top-0 z-50 w-full border-b border-gray-200 dark:border-gray-800 bg-white/80 dark:bg-gray-900/80 backdrop-blur-md print:hidden">
        <div class="max-w-7xl mx-auto px-4 h-16 lg:h-20 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <UButton icon="i-heroicons-bars-3-20-solid" color="gray" variant="ghost" class="lg:hidden"
              @click="isOpen = !isOpen" />
            <div>
              <h1 class="text-lg lg:text-2xl font-bold text-green-900 dark:text-green-400 leading-tight">Web GIS Water
                Management</h1>
              <p class="text-[10px] lg:text-sm text-gray-500 uppercase font-bold tracking-wider">Monitoring System</p>
            </div>
          </div>

          <div class="flex items-center gap-4">
            <div v-if="weather"
              class="hidden md:flex items-center gap-3 px-4 py-2 bg-gray-50 dark:bg-gray-800 rounded-2xl border border-gray-100 dark:border-gray-700">
              <div class="text-right leading-none">
                <p class="text-[10px] font-bold text-gray-400 uppercase mb-1">Cuaca</p>
                <p class="text-sm font-bold text-gray-700 dark:text-gray-200">{{ weather.temp }}°C</p>
              </div>
              <img :src="`https://openweathermap.org/img/wn/${weather.icon}@2x.png`" class="w-10 h-10 -my-2" />
            </div>
            <UButton icon="i-heroicons-printer" color="gray" variant="ghost" @click="printMap" class="hidden sm:flex" />
            <ClientOnly>
              <UButton :icon="isDark ? 'i-heroicons-moon-20-solid' : 'i-heroicons-sun-20-solid'" color="gray"
                variant="ghost" @click="isDark = !isDark" />
            </ClientOnly>
          </div>
        </div>
      </header>

      <main class="flex-1 relative overflow-hidden">
        <div class="absolute top-4 right-4 z-[80] pointer-events-none print:hidden">
          <ToggleAfdeling v-model="selectedAfd" :afdeling-list="afdelingList" />
        </div>
        <div class="absolute top-4 left-4 z-[80] pointer-events-none print:hidden">
          <ToggleDate v-model:selectedMonth="selectedMonth" v-model:selectedYear="selectedYear" :month-list="monthList"
            :year-list="yearList" />
        </div>
        <ClientOnly>
          <LMap ref="mapRef" :zoom="zoom" :center="initialCenter" :use-global-leaflet="false" class="h-full w-full z-0"
            :options="{ zoomControl: false, attributionControl: false }">
            <LControlZoom position="bottomright" />
            <LTileLayer v-if="currentBasemap === 'street'" url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
            <LTileLayer v-if="currentBasemap === 'satellite'"
              url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}" />
            <MapGroupDASLayer v-if="showGroupDAS" />
            <MapAfdelingLayer />
            <MapBlokLayer v-if="showBlok" :key="`blok-${selectedMonth}-${selectedYear}`" :filter-afd="selectedAfd"
              :selected-month="selectedMonth" :selected-year="selectedYear"
              @update-afdelings="list => afdelingList = list" />
            <MapInfrastructureLayer v-if="showInfra && infraRawData" :key="`infra-${selectedMonth}-${selectedYear}`"
              :geo-json="infraRawData" :filter-afd="selectedAfd" :selected-month="selectedMonth"
              :selected-year="selectedYear" :active-categories="selectedInfraCategories" />
            <MapWaterLevelLayer v-if="showWaterLevel && waterLevelRawData" :key="`wl-${selectedMonth}-${selectedYear}`"
              :selected-month="selectedMonth" :selected-year="selectedYear" :geo-json="waterLevelRawData"
              :filter-afd="selectedAfd" />
            <LTileLayer v-if="showRainOverlay"
              url="https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=4a192ab87b2343ada7da03f7712b7988"
              :opacity="0.7" />
          </LMap>
        </ClientOnly>
        <MapRainLegend v-if="showRainOverlay" />
        <MapLoadingOverlay v-if="isLocating" />
        <MapLegends 
        :active-layers="{
        blok: showBlok,
        infra: showInfra,
        water: showWaterLevel,
        das: showGroupDAS,
        rain: showRainOverlay
      }"
      :selected-infra="selectedInfraCategories"
      :infra-categories="infraCategoriesList"
      />
      </main>
    </div>
  </div>
</template>
<style>
body {
  margin: 0;
  overflow: hidden;
}

.scrollbar-hide::-webkit-scrollbar {
  display: none;
}

.scrollbar-hide {
  -ms-overflow-style: none;
  scrollbar-width: none;
}

.leaflet-container {
  background: #0f172a !important;
}

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
  @page {
    margin: 0;
    size: landscape;
  }

  body {
    -webkit-print-color-adjust: exact;
    overflow: visible !important;
  }

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