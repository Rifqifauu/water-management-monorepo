<template>
  <LLayerGroup>
    <LMarker
      v-for="(item, index) in finalFeatures"
      :key="`${item.id}-${index}`"
      :lat-lng="item.latLng"
      :icon="createIcon()"
    >
      <LTooltip :options="{ permanent: false, direction: 'top', offset: [0, -6], className: 'label-water-tooltip' }">
        <div class="text-xs font-bold uppercase">{{ item.nomor }}</div>
      </LTooltip>

      <LPopup :options="{ offset: [0, -6], maxWidth: 300, minWidth: 220 }">
        <div class="font-sans text-slate-900">
          
          <div class="flex justify-between items-start border-b border-slate-100 pb-2 mb-2">
            <div>
              <h3 class="font-black text-sm uppercase leading-tight text-slate-700">
                {{ item.nomor }}
              </h3>
              <span class="text-[10px] text-slate-400 font-bold uppercase">
                {{ item.groupDas }} | Blok {{ item.blok }}
              </span>
            </div>
            
            <div 
              class="px-2 py-0.5 rounded text-[9px] font-black uppercase text-white shadow-sm"
              :style="{ backgroundColor: getStatusColor(item.status) }"
            >
              {{ item.status || 'Unknown' }}
            </div>
          </div>
          
          <div v-if="item.foto_path" class="mb-2 rounded-lg overflow-hidden border border-slate-200 shadow-sm relative bg-slate-100">
             <img 
               :src="`https://api.palmwateros-tap.com/storage/${item.foto_path}`" 
               alt="Kondisi Air" 
               class="w-full h-36 object-cover"
               @error="$event.target.style.display='none'"
             />
          </div>

          <div class="bg-cyan-50 border border-cyan-100 p-2 rounded-lg mb-2">
             <div class="flex justify-between items-center">
                <span class="text-[9px] font-bold text-cyan-600 uppercase">Terakhir Dilaporkan</span>
             </div>
             <p class="text-xs font-mono font-bold text-cyan-800 mt-0.5">
                {{ item.tanggal }}
             </p>
          </div>

          <div class="grid grid-cols-2 gap-2">
            <div class="bg-slate-50 p-1.5 rounded border border-slate-100">
              <p class="text-[8px] text-slate-400 uppercase font-bold">Afdeling</p>
              <p class="text-[11px] font-bold text-slate-700">{{ item.afdeling }}</p>
            </div>
            <div class="bg-slate-50 p-1.5 rounded border border-slate-100">
              <p class="text-[8px] text-slate-400 uppercase font-bold">Object ID</p>
              <p class="text-[11px] font-bold text-slate-700">{{ item.id }}</p>
            </div>
          </div>

        </div>
      </LPopup>
    </LMarker>
  </LLayerGroup>
</template>

<script setup>
import { computed, onMounted, onUnmounted, ref } from 'vue'
import { LLayerGroup, LMarker, LPopup, LTooltip } from '@vue-leaflet/vue-leaflet'
import L from 'leaflet' 
import proj4 from 'proj4'

proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

const props = defineProps({ 
  geoJson: { type: Object, default: () => ({ features: [] }) },
  filterAfd: { type: Array, default: () => ['All'] }
})

const waterStatusMap = ref({}) 
const isLoading = ref(true)
let pollingInterval = null

onMounted(() => {
    fetchWaterStatus()
    pollingInterval = setInterval(fetchWaterStatus, 60000)
})

onUnmounted(() => {
    if (pollingInterval) clearInterval(pollingInterval)
})

const fetchWaterStatus = async () => {
  try {
    isLoading.value = true
    const response = await fetch('https://api.palmwateros-tap.com/api/gis/cek-water-level')
    if (!response.ok) throw new Error(`API Error: ${response.status}`)
    const result = await response.json()
    const items = result.data || result 

    const mapping = {}
    if (Array.isArray(items)) {
        items.forEach(item => {
            const key = String(item.no_water_level).trim()
            mapping[key] = {
                status: item.status, 
                tanggal: item.tanggal,
                foto_path: item.foto_path // Ambil foto_path dari API
            }
        })
    }
    waterStatusMap.value = mapping
  } catch (e) {
    console.error("Gagal mengambil data water level:", e)
  } finally {
    isLoading.value = false
  }
}

const formatDateIndo = (dateStr) => {
    if (!dateStr) return '-'
    const date = new Date(dateStr)
    if (isNaN(date.getTime())) return '-'
    
    // Hapus opsi hour & minute agar hanya tanggal
    return new Intl.DateTimeFormat('id-ID', {
        day: '2-digit', month: 'short', year: 'numeric'
    }).format(date)
}

const getStatusColor = (statusRaw) => {
  const status = statusRaw?.toString().trim().toLowerCase() || 'unknown'
  if (status === 'good condition') return '#10b981' 
  if (status === 'need maintenance') return '#f59e0b' 
  if (status === 'urgent condition') return '#ef4444' 
  return '#64748b' 
}

const createIcon = () => {
  return L.divIcon({
    className: '', 
    html: `
      <div 
        class="w-3 h-3 rounded-full border border-white shadow-sm hover:scale-125 transition-transform" 
        style="background-color: #1e40af;" 
      ></div>
    `,
    iconSize: [12, 12],   
    iconAnchor: [6, 6],   
    popupAnchor: [0, -6]  
  })
}

const finalFeatures = computed(() => {
  if (!props.geoJson || !props.geoJson.features) return []

  const filteredGeo = props.geoJson.features.filter(f => {
    return props.filterAfd.includes('All') || props.filterAfd.includes(f.properties.Afdeling)
  })

  return filteredGeo.map(f => {
    const propsRaw = f.properties
    const rawCoords = f.geometry.coordinates
    const nomorKey = String(propsRaw.Nomor).trim() 
    
    // Default object jika data API belum ada
    const apiData = waterStatusMap.value[nomorKey] || { status: 'Unknown', tanggal: null, foto_path: null }

    let finalLatLng = [0, 0]
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
      groupDas: propsRaw.Group_DAS,
      blok: propsRaw.Blok,
      latLng: finalLatLng,
      status: apiData.status,
      tanggal: formatDateIndo(apiData.tanggal),
      foto_path: apiData.foto_path // Teruskan foto ke template
    }
  })
})
</script>

<style>
.label-water-tooltip {
  background: rgba(15, 23, 42, 0.95) !important; 
  border: 1px solid rgba(255,255,255,0.1) !important;
  color: white !important;
  font-weight: 800;
  font-size: 10px;
  padding: 2px 8px;
  border-radius: 4px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.3);
  z-index: 1000;
}
.label-water-tooltip::before {
  border-top-color: rgba(15, 23, 42, 0.95) !important;
}
</style>