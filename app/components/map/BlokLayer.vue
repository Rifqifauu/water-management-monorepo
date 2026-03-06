<template>
  <LLayerGroup v-if="geoJsonData" ref="layerGroupRef">

    <LPolygon 
      v-for="feature in filteredFeatures" 
      :key="feature.properties._uniqueId"
      :ref="el => setPolygonRef(el, feature.properties.BLOCK_NAME)"
      :lat-lngs="feature.geometry.coordinates" 
      :options="getStyleOptions(feature)" 
      @click="onPolygonClick(feature)"
      @popupclose="onPopupClose">
      
      <LTooltip :options="{ permanent: true, direction: 'center', className: 'label-blok-map' }">
        {{ feature.properties.BLOCK_NAME }}
      </LTooltip>

      <LPopup :options="{ minWidth: 260, maxWidth: 300 }">
        <div class="p-1 font-sans text-slate-900">
          <div class="flex justify-between items-start border-b border-slate-100 pb-2 mb-2 pr-4">
            <div>
              <h3 class="font-black text-lg uppercase leading-none">Blok {{ feature.properties.BLOCK_NAME }}</h3>
              <span class="text-[10px] text-slate-400 font-bold uppercase">AFD {{ feature.properties.AFD_NAME }}</span>
            </div>
            <div class="text-[9px] bg-gray-100 px-1.5 py-0.5 rounded text-gray-500 font-mono">
              {{ selectedMonth }}/{{ selectedYear }}
            </div>
          </div>

          <div v-if="isLoading && !hasLoadedData" class="py-4 text-center">
            <div class="inline-block w-4 h-4 border-2 border-green-500 border-t-transparent rounded-full animate-spin">
            </div>
            <p class="text-[10px] text-gray-400 mt-1">Mengambil data...</p>
          </div>

          <div v-else-if="apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]" class="space-y-3">

            <div class="bg-gray-50 border border-gray-100 p-2 rounded-xl">
              <div class="flex justify-between items-center mb-1">
                <span class="text-[9px] font-black text-gray-600 uppercase">Monitoring Harian</span>
                <span class="text-[9px] text-gray-400 font-mono">
                  {{
                    apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]?.status_terkini?.skoring_harian?.tanggal
                  || '-' }}
                </span>
              </div>
              <div class="flex justify-between items-end">
                <p class="font-black text-gray-800 text-sm uppercase">
                  {{
                    apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]?.status_terkini?.skoring_harian?.status
                  || 'Tidak Ada Data' }}
                </p>
                <p class="text-sm font-mono font-black text-gray-700">
                  {{
                    apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]?.status_terkini?.skoring_harian?.skor
                  || '0.00' }}
                </p>
              </div>
            </div>

            <div v-if="getTindakanStats(feature.properties.BLOCK_NAME)" class="space-y-1.5">
              <div class="flex justify-between items-center px-1">
                <span class="text-[9px] font-black text-slate-500 uppercase">Ringkasan Tindakan</span>
                <span class="text-[9px] font-bold text-slate-400 bg-slate-100 px-1.5 rounded-full">
                  Total: {{
                    apiData[feature.properties.BLOCK_NAME.toString().trim().toUpperCase()]?.status_terkini?.skoring_harian?.titik_koordinat?.length
                  || 0 }}
                </span>
              </div>

              <div class="grid grid-cols-2 gap-1.5">
                <div v-for="(count, tindakan) in getTindakanStats(feature.properties.BLOCK_NAME)" :key="tindakan"
                  class="flex justify-between items-center px-2 py-1.5 rounded-lg border transition-colors" :class="tindakan.toLowerCase().includes('eskalasi')
                    ? 'bg-red-50 border-red-100'
                    : 'bg-slate-200 border-blue-100'">
                  <div class="flex items-center gap-1.5 overflow-hidden">
                    <div class="w-1.5 h-1.5 rounded-full shrink-0"
                      :class="tindakan.toLowerCase().includes('eskalasi') ? 'bg-red-500' : 'bg-white '"></div>
                    <span class="text-[8px] font-bold truncate uppercase"
                      :class="tindakan.toLowerCase().includes('eskalasi') ? 'text-red-700' : 'text-slate-600'">
                      {{ tindakan }}
                    </span>
                  </div>
                  <span class="text-[10px] font-black font-mono"
                    :class="tindakan.toLowerCase().includes('eskalasi') ? 'text-red-800' : 'text-slate-800'">
                    {{ count }}
                  </span>
                </div>
              </div>
            </div>

          </div>

          <div v-else class="py-4 text-center">
            <p class="text-xs text-slate-400 italic">Data monitoring belum tersedia.</p>
          </div>
        </div>
      </LPopup>
    </LPolygon>

    <LMarker v-for="point in monitoringPoints" :key="point.uniqueId" :lat-lng="[point.lat, point.lng]"
      :icon="createPointIcon(point.tindakan)" @mousedown="onMarkerMouseDown" @click="handlePointClick(point, $event)">
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
              <span class="text-[10px] font-bold px-2 py-1 rounded"
                :class="['Eskalasi'].includes(point.tindakan) ? 'bg-red-50 text-red-700' : 'bg-blue-50 text-blue-900'">
                Tindakan: {{ point.tindakan || '-' }}
              </span>
            </div>
          </div>

          <div v-if="pointLoadingStates[point.uniqueId]" class="py-6 flex flex-col items-center gap-2">
            <div class="w-5 h-5 border-2 border-blue-600 border-t-transparent rounded-full animate-spin"></div>
            <span class="text-[10px] text-slate-500 font-bold">Memuat data...</span>
          </div>

          <div v-else-if="pointApiData[point.uniqueId]" class="space-y-3">
        <div class="rounded-lg overflow-hidden bg-gray-100 border border-gray-200 shadow-sm">
  
  <div v-if="pointApiData[point.uniqueId].foto_path || pointApiData[point.uniqueId].foto_after" 
       class="grid grid-cols-2 gap-px bg-gray-200">
    
    <div v-if="pointApiData[point.uniqueId].foto_path" 
         class="relative group h-32"
         :class="{'col-span-2': !pointApiData[point.uniqueId].foto_after}">
      
      <img :src="`https://api.palmwateros-tap.com/storage/${pointApiData[point.uniqueId].foto_path}`"
           class="w-full h-full object-cover" 
           alt="Foto Before" />
      
      <span class="absolute top-1 left-1 bg-black/60 text-white text-[9px] px-1.5 py-0.5 rounded backdrop-blur-sm z-10">
        Before
      </span>

      <a :href="`https://api.palmwateros-tap.com/storage/${pointApiData[point.uniqueId].foto_path}`"
         target="_blank"
         class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity duration-200 flex items-center justify-center z-20">
        <span class="text-[10px] text-white font-bold bg-white/20 border border-white/50 px-3 py-1 rounded backdrop-blur-sm">
          Lihat Foto
        </span>
      </a>
    </div>

    <div v-if="pointApiData[point.uniqueId].foto_after" 
         class="relative group h-32"
         :class="{'col-span-2': !pointApiData[point.uniqueId].foto_path}">
      
      <img :src="`https://api.palmwateros-tap.com/storage/${pointApiData[point.uniqueId].foto_after}`"
           class="w-full h-full object-cover" 
           alt="Foto After" />
           
      <span class="absolute top-1 left-1 bg-green-600/80 text-white text-[9px] px-1.5 py-0.5 rounded backdrop-blur-sm z-10">
        After
      </span>

      <a :href="`https://api.palmwateros-tap.com/storage/${pointApiData[point.uniqueId].foto_after}`"
         target="_blank"
         class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition-opacity duration-200 flex items-center justify-center z-20">
        <span class="text-[10px] text-white font-bold bg-white/20 border border-white/50 px-3 py-1 rounded backdrop-blur-sm">
          Lihat Foto
        </span>
      </a>
    </div>
  </div>

  <div v-else class="h-24 flex flex-col items-center justify-center text-gray-400 bg-gray-50">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mb-1 opacity-50" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
    </svg>
    <span class="text-[10px] italic">Tidak ada foto</span>
  </div>

</div>
            <div class="grid grid-cols-2 gap-2">
              <div class="bg-blue-50 p-2 rounded border border-blue-100">
                <span class="block text-[9px] font-bold text-blue-400 uppercase">Tipe Objek</span>
                <span class="text-xs font-bold text-blue-900">{{ pointApiData[point.uniqueId].tipe_objek || '-'
                  }}</span>
              </div>
              <div class="bg-slate-50 p-2 rounded border border-slate-100">
                <span class="block text-[9px] font-bold text-slate-400 uppercase">Tanggal</span>
                <span class="text-xs font-bold text-slate-700 font-mono">{{ pointApiData[point.uniqueId].tanggal || '-'
                  }}</span>
              </div>
            </div>
          </div>
          <div v-else class="text-center py-4 bg-red-50 rounded border border-red-100"><span
              class="text-[10px] text-red-500 font-bold">Gagal memuat detail.</span></div>
        </div>
      </LPopup>
    </LMarker>

  </LLayerGroup>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed, watch, nextTick, shallowRef } from 'vue'
import { LLayerGroup, LPolygon, LPopup, LTooltip, LMarker } from '@vue-leaflet/vue-leaflet'
import L from 'leaflet'
import proj4 from 'proj4'

const props = defineProps({
  filterAfd: { type: Array, default: () => ['All'] },
  selectedMonth: { type: [Number, Object], required: true },
  selectedYear: { type: [Number, Object], required: true },
  selectedBlock: { type: String, default: null }
})

const emit = defineEmits(['ready', 'update-afdelings', 'select-block'])
proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

// --- STATE ---
const geoJsonData = shallowRef(null)
const apiData = ref({})
const isLoading = ref(false)
const hasLoadedData = ref(false)
const pointApiData = ref({})
const pointLoadingStates = ref({})
const isUnmounted = ref(false)
const isMarkerClick = ref(false)
const polygonRefs = ref({}) // PERBAIKAN: Store polygon refs
let fetchTimeout = null

// --- POLYGON REF HANDLER ---
const setPolygonRef = (el, blockName) => {
  if (el && blockName) {
    const key = blockName.toString().trim().toUpperCase()
    polygonRefs.value[key] = el
  }
}

// PERBAIKAN: Function untuk update semua polygon styles
const updateAllPolygonStyles = async () => {
  await nextTick()
  
  Object.keys(polygonRefs.value).forEach(blockKey => {
    const polygonComponent = polygonRefs.value[blockKey]
    if (polygonComponent?.leafletObject) {
      const feature = geoJsonData.value?.features.find(f => 
        f.properties.BLOCK_NAME.toString().trim().toUpperCase() === blockKey
      )
      if (feature) {
        const newStyle = getStyleOptions(feature)
        polygonComponent.leafletObject.setStyle(newStyle)
      }
    }
  })
}

// --- HANDLERS UTAMA ---

const onPolygonClick = (feature) => {
  const blockName = feature.properties.BLOCK_NAME.toString().trim().toUpperCase()
  emit('select-block', blockName)
}

const onMarkerMouseDown = () => {
  isMarkerClick.value = true
}

const onPopupClose = () => {
  if (isMarkerClick.value) {
    isMarkerClick.value = false
    return
  }
  if (props.selectedBlock) {
    emit('select-block', null)
  }
}

const handlePointClick = async (point, e) => {
  if (e) L.DomEvent.stopPropagation(e)
  if (isUnmounted.value) return;
  if (pointApiData.value[point.uniqueId]) return
  if (!point.id_monitoring) return

  pointLoadingStates.value[point.uniqueId] = true
  try {
    const url = `https://api.palmwateros-tap.com/api/gis/detail-monitoring/${point.id_monitoring}`
    const res = await fetch(url)
    if (isUnmounted.value) return;
    const result = await res.json()
    if (result && !isUnmounted.value) {
      pointApiData.value = { ...pointApiData.value, [point.uniqueId]: result.data || result }
    }
  } catch (err) {
    if (!isUnmounted.value) console.error("Error fetching detail:", err)
  } finally {
    if (!isUnmounted.value) pointLoadingStates.value[point.uniqueId] = false
  }
}

const filteredFeatures = computed(() => {
  if (!geoJsonData.value) return []
  if (props.selectedBlock) {
    const target = props.selectedBlock.toString().trim().toUpperCase()
    return geoJsonData.value.features.filter(f =>
      f.properties.BLOCK_NAME.toString().trim().toUpperCase() === target
    )
  }
  if (props.filterAfd.includes('All')) return geoJsonData.value.features
  return geoJsonData.value.features.filter(f => props.filterAfd.includes(f.properties.AFD_NAME))
})

const monitoringPoints = computed(() => {
  if (!apiData.value) return []
  const points = []
  const activeBlockKey = props.selectedBlock ? props.selectedBlock.toString().trim().toUpperCase() : null
  const keys = Object.keys(apiData.value)
  keys.forEach(blockKey => {
    if (activeBlockKey && blockKey !== activeBlockKey) return;
    const data = apiData.value[blockKey]
    const listCoords = data?.status_terkini?.skoring_harian?.titik_koordinat
    const blockAfd = data.afdeling
    const isVisible = activeBlockKey || props.filterAfd.includes('All') || (blockAfd && props.filterAfd.includes(blockAfd))
    if (listCoords && Array.isArray(listCoords) && isVisible) {
      listCoords.forEach((c, i) => {
        const latVal = parseFloat(c.lat); const longVal = parseFloat(c.long)
        if (!isNaN(latVal) && !isNaN(longVal)) {
          const idMonitor = c.id_monitoring_harian || c.id || null
          const uniqueKey = idMonitor ? `pt-${idMonitor}` : `temp-${blockKey}-${i}`
          points.push({ uniqueId: uniqueKey, id_monitoring: idMonitor, lat: latVal, lng: longVal, blok: data.blok, tindakan: c.tindakan })
        }
      })
    }
  })
  return points
})

const getStyleOptions = (feature) => {
  const blockName = feature.properties.BLOCK_NAME?.toString().trim().toUpperCase()
  const data = apiData.value[blockName]
  const status = data?.status_terkini?.skoring_harian?.status?.toLowerCase() || ''
  
  const style = { 
    color: '#f8fafc', 
    weight: 1.5, 
    fillColor: '#ffffff', 
    fillOpacity: 0.1
  }
  
  if (isLoading.value && !hasLoadedData.value) {
    return { ...style, fillOpacity: 0.05 }
  }
  
  if (data?.status_terkini?.skoring_harian) {
    if (status.includes('3')) { 
      style.fillColor = '#ef4444'
      style.fillOpacity = 0.75
    }
    else if (status.includes('2')) { 
      style.fillColor = '#f97316'
      style.fillOpacity = 0.75
    }
    else if (status.includes('1') || ['aman', 'normal'].includes(status)) { 
      style.fillColor = '#22c55e'
      style.fillOpacity = 0.75
    }
  }
  
  return style
}

const createPointIcon = (tindakan) => {
  const urgentActions = ['Eskalasi'];
  const isUrgent = urgentActions.includes(tindakan);
  const color = isUrgent ? '#ef4444' : '#ffffff';
  return L.divIcon({
    className: '',
    html: `<div class="w-2.5 h-2.5 rounded-full border border-white shadow-md hover:scale-150 transition-transform" style="background-color: ${color};"></div>`,
    iconSize: [12, 12], iconAnchor: [6, 6], popupAnchor: [0, -6]
  })
}

const fetchAllStatus = async () => {
  if (isUnmounted.value) return;
  
  isLoading.value = true
  
  try {
    const url = `https://api.palmwateros-tap.com/api/gis/all-status?month=${props.selectedMonth}&year=${props.selectedYear}`
    const res = await fetch(url)
    if (isUnmounted.value) return;
    
    const result = await res.json()
    
    if (isUnmounted.value) return;
    
    if (result.status) {
      const mapped = {}
      result.data.forEach(item => {
        if (item.blok) { 
          const key = String(item.blok).trim().toUpperCase()
          mapped[key] = item 
        }
      })
      
      if (!isUnmounted.value) {
        apiData.value = mapped
        hasLoadedData.value = true
        
        // PERBAIKAN: Paksa update semua polygon styles
        await updateAllPolygonStyles()
      }
    } else { 
      if (!isUnmounted.value) {
        apiData.value = {}
        await updateAllPolygonStyles()
      }
    }
  } catch (e) { 
    if (!isUnmounted.value) { 
      console.error("[Map] API Error:", e)
      apiData.value = {} 
    } 
  }
  finally { 
    if (!isUnmounted.value) {
      isLoading.value = false
    }
  }
}

// Debounce untuk mencegah multiple fetch
watch(
  () => [props.selectedMonth, props.selectedYear], 
  () => {
    if (fetchTimeout) clearTimeout(fetchTimeout)
    fetchTimeout = setTimeout(() => {
      fetchAllStatus()
    }, 200)
  }, 
  { immediate: true }
)

const getTindakanStats = (blockName) => {
  const data = apiData.value[blockName.toString().trim().toUpperCase()];
  const listCoords = data?.status_terkini?.skoring_harian?.titik_koordinat;

  if (!listCoords || !Array.isArray(listCoords)) return null;

  return listCoords.reduce((acc, curr) => {
    const tindakan = curr.tindakan || 'Lainnya';
    acc[tindakan] = (acc[tindakan] || 0) + 1;
    return acc;
  }, {});
};

// --- LIFECYCLE ---

onMounted(async () => {
  try {
    const res = await fetch('/Blok.json')
    if (isUnmounted.value) return;
    const data = await res.json()
    const afdMap = {}
    
    let globalIndex = 0; 

    data.features = data.features.map(f => {
      const name = f.properties.AFD_NAME
      afdMap[name] = (afdMap[name] || 0) + 1
      
      f.properties._uniqueId = `poly-${f.properties.BLOCK_NAME}-${globalIndex++}`

      const convert = (ring) => ring.map(c => {
        const r = proj4('EPSG:32650', 'EPSG:4326', [parseFloat(c[0]), parseFloat(c[1])])
        return [r[1], r[0]]
      })
      f.geometry.coordinates = f.geometry.type === 'Polygon'
        ? f.geometry.coordinates.map(convert)
        : f.geometry.coordinates.map(p => p.map(convert))
      return f
    })

    await nextTick();
    if (!isUnmounted.value) {
      emit('update-afdelings', Object.keys(afdMap).sort().map(n => ({ name: n, count: afdMap[n] })))
      geoJsonData.value = data
      emit('ready', data)
    }
  } catch (e) { if (!isUnmounted.value) console.error("Map Init Error:", e) }
})

onUnmounted(() => { 
  isUnmounted.value = true
  if (fetchTimeout) clearTimeout(fetchTimeout)
  polygonRefs.value = {} // Clear refs
})
</script>

<style>
.label-blok-map {
  background: transparent !important;
  border: none !important;
  box-shadow: none !important;
  color: rgba(255, 255, 255, 0.9) !important;
  font-weight: 800 !important;
  font-size: 10px !important;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
  pointer-events: none;
}
</style>