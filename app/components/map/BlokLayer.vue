<template>
  <LLayerGroup v-if="geoJsonData">

    <LPolygon
      v-for="(feature, index) in filteredFeatures"
      :key="getPolygonKey(feature, index)"
      :lat-lngs="feature.geometry.coordinates"
      :options="getStyleOptions(feature)"
    >
      <LTooltip :options="{ permanent: true, direction: 'center', className: 'label-blok-map' }">
        {{ feature.properties.BLOCK_NAME }}
      </LTooltip>

      <LPopup>
        <div class="min-w-[250px] p-1 font-sans text-slate-900">
          <div class="flex justify-between items-start border-b border-slate-100 pb-2 mb-2">
            <div>
              <h3 class="font-black text-lg uppercase leading-none">Blok {{ feature.properties.BLOCK_NAME }}</h3>
              <span class="text-[10px] text-slate-400 font-bold uppercase">AFD {{ feature.properties.AFD_NAME }}</span>
            </div>
            <div class="text-[9px] bg-gray-100 px-1.5 py-0.5 rounded text-gray-500 font-mono">
               {{ selectedMonth }}/{{ selectedYear }}
            </div>
          </div>
          
          <div v-if="isLoading" class="py-4 text-center">
             <div class="inline-block w-4 h-4 border-2 border-green-500 border-t-transparent rounded-full animate-spin"></div>
             <p class="text-[10px] text-gray-400 mt-1">Mengambil data...</p>
          </div>

          <div v-else-if="apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]" class="space-y-3">
            <div class="bg-gray-50 border border-gray-100 p-2 rounded-xl">
              <div class="flex justify-between items-center mb-1">
                <span class="text-[9px] font-black text-gray-600 uppercase">Monitoring Harian</span>
                <span class="text-[9px] text-gray-400 font-mono">
                  {{ apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]?.status_terkini?.skoring_harian?.tanggal || '-' }}
                </span>
              </div>
              <div class="flex justify-between items-end">
                <p class="font-black text-gray-800 text-sm uppercase">
                  {{ apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]?.status_terkini?.skoring_harian?.status || 'Tidak Ada Data' }}
                </p>
                <p class="text-sm font-mono font-black text-gray-700">
                  {{ apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]?.status_terkini?.skoring_harian?.skor || '0.00' }}
                </p>
              </div>
            </div>
          </div>

          <div v-else class="py-4 text-center">
            <p class="text-xs text-slate-400 italic">Data monitoring belum tersedia untuk periode ini.</p>
          </div>
        </div>
      </LPopup>
    </LPolygon>

    <LMarker
      v-for="point in monitoringPoints"
      :key="point.uniqueId"
      :lat-lng="[point.lat, point.lng]"
      :icon="createPointIcon(point.tindakan)" 
      @click="handlePointClick(point, $event)" 
    >
      <LTooltip :options="{ direction: 'top', offset: [0, -6] }">
        <div class="text-xs text-center font-sans text-slate-800">
          <strong>Titik Pantau</strong><br>
          <span class="text-[10px] text-slate-500">{{ point.tindakan }}</span>
        </div>
      </LTooltip>

      <LPopup :options="{ maxWidth: 300, minWidth: 220 }">
        <div class="font-sans text-slate-900">
           <div class="border-b border-gray-100 pb-2 mb-2">
              <div class="flex justify-between items-start">
                  <div>
                    <h4 class="font-bold text-xs uppercase text-slate-700">Detail Titik</h4>
                    <span class="text-[10px] text-slate-400">Blok {{ point.blok }}</span>
                  </div>
                  <span class="text-[9px] bg-slate-100 px-1 rounded text-slate-500 font-mono h-fit">
                    {{ point.id_monitoring || '#' }}
                  </span>
              </div>
              
              <div class="mt-2 text-right">
                  <span 
                    class="text-[10px] font-bold px-2 py-1 rounded"
                    :class="[ 'Eskalasi'].includes(point.tindakan) ? 'bg-red-50 text-red-700' : 'bg-blue-50 text-blue-900'"
                  >
                     Tindakan: {{ point.tindakan || '-' }}
                  </span>
              </div>
           </div>

           <div v-if="pointLoadingStates[point.uniqueId]" class="py-6 flex flex-col items-center gap-2">
              <div class="w-5 h-5 border-2 border-blue-600 border-t-transparent rounded-full animate-spin"></div>
              <span class="text-[10px] text-slate-500 font-bold">Memuat data...</span>
           </div>

           <div v-else-if="pointApiData[point.uniqueId]" class="space-y-3">
              <div class="rounded-lg overflow-hidden bg-gray-100 border border-gray-200 relative group">
                 <div v-if="pointApiData[point.uniqueId].foto_path">
                    <img 
                      :src="`https://api.palmwateros-tap.com/storage/${pointApiData[point.uniqueId].foto_path}`" 
                      alt="Foto Monitoring"
                      class="w-full h-32 object-cover"
                    />
                    <a :href="`https://api.palmwateros-tap.com/storage/${pointApiData[point.uniqueId].foto_path}`" target="_blank" class="absolute inset-0 bg-black/30 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                        <span class="text-[10px] text-white font-bold bg-black/50 px-2 py-1 rounded">Lihat Foto</span>
                    </a>
                 </div>
                 <div v-else class="h-24 flex items-center justify-center text-gray-400 text-[10px] italic">
                    Tidak ada foto
                 </div>
              </div>

              <div class="grid grid-cols-2 gap-2">
                <div class="bg-blue-50 p-2 rounded border border-blue-100">
                  <span class="block text-[9px] font-bold text-blue-400 uppercase">Tipe Objek</span>
                  <span class="text-xs font-bold text-blue-900">
                     {{ pointApiData[point.uniqueId].tipe_objek || '-' }}
                  </span>
                </div>
                <div class="bg-slate-50 p-2 rounded border border-slate-100">
                  <span class="block text-[9px] font-bold text-slate-400 uppercase">Tanggal</span>
                  <span class="text-xs font-bold text-slate-700 font-mono">
                     {{ pointApiData[point.uniqueId].tanggal || '-' }}
                  </span>
                </div>
              </div>
           </div>

           <div v-else class="text-center py-4 bg-red-50 rounded border border-red-100">
              <span class="text-[10px] text-red-500 font-bold">Gagal memuat detail.</span>
           </div>
        </div>
      </LPopup>
    </LMarker>

  </LLayerGroup>
</template>

<script setup>
import { ref, onMounted, computed, watch } from 'vue'
import { LLayerGroup, LPolygon, LPopup, LTooltip, LMarker } from '@vue-leaflet/vue-leaflet'
import L from 'leaflet' 
import proj4 from 'proj4'

// 1. PROPS

const props = defineProps({ 
  filterAfd: { type: Array, default: () => ['All'] },
  selectedMonth: { type: [Number,Object], required: true },
  selectedYear: { type: [Number,Object], required: true }
})

const emit = defineEmits(['ready', 'update-afdelings'])

// Definisi UTM Zone 50N (Sesuaikan jika zona berbeda)
proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

// --- STATE MANAGEMENT ---
const geoJsonData = ref(null)
const apiData = ref({}) 
const isLoading = ref(false)
const pointApiData = ref({})      
const pointLoadingStates = ref({}) 

// --- HELPER: ICON LOGIC (UPDATED) ---
const createPointIcon = (tindakan) => {
  // Daftar tindakan yang dianggap "Urgent" (Merah)
  const urgentActions = ['Eskalasi'];
  
  // Cek apakah tindakan ada dalam daftar urgent
  const isUrgent = urgentActions.includes(tindakan);
  const color = isUrgent ? '#ef4444' : '#ffffff';

  return L.divIcon({
    className: '', 
    html: `
      <div 
        class="w-2.5 h-2.5 rounded-full border border-white shadow-md hover:scale-150 transition-transform" 
        style="background-color: ${color};" 
      ></div>
    `,
    iconSize: [12, 12],   
    iconAnchor: [6, 6],   
    popupAnchor: [0, -6]  
  })
}

// --- COMPUTED PROPERTIES ---

// Mengambil titik koordinat dari API Data
const monitoringPoints = computed(() => {
  const points = []
  const keys = Object.keys(apiData.value)
  
  keys.forEach(blockKey => {
    const data = apiData.value[blockKey]
    const listCoords = data?.status_terkini?.skoring_harian?.titik_koordinat
    const blockAfd = data.afdeling
    
    // Filter berdasarkan Afdeling yang dipilih
    const isVisible = props.filterAfd.includes('All') || (blockAfd && props.filterAfd.includes(blockAfd))

    if (listCoords && Array.isArray(listCoords) && isVisible) {
      listCoords.forEach((c, i) => {
        const latVal = parseFloat(c.lat)
        const longVal = parseFloat(c.long)
        
        if (!isNaN(latVal) && !isNaN(longVal)) {
          const idMonitor = c.id_monitoring_harian || c.id || null
          const uniqueKey = idMonitor ? `pt-${idMonitor}` : `temp-${blockKey}-${i}`
          
          points.push({
            uniqueId: uniqueKey,
            id_monitoring: idMonitor,
            lat: latVal,
            lng: longVal,
            blok: data.blok,
            tindakan: c.tindakan
          })
        }
      })
    }
  })
  return points
})

// Filter Polygon Blok berdasarkan Afdeling
const filteredFeatures = computed(() => {
  if (!geoJsonData.value) return []
  if (props.filterAfd.includes('All')) return geoJsonData.value.features
  return geoJsonData.value.features.filter(f => props.filterAfd.includes(f.properties.AFD_NAME))
})

// --- METHODS ---

const getPolygonKey = (feature, index) => {
  const blockName = feature.properties.BLOCK_NAME.toString().trim().toUpperCase()
  const statusData = apiData.value[blockName]
  const statusString = statusData?.status_terkini?.skoring_harian?.status || 'nodata'
  return `${blockName}-${index}-${statusString}-${props.selectedMonth}-${props.selectedYear}`
}

// Menentukan Warna Blok berdasarkan Status
const getStyleOptions = (feature) => {
  const blockName = feature.properties.BLOCK_NAME?.toString().trim().toUpperCase()
  const data = apiData.value[blockName]
  const status = data?.status_terkini?.skoring_harian?.status?.toLowerCase() || ''
  
  // Default Style
  let style = { 
    color: '#f8fafc', 
    weight: 1.5, 
    fillColor: '#ffffff', 
    fillOpacity: 0.1, 
    className: '' 
  }

  if (isLoading.value) return { ...style, fillOpacity: 0.05 }
  if (!status) return style

  // Logic Pewarnaan Status
  if (status.includes('3')) { 
    style.fillColor = '#ef4444'; 
    style.fillOpacity = 0.75; 
  } 
  else if (status.includes('2')) { 
    style.fillColor = '#f97316'; // Oranye (Waspada)
    style.fillOpacity = 0.75; 
  } 
  else if (status.includes('1') || ['aman', 'normal'].includes(status)) { 
    style.fillColor = '#22c55e'; // Hijau (Aman)
    style.fillOpacity = 0.75; 
  }
  
  return style
}

// Fetch Data Status (GIS All Status)
const fetchAllStatus = async () => {
  isLoading.value = true
  try {
    const url = `https://api.palmwateros-tap.com/api/gis/all-status?month=${props.selectedMonth}&year=${props.selectedYear}`
    const res = await fetch(url)
    const result = await res.json()
    
    if (result.status) {
      const mapped = {}
      result.data.forEach(item => {
        if (item.blok) {
           const key = String(item.blok).trim().toUpperCase()
           mapped[key] = item
        }
      })
      apiData.value = mapped
    } else {
       apiData.value = {}
    }
  } catch (e) { 
     console.error("[Map] API Error:", e)
     apiData.value = {}
  } finally {
     isLoading.value = false
  }
}

// Fetch Detail Titik Pantau saat Marker diklik
const handlePointClick = async (point, e) => {
  if (e) L.DomEvent.stopPropagation(e)
  
  if (pointApiData.value[point.uniqueId]) return
  if (!point.id_monitoring) return

  pointLoadingStates.value[point.uniqueId] = true

  try {
    const url = `https://api.palmwateros-tap.com/api/gis/detail-monitoring/${point.id_monitoring}`
    const res = await fetch(url)
    const result = await res.json()
    
    if (result) {
       pointApiData.value = {
          ...pointApiData.value,
          [point.uniqueId]: result.data || result
       }
    }
  } catch (err) {
    console.error("Error fetching point detail:", err)
  } finally {
    pointLoadingStates.value[point.uniqueId] = false
  }
}

// --- WATCHERS & LIFECYCLE ---

// Auto-fetch saat bulan/tahun berubah
watch(() => [props.selectedMonth, props.selectedYear], () => {
    fetchAllStatus()
}, { immediate: true })

onMounted(async () => {
  try {
    // Load GeoJSON Blok
    const res = await fetch('/Blok.json')
    const data = await res.json()
    const afdMap = {}
    
    // Konversi Koordinat UTM ke LatLng & Hitung Afdeling
    data.features = data.features.map(f => {
      const name = f.properties.AFD_NAME
      afdMap[name] = (afdMap[name] || 0) + 1
      
      const convert = (ring) => ring.map(c => {
        // Konversi proj4
        const r = proj4('EPSG:32650', 'EPSG:4326', [parseFloat(c[0]), parseFloat(c[1])])
        return [r[1], r[0]] 
      })

      f.geometry.coordinates = f.geometry.type === 'Polygon' 
        ? f.geometry.coordinates.map(convert) 
        : f.geometry.coordinates.map(p => p.map(convert))
      return f
    })

    // Emit data ke Parent Component
    emit('update-afdelings', Object.keys(afdMap).sort().map(n => ({ name: n, count: afdMap[n] })))
    geoJsonData.value = data
    emit('ready', data)
    
  } catch (e) { console.error("Map Init Error:", e) }
})
</script>

<style>
/* Style Khusus untuk Label di Peta */
.label-blok-map {
  background: transparent !important;
  border: none !important;
  box-shadow: none !important;
  color: rgba(255, 255, 255, 0.9) !important;
  font-weight: 800 !important;
  font-size: 10px !important;
  text-shadow: 1px 1px 2px rgba(0,0,0,0.8);
  pointer-events: none;
}
</style>