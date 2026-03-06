<template>
  <LLayerGroup :key="`layer-group-wl-${filterKey}`">
    <LMarker
      v-for="(item, index) in finalFeatures"
      :key="getMarkerKey(item, index)"
      :lat-lng="item.latLng"
      :icon="createIcon(item.status)"
    >
      <LTooltip :options="{ permanent: false, direction: 'top', offset: [0, -6], className: 'label-water-tooltip' }">
        <div class="text-xs font-bold uppercase">{{ item.nomor }}</div>
      </LTooltip>

      <LPopup :options="{ offset: [0, -6], maxWidth: 300, minWidth: 220 }">
        <div class="font-sans text-slate-900">
          
          <div class="flex justify-between items-start border-b border-slate-100 pb-2 mb-2 mt-6">
            <div>
              <h3 class="font-black text-sm uppercase leading-tight text-slate-700">
                {{ item.nomor }}
              </h3>
              <span class="text-[10px] text-slate-400 font-bold uppercase tracking-tighter">
                {{ item.groupDas }} | Blok {{ item.blok }}
              </span>
            </div>
            
            <div 
              class="px-2 py-0.5 rounded text-[9px] font-black uppercase text-white shadow-sm whitespace-nowrap"
              style="background-color: #1e40af;"
            >
              {{ item.status }}
            </div>
          </div>
          
          <div v-if="isLoading && !item.tanggal_raw" class="py-4 text-center">
             <div class="inline-block w-4 h-4 border-2 border-blue-500 border-t-transparent rounded-full animate-spin"></div>
          </div>

          <div v-else>
            <div v-if="item.foto_path" class="mb-2 rounded-lg overflow-hidden border border-slate-200 shadow-sm relative bg-slate-100">
               <img 
                 :src="`https://api.palmwateros-tap.com/storage/${item.foto_path}`" 
                 alt="Kondisi Air" 
                 class="w-full h-36 object-cover"
                 @error="item.foto_path = null"
               />
            </div>

            <div 
              class="p-2 rounded-lg mb-2 shadow-sm border"
              :class="item.tanggal_raw ? 'bg-cyan-50 border-cyan-100' : 'bg-slate-50 border-slate-100'"
            >
               <div class="flex justify-between items-center">
                  <span class="text-[10px] font-bold uppercase" :class="item.tanggal_raw ? 'text-cyan-600' : 'text-slate-400'">
                    Laporan Terakhir:
                  </span>
               </div>
               <p class="text-xs font-mono font-bold mt-0.5 ml-1" :class="item.tanggal_raw ? 'text-cyan-800' : 'text-slate-500'">
                  {{ item.tanggal }}
               </p>
            </div>
          </div>

          <div class="grid grid-cols-2 gap-2">
            <div class="bg-slate-50 p-1.5 rounded border border-slate-100">
              <p class="text-[8px] text-slate-400 uppercase font-bold tracking-tight">Afdeling</p>
              <p class="text-[10px] font-bold text-slate-700 uppercase">{{ item.afdeling }}</p>
            </div>
            <div class="bg-slate-50 p-1.5 rounded border border-slate-100">
              <p class="text-[8px] text-slate-400 uppercase font-bold tracking-tight">ID Objek</p>
              <p class="text-[10px] font-bold text-slate-700 font-mono">{{ item.id }}</p>
            </div>
          </div>

        </div>
      </LPopup>
    </LMarker>
  </LLayerGroup>
</template>

<script setup>
import { computed, onMounted, onUnmounted, ref, watch, nextTick } from 'vue'
import { LLayerGroup, LMarker, LPopup, LTooltip } from '@vue-leaflet/vue-leaflet'
import L from 'leaflet' 
import proj4 from 'proj4'

proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

const props = defineProps({ 
  geoJson: { type: Object, default: () => ({ features: [] }) },
  filterAfd: { type: Array, default: () => ['All'] },
  selectedMonth: { type: [Number, Object, String], default: null },
  selectedYear: { type: [Number, Object, String], default: null },
  selectedBlock: { type: String, default: null } // Untuk isolasi blok
})

const waterStatusMap = ref({}) 
const isLoading = ref(false)
const isUnmounted = ref(false) // GUARD 1: State Component Hidup/Mati
let pollingInterval = null

// Key re-render
const filterKey = computed(() => {
  return `${props.selectedMonth}-${props.selectedYear}-${props.selectedBlock || 'all'}`
})

const getMarkerKey = (item, index) => {
  return `wl-${item.nomor}-${item.status}-${props.selectedMonth}-${index}`
}

const fetchWaterStatus = async () => {
  if (isUnmounted.value) return; // GUARD 2: Jangan fetch jika unmounted

  try {
    isLoading.value = true
    const m = props.selectedMonth || ''
    const y = props.selectedYear || ''
    
    const response = await fetch(`https://api.palmwateros-tap.com/api/gis/cek-water-level?month=${m}&year=${y}`)
    
    if (isUnmounted.value) return; // GUARD 3: Cek lagi setelah await

    if (!response.ok) throw new Error(`API Error: ${response.status}`)
    const result = await response.json()
    const items = result.data || [] 

    const mapping = {}
    if (Array.isArray(items)) {
        items.forEach(item => {
            if (item.no_water_level) {
              const key = String(item.no_water_level).trim()
              mapping[key] = {
                  status: item.status, 
                  tanggal: item.tanggal,
                  foto_path: item.foto_path
              }
            }
        })
    }

    // GUARD 4: Tunggu DOM update, baru assign data
    await nextTick()
    if (!isUnmounted.value) {
        waterStatusMap.value = mapping
    }

  } catch (e) {
    if (!isUnmounted.value) console.error("Gagal mengambil data water level:", e)
  } finally {
    if (!isUnmounted.value) isLoading.value = false
  }
}

watch(() => [props.selectedMonth, props.selectedYear], () => {
    fetchWaterStatus()
}, { immediate: true })

onMounted(() => {
    pollingInterval = setInterval(fetchWaterStatus, 60000)
})

onUnmounted(() => {
    isUnmounted.value = true // Aktifkan rem darurat
    if (pollingInterval) clearInterval(pollingInterval)
})

const formatDateIndo = (dateStr) => {
    if (!dateStr || dateStr === '-') return 'Belum Dilaporkan'
    const date = new Date(dateStr)
    if (isNaN(date.getTime())) return dateStr
    return new Intl.DateTimeFormat('id-ID', {
        day: '2-digit', month: 'short', year: 'numeric'
    }).format(date)
}

const createIcon = (status) => {
  return L.divIcon({
    className: '', 
    html: `
      <div class="relative flex items-center justify-center">
        <div class="absolute w-5 h-5 rounded-full animate-ping opacity-20" style="background-color: #1e40af;"></div>
        <div 
          class="w-3.5 h-3.5 rounded-full border-2 border-white shadow-lg transition-all duration-300 hover:scale-150" 
          style="background-color:#1e40af;"
        ></div>
      </div>
    `,
    iconSize: [14, 14], iconAnchor: [7, 7], popupAnchor: [0, -7]  
  })
}

const finalFeatures = computed(() => {
  if (!props.geoJson || !props.geoJson.features) return []

  const cleanFilterAfd = props.filterAfd.map(a => a.toString().trim().toUpperCase())
  const isAllAfd = cleanFilterAfd.includes('ALL')
  const activeBlock = props.selectedBlock ? props.selectedBlock.toString().trim().toUpperCase() : null

  // 1. FILTERING: Isolasi Blok atau Afdeling
  const filteredGeo = props.geoJson.features.filter(f => {
    const featureBlock = (f.properties.Blok || '').toString().trim().toUpperCase()
    const featureAfd = (f.properties.Afdeling || '').toString().trim().toUpperCase()

    // Jika isolasi blok aktif (PRIORITAS UTAMA)
    if (activeBlock) {
      return featureBlock === activeBlock
    }

    // Default filter afdeling (Hanya jika tidak isolasi blok)
    return isAllAfd || cleanFilterAfd.includes(featureAfd)
  })

  // 2. MAPPING: Gabungkan data GeoJSON dengan data API
  return filteredGeo.map(f => {
    const propsRaw = f.properties
    const rawCoords = f.geometry.coordinates
    const nomorKey = String(propsRaw.Nomor).trim() 
    
    // Lookup ke hasil API (Default: Tidak Ada Laporan)
    const apiData = waterStatusMap.value[nomorKey] || { 
      status: 'Tidak Ada Laporan', 
      tanggal: null, 
      foto_path: null 
    }

    let finalLatLng = [0, 0]
    // Proj4 conversion
    if (rawCoords[0] > 180 || rawCoords[1] > 180) {
       const r = proj4('EPSG:32650', 'EPSG:4326', [parseFloat(rawCoords[0]), parseFloat(rawCoords[1])])
       finalLatLng = [r[1], r[0]] 
    } else {
       finalLatLng = [rawCoords[1], rawCoords[0]] 
    }

    return {
      id: propsRaw.OBJECTID,
      nomor: propsRaw.Nomor,
      afdeling: propsRaw.Afdeling || '-',
      groupDas: propsRaw.Group_DAS || '-',
      blok: propsRaw.Blok || '-',
      latLng: finalLatLng,
      status: apiData.status,
      tanggal_raw: apiData.tanggal, 
      tanggal: formatDateIndo(apiData.tanggal),
      foto_path: apiData.foto_path
    }
  })
})
</script>

<style>
.label-water-tooltip {
  background: rgba(15, 23, 42, 0.9) !important; 
  border: none !important;
  color: white !important;
  font-weight: 800;
  font-size: 9px;
  padding: 2px 6px;
  border-radius: 4px;
  box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1);
}
</style>