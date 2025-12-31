<template>
  <LLayerGroup>
    <LMarker
      v-for="(feature, index) in featuresToDisplay"
      :key="`${feature.properties.OBJECTID}-${index}`"
      :lat-lng="feature.geometry.coordinates"
      :icon="createMarkerIcon(feature)"
    >
      <LTooltip :options="{ permanent: false, direction: 'top', offset: [0, -6], className: 'label-infra-tooltip' }">
        <div class="text-xs font-bold uppercase">{{ feature.properties.KATEGORY }}</div>
      </LTooltip>

      <LPopup :options="{ maxWidth: 300, minWidth: 250 }">
        <div class="font-sans text-slate-800">
          
          <div class="flex justify-between items-start mt-8 border-b border-slate-200 pb-3 mb-3">
            <div>
              <h3 class="font-black text-sm uppercase leading-tight text-slate-800 tracking-wide">
                {{ feature.properties.KATEGORY }}
              </h3>
              <div class="flex flex-col mt-1">
                <span class="text-[10px] text-slate-500 font-bold uppercase tracking-wider">
                  ID: <span class="text-slate-700">{{ feature.properties.OBJECTID }}</span>
                </span>
                <span class="text-[10px] text-slate-500 font-bold uppercase tracking-wider">
                  Blok: <span class="text-slate-700">{{ feature.properties.BLOCK_NAME }}</span>
                </span>
                <span class="text-[10px] text-slate-500 font-bold uppercase tracking-wider">
                  Skor: <span class="text-slate-700">{{ (getCurrentData(feature).skor) }}</span>
                </span>
              </div>
            </div>
            
            <div 
              class="px-2.5 py-1 rounded-md text-[10px] font-black uppercase text-white shadow-sm tracking-wide text-center max-w-[100px]"
              :style="{ backgroundColor: getStatusColor(getCurrentData(feature).status) }"
            >
              {{ getCurrentData(feature).status || 'Unknown' }}
            </div>
          </div>
          
          <div v-if="getCurrentData(feature).foto_path" class="mb-3 rounded-lg overflow-hidden border border-slate-200 shadow-sm relative bg-slate-100">
             <img 
:src="`https://api.palmwateros-tap.com/storage/${getCurrentData(feature).foto_path}`"
               alt="Foto Kondisi" 
               class="w-full h-36 object-cover"
               @error="$event.target.style.display='none'"
             />
          </div>
          <div class="grid grid-cols-2 gap-2">

          <div class="bg-blue-50 border border-blue-100 p-2.5 rounded-lg mb-3 shadow-sm">
             <div class="flex items-center gap-1.5 mb-1">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-3.5 h-3.5 text-blue-500">
                  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm.75-13a.75.75 0 00-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 000-1.5h-3.25V5z" clip-rule="evenodd" />
                </svg>
                <span class="text-[10px] font-bold text-blue-600 uppercase tracking-wide">Terakhir Dicek</span>
             </div>
             <p class="text-xs font-mono font-bold text-blue-900 ml-5">
                {{ formatDate(getCurrentData(feature).tanggal) }}
             </p>
          </div>
          
           
            <div class="bg-slate-50 p-2 rounded border border-slate-100">
              <p class="text-[9px] text-slate-400 uppercase font-bold mb-0.5">Tahun Pemasangan</p>
              <p class="text-xs font-bold text-slate-700">{{ feature.properties.YOP || '-' }}</p>
            </div>
          </div>

        </div>
      </LPopup>
    </LMarker>
  </LLayerGroup>
</template>

<script setup>
import { computed, onMounted, ref } from 'vue'
import { LLayerGroup, LMarker, LPopup, LTooltip } from '@vue-leaflet/vue-leaflet'
import L from 'leaflet' 
import proj4 from 'proj4'

const props = defineProps({ 
  geoJson: { type: Object, default: null },
  filterAfd: { type: Array, default: () => ['All'] },
  activeCategories: { type: Array, default: () => [] }
})

const infraStatusMap = ref({}) 

onMounted(() => {
    fetchInfraStatus()
})

const formatDate = (dateString) => {
  if (!dateString || dateString === '-' || dateString === null) return '-'
  const date = new Date(dateString)
  if (isNaN(date.getTime())) return dateString 
  
  // EDIT: Menghapus hour dan minute agar hanya tampil tanggal
  return new Intl.DateTimeFormat('id-ID', {
    day: 'numeric', month: 'short', year: 'numeric'
  }).format(date)
}

const fetchInfraStatus = async () => {
  try {
    const response = await fetch('https://api.palmwateros-tap.com/api/gis/cek-infra') 
    const result = await response.json()
    const mapping = {}
    const items = result.data || result 
    if (Array.isArray(items)) {
        items.forEach(item => {
            if (item.id_objek) {
                // EDIT: Mapping foto_path dari API
                mapping[String(item.id_objek)] = { 
                  status: item.status, 
                  tanggal: item.tanggal,
                  skor: item.skor,
                  foto_path: item.foto_path // Pastikan key dari API sesuai
                }
            }
        })
    }
    infraStatusMap.value = mapping
  } catch (e) {
    console.error("Gagal fetch infra status:", e)
  }
}

const getCurrentData = (feature) => {
    if (!feature?.properties?.OBJECTID) return { status: 'Unknown', tanggal: '-', foto_path: null }
    const id = String(feature.properties.OBJECTID)
    const apiData = infraStatusMap.value[id]
    
    // EDIT: Return foto_path juga
    if (apiData) return { 
      status: apiData.status, 
      tanggal: apiData.tanggal, 
      foto_path: apiData.foto_path,
      skor: apiData.skor
    }
    return { status: 'Belum Ada Laporan', tanggal: '-', foto_path: null }
}

proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

const featuresToDisplay = computed(() => {
  if (!props.geoJson || !props.geoJson.features) return []
  const filtered = props.geoJson.features.filter(f => {
    const matchAfd = props.filterAfd.includes('All') || props.filterAfd.includes(f.properties.AFD_NAME)
    const matchCat = props.activeCategories.includes(f.properties.KATEGORY)
    return matchAfd && matchCat
  })
  return filtered.map(f => {
    const feature = { ...f, geometry: { ...f.geometry, coordinates: [...f.geometry.coordinates] } }
    const coords = feature.geometry.coordinates
    if (coords[0] > 180 || coords[1] > 180) {
       const r = proj4('EPSG:32650', 'EPSG:4326', [parseFloat(coords[0]), parseFloat(coords[1])])
       feature.geometry.coordinates = [r[1], r[0]] 
    }
    return feature
  })
})

const getCategoryColor = (kategori) => {
  const cat = kategori?.toString().toUpperCase() || ''
  if (cat.includes('JEMBATAN KAYU')) return '#59281E' 
  if (cat.includes('PVC')) return '#06b6d4' 
  if (cat.includes('NF')) return '#64748b' 
  return '#64748b' 
}

const getStatusColor = (kondisi) => {
  const status = kondisi?.toString().trim().toLowerCase() || ''
  if (status.includes('1')|| status === 'baik') return '#22c55e'
  if (status.includes('2') || status === 'perawatan') return '#f97316'
  if (status.includes('3') || status === 'rusak' || status === 'rusak berat') return '#ef4444'
  return '#94a3b8' 
}

const createMarkerIcon = (feature) => {
  const category = feature.properties.KATEGORY
  const color = getCategoryColor(category)

  const html = `
    <div 
      class="w-3 h-3 rounded-full border border-white shadow-sm hover:scale-125 transition-transform" 
      style="background-color: ${color};"
    ></div>
  `
  return L.divIcon({
    className: '', 
    html: html,
    iconSize: [12, 12],   
    iconAnchor: [6, 6],   
    popupAnchor: [0, -6]  
  })
}
</script>

<style>
/* Style Popup & Tooltip */
.leaflet-popup-content-wrapper {
  border-radius: 12px;
  padding: 0;
  overflow: hidden;
  box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
}
.leaflet-popup-content {
  margin: 16px !important;
  line-height: 1.4;
}
.leaflet-popup-tip {
  background: white;
}
.leaflet-container a.leaflet-popup-close-button {
  top: 8px; right: 8px; color: #94a3b8; font-size: 18px;
  width: 24px; height: 24px; display: flex; align-items: center; justify-content: center;
  border-radius: 50%;
  background: rgba(255,255,255,0.8); /* Sedikit background supaya terlihat jika ada foto */
  z-index: 10;
}
.leaflet-container a.leaflet-popup-close-button:hover {
  background-color: #f1f5f9; color: #475569;
}
.label-infra-tooltip {
  background: rgba(0, 0, 0, 0.8) !important;
  border: none !important;
  color: white !important;
  border-radius: 4px;
}
</style>