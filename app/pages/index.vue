<script setup>
import { ref, computed, watch, onMounted, shallowRef, nextTick } from 'vue'
import { LMap, LTileLayer, LControlZoom } from '@vue-leaflet/vue-leaflet'
import 'leaflet/dist/leaflet.css'
import { toPng } from 'html-to-image'
import jsPDF from 'jspdf'

definePageMeta({ layout: false })
useHead({ title: 'GIS - Water Management System' })

const colorMode = useColorMode()
const isOpen = ref(false)
const { coords, isLocating } = useLocation()
const weather = ref(null)

// --- STATE EXPORT & UI ---
const isExporting = ref(false)
const showExportMenu = ref(false)
const exportConfig = ref({
  format: 'pdf',     // 'pdf' | 'png'
  size: 'a4',        // 'a4' | 'a3' | 'letter'
  orientation: 'l'   // 'l' (landscape) | 'p' (portrait)
})

const selectedBlock = ref(null)

const resetSelection = () => {
  selectedBlock.value = null
}

const mapRef = shallowRef(null)
const zoom = ref(14)
const initialCenter = ref([1.24644, 117.90811])
const currentBasemap = ref('satellite')

const showRainOverlay = ref(false)
const showBlok = ref(true)
const showInfra = ref(false)
const showWaterLevel = ref(false)
const showGroupDAS = ref(false)
const showBmkg = ref(false)

const loadingLayers = ref({
  blok: false, infra: false, water: false, das: false
})

const infraRawData = shallowRef(null)
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

watch(isOpen, async () => {
  await nextTick()
  setTimeout(() => {
    if (mapRef.value?.leafletObject) {
      mapRef.value.leafletObject.invalidateSize()
    }
  }, 350)
})

const recenterMap = () => {
  if (coords.value?.lat && mapRef.value?.leafletObject) {
    mapRef.value.leafletObject.flyTo([coords.value.lat, coords.value.lng], 16)
  }
}

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

    infraCategoriesList.value = Object.keys(categoryMap).map(key => ({
      name: key,
      count: categoryMap[key]
    }))
    selectedInfraCategories.value = infraCategoriesList.value.map(c => c.name)
  } catch (e) {
    console.error("Gagal memuat Data GeoJSON:", e)
  }
})

watch([selectedMonth, selectedYear], () => {
  if (showBlok.value) triggerLoading('blok', true)
  if (showInfra.value) triggerLoading('infra', true)
  if (showWaterLevel.value) triggerLoading('water', true)
})

watch(selectedAfd, () => {
  selectedBlock.value = null
})

const isDark = computed({
  get() { return colorMode.value === 'dark' },
  set() { colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark' }
})

const exportProgress = ref(0)
const exportStatus = ref('Menyiapkan...')

// --- LOGIC EXPORT DENGAN PROGRESS BAR ---
const handleExport = async () => {
  // 1. Reset & Setup Awal
  showExportMenu.value = false
  isExporting.value = true
  exportProgress.value = 0
  exportStatus.value = 'Menyiapkan area peta...'

  // 2. Progress Awal (Fake step)
  const progressInterval = setInterval(() => {
    // Naikkan pelan-pelan sampai 85%, berhenti di sana sampai proses asli selesai
    if (exportProgress.value < 85) {
      exportProgress.value += Math.floor(Math.random() * 5) + 1
    }
  }, 300)

  try {
    // Tunggu UI refresh agar menu tertutup sempurna
    await nextTick()
    await new Promise(resolve => setTimeout(resolve, 500))

    const elementToPrint = document.getElementById('map-print-area')
    if (!elementToPrint) throw new Error('Element map tidak ditemukan')

    // Update Status
    exportStatus.value = 'Merender visualisasi peta...'

    // Filter Node (Sama seperti sebelumnya)
    const filterNode = (node) => {
      if (node.nodeType === 1) {
        if (node.hasAttribute('data-export-ignore')) return false;
        if (node.classList.contains('leaflet-control-zoom')) return false;
      }
      return true;
    }
    const imgData = await toPng(elementToPrint, {
      quality: 0.9,
      pixelRatio: 1,
      backgroundColor: '#ffffff',
      filter: filterNode,
      cacheBust: true,
      skipAutoScale: true,
      skipFonts: true
    })
    clearInterval(progressInterval)
    exportProgress.value = 90 // Set hampir selesai
    exportStatus.value = 'Menyusun dokumen akhir...'

    const { format, size, orientation } = exportConfig.value
    const timestamp = new Date().toISOString().slice(0, 10)
    const filename = `Peta-${selectedAfd.value}-${timestamp}`

    if (format === 'png') {
      const link = document.createElement('a')
      link.href = imgData
      link.download = `${filename}.png`
      link.click()
    } else {
      const pdf = new jsPDF({
        orientation: orientation === 'l' ? 'landscape' : 'portrait',
        unit: 'mm',
        format: size
      })

      const pdfW = pdf.internal.pageSize.getWidth()
      const pdfH = pdf.internal.pageSize.getHeight()
      const imgProps = pdf.getImageProperties(imgData)
      const imgRatio = imgProps.width / imgProps.height
      const pageRatio = pdfW / pdfH

      let finalW, finalH
      if (imgRatio > pageRatio) {
        finalW = pdfW; finalH = finalW / imgRatio
      } else {
        finalH = pdfH; finalW = finalH * imgRatio
      }
      const x = (pdfW - finalW) / 2
      const y = (pdfH - finalH) / 2
      pdf.addImage(imgData, 'PNG', x, y, finalW, finalH)
      pdf.save(`${filename}.pdf`)
    }
    exportProgress.value = 100
    exportStatus.value = 'Selesai!'
    await new Promise(resolve => setTimeout(resolve, 800))
  } catch (error) {
    console.error('Export Error:', error)
    clearInterval(progressInterval) // Pastikan interval mati jika error
    alert('Gagal melakukan export.')
  } finally {
    clearInterval(progressInterval) // Double check interval mati
    isExporting.value = false
    exportProgress.value = 0
  }
}
</script>

<template>
  <div class="flex h-screen w-screen bg-white dark:bg-gray-900 overflow-hidden relative">
    <div v-if="isExporting"
      class="fixed inset-0 z-[9999] bg-gray-900/90 backdrop-blur-md flex flex-col items-center justify-center text-white px-8">

      <div class="w-full max-w-sm text-center">
        <div class="mb-6 relative inline-block">
          <div class="absolute inset-0 bg-green-500 blur-xl opacity-20 animate-pulse rounded-full"></div>
          <UIcon name="i-heroicons-printer" class="w-16 h-16 text-green-400 relative z-10" />
        </div>

        <h2 class="text-2xl font-bold tracking-tight mb-2">Mengekspor Peta</h2>
        <p class="text-gray-400 text-sm font-medium animate-pulse mb-6">{{ exportStatus }}</p>

        <div class="w-full h-3 bg-gray-800 rounded-full overflow-hidden border border-gray-700 shadow-inner relative">
          <div
            class="h-full bg-gradient-to-r from-green-500 to-emerald-400 transition-all duration-300 ease-out rounded-full shadow-[0_0_10px_rgba(34,197,94,0.5)]"
            :style="{ width: `${exportProgress}%` }">
            <div class="absolute inset-0 bg-white/20 w-full animate-[shimmer_2s_infinite]"></div>
          </div>
        </div>

        <div class="mt-2 text-right">
          <span class="text-xs font-mono text-green-400">{{ exportProgress }}%</span>
        </div>
      </div>

    </div>

    <div class="h-full absolute z-[90] lg:static print:hidden" data-export-ignore="true">
      <Sidebar :is-open="isOpen" @close="isOpen = false" v-model:showBlok="showBlok" v-model:showInfra="showInfra"
        v-model:showGroupDAS="showGroupDAS" v-model:showWaterLevel="showWaterLevel" v-model:showRain="showRainOverlay"
        v-model:showBmkg="showBmkg" :loading-states="loadingLayers" v-model:basemap="currentBasemap"
        :infra-categories="infraCategoriesList" v-model:selectedInfra="selectedInfraCategories"
        @recenter="recenterMap" />
    </div>

    <div class="flex-1 flex flex-col min-w-0 h-full relative transition-all duration-300"
      :class="isOpen ? 'lg:pl-72' : 'lg:pl-0'">

      <header
        class="sticky top-0 z-100 w-full border-b border-gray-200 dark:border-gray-800 bg-white/80 dark:bg-gray-900/80 backdrop-blur-md">
        <div class="max-w-7xl mx-auto px-4 h-16 lg:h-20 flex justify-between items-center">
          <div class="flex items-center gap-4">
            <UButton icon="i-heroicons-bars-3-20-solid" color="gray" variant="ghost" class="lg:hidden"
              @click="isOpen = !isOpen" data-export-ignore="true" />
            <div>
              <h1 class="text-lg lg:text-2xl font-bold text-green-900 dark:text-green-400 leading-tight">Web GIS Water
                Management</h1>
              <p class="text-[10px] lg:text-sm text-gray-500 uppercase font-bold tracking-wider">Monitoring System</p>
            </div>
          </div>

          <div class="flex items-center gap-4">
            <div v-if="selectedBlock"
              class="hidden md:flex items-center gap-2 px-3 py-1 bg-blue-50 text-blue-700 rounded-full border border-blue-200 animate-pulse cursor-pointer"
              @click="resetSelection">
              <span class="text-[10px] font-black uppercase">FOKUS: BLOK {{ selectedBlock }}</span>
              <UIcon name="i-heroicons-x-mark" class="w-4 h-4" />
            </div>

            <div v-if="weather"
              class="hidden md:flex items-center gap-3 px-4 py-2 bg-gray-50 dark:bg-gray-800 rounded-2xl border border-gray-100 dark:border-gray-700">
              <div class="text-right leading-none">
                <p class="text-[10px] font-bold text-gray-400 uppercase mb-1">Cuaca</p>
                <p class="text-sm font-bold text-gray-700 dark:text-gray-200">{{ weather.temp }}°C</p>
              </div>
              <img :src="`https://openweathermap.org/img/wn/${weather.icon}@2x.png`" class="w-10 h-10 -my-2"
                alt="weather icon" />
            </div>

            <div class="relative" data-export-ignore="true">
              <UButton icon="i-heroicons-printer" color="gray" variant="ghost" @click="showExportMenu = !showExportMenu"
                class="hidden sm:flex" />

              <div v-if="showExportMenu"
                class="absolute right-0 top-full mt-3 w-80 bg-white dark:bg-gray-800 rounded-xl shadow-2xl border border-gray-200 dark:border-gray-700 p-5 z-[1000] transform origin-top-right transition-all">
                <div class="flex justify-between items-center mb-4 pb-2 border-b border-gray-100 dark:border-gray-700">
                  <h3 class="font-bold text-gray-900 dark:text-white text-sm">Download Peta</h3>
                  <UButton icon="i-heroicons-x-mark" size="2xs" color="gray" variant="ghost"
                    @click="showExportMenu = false" />
                </div>

                <div class="space-y-5">

                  <div>
                    <label class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-2 block">Format
                      File</label>
                    <div class="grid grid-cols-2 gap-3">
                      <button @click="exportConfig.format = 'pdf'"
                        class="flex flex-col items-center justify-center gap-2 p-3 rounded-xl border-2 transition-all duration-200"
                        :class="exportConfig.format === 'pdf'
                          ? 'border-green-500 bg-green-50 dark:bg-green-900/30 text-green-700 dark:text-green-400 ring-2 ring-green-500 ring-offset-2 dark:ring-offset-gray-800'
                          : 'border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-500'">
                        <UIcon name="i-heroicons-document-text" class="w-6 h-6" />
                        <span class="text-xs font-bold">PDF Document</span>
                      </button>

                      <button @click="exportConfig.format = 'png'"
                        class="flex flex-col items-center justify-center gap-2 p-3 rounded-xl border-2 transition-all duration-200"
                        :class="exportConfig.format === 'png'
                          ? 'border-green-500 bg-green-50 dark:bg-green-900/30 text-green-700 dark:text-green-400 ring-2 ring-green-500 ring-offset-2 dark:ring-offset-gray-800'
                          : 'border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-500'">
                        <UIcon name="i-heroicons-photo" class="w-6 h-6" />
                        <span class="text-xs font-bold">Gambar PNG</span>
                      </button>
                    </div>
                  </div>

                  <div v-if="exportConfig.format === 'pdf'" class="animate-in fade-in slide-in-from-top-2 duration-300">
                    <label class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-2 block">Ukuran
                      Kertas</label>
                    <select v-model="exportConfig.size"
                      class="w-full bg-gray-50 dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-lg px-3 py-2 text-sm font-medium focus:ring-2 focus:ring-green-500 outline-none">
                      <option value="a4">A4 (Standar)</option>
                      <option value="a3">A3 (Besar)</option>
                      <option value="letter">Letter</option>
                    </select>
                  </div>

                  <div v-if="exportConfig.format === 'pdf'" class="animate-in fade-in slide-in-from-top-2 duration-300">
                    <label
                      class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-2 block">Orientasi</label>
                    <div class="grid grid-cols-2 gap-3">
                      <button @click="exportConfig.orientation = 'l'"
                        class="flex items-center justify-center gap-2 p-2 rounded-lg border transition-all" :class="exportConfig.orientation === 'l'
                          ? 'border-green-500 bg-green-50 text-green-700 font-bold dark:bg-green-900/30 dark:text-green-400'
                          : 'border-gray-200 text-gray-500 dark:border-gray-700'">
                        <UIcon name="i-heroicons-stop" class="w-4 h-4 rotate-90" />
                        <span class="text-xs">Landscape</span>
                      </button>

                      <button @click="exportConfig.orientation = 'p'"
                        class="flex items-center justify-center gap-2 p-2 rounded-lg border transition-all" :class="exportConfig.orientation === 'p'
                          ? 'border-green-500 bg-green-50 text-green-700 font-bold dark:bg-green-900/30 dark:text-green-400'
                          : 'border-gray-200 text-gray-500 dark:border-gray-700'">
                        <UIcon name="i-heroicons-stop" class="w-4 h-4" />
                        <span class="text-xs">Portrait</span>
                      </button>
                    </div>
                  </div>

                  <button @click="handleExport"
                    class="w-full py-3 mt-2 bg-green-600 hover:bg-green-700 text-white rounded-xl font-bold shadow-lg shadow-green-600/20 active:scale-[0.98] transition-all flex items-center justify-center gap-2">
                    <UIcon name="i-heroicons-arrow-down-tray" class="w-5 h-5" />
                    Download File
                  </button>
                </div>
              </div>
            </div>

            <ClientOnly>
              <UButton :icon="isDark ? 'i-heroicons-moon-20-solid' : 'i-heroicons-sun-20-solid'" color="gray"
                variant="ghost" @click="isDark = !isDark" data-export-ignore="true" />
            </ClientOnly>
          </div>
        </div>
      </header>

      <main class="flex-1 relative overflow-hidden" id="map-print-area">

        <div
          class="absolute top-3 inset-x-3 z-[80] flex flex-col gap-2 pointer-events-none sm:top-4 sm:inset-x-4 sm:flex-row sm:justify-between items-start">
          <div class="pointer-events-auto w-full sm:w-auto">
            <ToggleDate v-model:selectedMonth="selectedMonth" v-model:selectedYear="selectedYear"
              :month-list="monthList" :year-list="yearList" />
          </div>
          <div class="pointer-events-auto w-full sm:w-auto flex justify-start sm:justify-end">
            <ToggleAfdeling v-model="selectedAfd" :afdeling-list="afdelingList" />
          </div>
        </div>

        <ClientOnly>
          <LMap ref="mapRef" :zoom="zoom" :center="initialCenter" :use-global-leaflet="false" class="h-full w-full z-0"
            :options="{
              zoomControl: false,
              attributionControl: false,
              preferCanvas: true
            }">
            <LTileLayer v-if="currentBasemap === 'street'" url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
              :options="{ crossOrigin: 'anonymous' }" />
            <LTileLayer v-if="currentBasemap === 'satellite'"
              url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"
              :options="{ crossOrigin: 'anonymous' }" />
            <MapGroupDASLayer v-if="showGroupDAS" />
            <MapAfdelingLayer />
            <MapBlokLayer v-if="showBlok" :key="`blok-${selectedMonth}-${selectedYear}`" :filter-afd="selectedAfd"
              :selected-month="selectedMonth" :selected-year="selectedYear" :selected-block="selectedBlock"
              @update-afdelings="list => afdelingList = list" @select-block="(val) => selectedBlock = val" />
            <MapInfrastructureLayer v-if="showInfra && infraRawData" :key="`infra-${selectedMonth}-${selectedYear}`"
              :geo-json="infraRawData" :filter-afd="selectedAfd" :selected-month="selectedMonth"
              :selected-year="selectedYear" :active-categories="selectedInfraCategories"
              :selected-block="selectedBlock" />
            <MapWaterLevelLayer v-if="showWaterLevel && waterLevelRawData" :key="`wl-${selectedMonth}-${selectedYear}`"
              :selected-month="selectedMonth" :selected-year="selectedYear" :geo-json="waterLevelRawData"
              :filter-afd="selectedAfd" :selected-block="selectedBlock" />
            <LTileLayer v-if="showRainOverlay" :key="'rain-layer'"
              url="https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=4a192ab87b2343ada7da03f7712b7988"
              :opacity="0.7" :options="{ crossOrigin: 'anonymous' }" />
          </LMap>
        </ClientOnly>

        <MapRainLegend v-if="showRainOverlay" />
        <MapLoadingOverlay v-if="isLocating" />
        <div class="absolute bottom-6 left-2 z-[80] pointer-events-auto sm:left-4 max-w-[calc(100%-2rem)]">
          <MapLegends :active-layers="{ blok: showBlok, infra: showInfra, water: showWaterLevel }"
            :selected-infra="selectedInfraCategories" :infra-categories="infraCategoriesList" />
        </div>
        <div v-if="isExporting"
          class="absolute bottom-2 right-2 z-[999] bg-white/80 px-2 py-1 text-[8px] text-gray-600 rounded">
          Dicetak pada: {{ new Date().toLocaleString() }}
        </div>
      </main>
    </div>
  </div>
</template>

<style>
.leaflet-container {
  background: #f3f4f6;
}
</style>