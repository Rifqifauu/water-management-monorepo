<template>
  <LLayerGroup :key="`layer-group-wl-${finalFeatures.length}-${props.selectedMonth}`">
    <LMarker
      v-for="(item, index) in finalFeatures"
      :key="getMarkerKey(item, index)"
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
          
          <div v-if="isLoading && !item.tanggal" class="py-4 text-center">
             <div class="inline-block w-4 h-4 border-2 border-blue-500 border-t-transparent rounded-full animate-spin"></div>
          </div>

          <div v-else>
            <div v-if="item.foto_path" class="mb-2 rounded-lg overflow-hidden border border-slate-200 shadow-sm relative bg-slate-100">
               <img 
                 :src="`https://api.palmwateros-tap.com/storage/${item.foto_path}`" 
                 alt="Kondisi Air" 
                 class="w-full h-36 object-cover"
                 @error="$event.target.style.display='none'"
               />
            </div>

            <div class="bg-cyan-50 border border-cyan-100 p-2 rounded-lg mb-2 shadow-sm">
               <div class="flex justify-between items-center">
                  <span class="text-[10px] font-bold text-cyan-600 uppercase">Laporan Terakhir:</span>
               </div>
               <p class="text-xs font-mono font-bold text-cyan-800 mt-0.5 ml-1">
                  {{ item.tanggal }}
               </p>
            </div>
          </div>

          <div class="grid grid-cols-2 gap-2">
            <div class="bg-slate-50 p-1.5 rounded border border-slate-100">
              <p class="text-[8px] text-slate-400 uppercase font-bold">Afdeling</p>
              <p class="text-[11px] font-bold text-slate-700">{{ item.afdeling }}</p>
            </div>
            <div class="bg-slate-50 p-1.5 rounded border border-slate-100">
              <p class="text-[8px] text-slate-400 uppercase font-bold">ID Objek</p>
              <p class="text-[11px] font-bold text-slate-700">{{ item.id }}</p>
            </div>
          </div>

        </div>
      </LPopup>
    </LMarker>
  </LLayerGroup>
</template>

<script setup>
import { computed, onMounted, onUnmounted, ref, watch } from 'vue'
import { LLayerGroup, LMarker, LPopup, LTooltip } from '@vue-leaflet/vue-leaflet'
import L from 'leaflet' 
import proj4 from 'proj4'

proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

const props = defineProps({ 
  geoJson: { type: Object, default: () => ({ features: [] }) },
  filterAfd: { type: Array, default: () => ['All'] },
  selectedMonth: { type: [Number, Object], default: null },
  selectedYear: { type: [Number, Object], default: null }
})

const waterStatusMap = ref({}) 
const isLoading = ref(false)
let pollingInterval = null

// Key unik agar marker merender ulang data Popup saat periode berubah
const getMarkerKey = (item, index) => {
  return `wl-${item.nomor}-${item.status}-${props.selectedMonth}-${props.selectedYear}-${index}`
}

const fetchWaterStatus = async () => {
  try {
    isLoading.value = true
    // Normalisasi parameter untuk API
    const m = props.selectedMonth || ''
    const y = props.selectedYear || ''
    
    const response = await fetch(`https://api.palmwateros-tap.com/api/gis/cek-water-level?month=${m}&year=${y}`)
    if (!response.ok) throw new Error(`API Error: ${response.status}`)
    const result = await response.json()
    const items = result.data || [] 

    const mapping = {}
    if (Array.isArray(items)) {
        items.forEach(item => {
            if (item.no_water_level) {
              // NORMALISASI: Trim agar matching ID di finalFeatures akurat
              const key = String(item.no_water_level).trim()
              mapping[key] = {
                  status: item.status, 
                  tanggal: item.tanggal,
                  foto_path: item.foto_path
              }
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

// Watcher untuk update data otomatis saat periode diubah
watch(() => [props.selectedMonth, props.selectedYear], () => {
    fetchWaterStatus()
}, { immediate: true })

// Polling update setiap 1 menit
onMounted(() => {
    pollingInterval = setInterval(fetchWaterStatus, 60000)
})

onUnmounted(() => {
    if (pollingInterval) clearInterval(pollingInterval)
})

const formatDateIndo = (dateStr) => {
    if (!dateStr || dateStr === '-') return '-'
    const date = new Date(dateStr)
    if (isNaN(date.getTime())) return dateStr
    return new Intl.DateTimeFormat('id-ID', {
        day: '2-digit', month: 'short', year: 'numeric'
    }).format(date)
}

const getStatusColor = (statusRaw) => {
  const status = statusRaw?.toString().trim().toLowerCase() || 'unknown'
  if (status.includes('good') || status === 'aman' || status === 'baik' || status === 'normal') return '#10b981' 
  if (status.includes('maintenance') || status === 'sedang' || status === 'perawatan') return '#f59e0b' 
  if (status.includes('urgent') || status === 'kritis' || status === 'rusak') return '#ef4444' 
  return '#64748b' 
}

const createIcon = () => {
  return L.divIcon({
    className: '', 
    html: `
      <div 
        class="w-3.5 h-3.5 rounded-full border-2 border-white shadow-md hover:scale-125 transition-transform" 
        style="background-color: #1e40af;" 
      ></div>
    `,
    iconSize: [14, 14],   
    iconAnchor: [7, 7],   
    popupAnchor: [0, -7]  
  })
}

const finalFeatures = computed(() => {
  if (!props.geoJson || !props.geoJson.features) return []

  const cleanFilterAfd = props.filterAfd.map(a => a.toString().trim().toUpperCase())
  const isAllAfd = cleanFilterAfd.includes('ALL')

  // Filtering titik berdasarkan Afdeling dan Periode
  const filteredGeo = props.geoJson.features.filter(f => {
    const dataAfd = (f.properties.Afdeling || '').toString().trim().toUpperCase()
    const matchAfd = isAllAfd || cleanFilterAfd.includes(dataAfd)
    
    if (!matchAfd) return false

    // Jika filter bulan dipilih, hanya tampilkan yang ada datanya di API bulan itu
    if (props.selectedMonth && props.selectedYear) {
      const nomorKey = String(f.properties.Nomor).trim()
      return waterStatusMap.value.hasOwnProperty(nomorKey)
    }

    return true
  })

  return filteredGeo.map(f => {
    const propsRaw = f.properties
    const rawCoords = f.geometry.coordinates
    const nomorKey = String(propsRaw.Nomor).trim() 
    
    // Ambil data dari API Map hasil fetch
    const apiData = waterStatusMap.value[nomorKey] || { status: 'Tidak Ada Laporan', tanggal: null, foto_path: null }

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
      groupDas: propsRaw.Group_DAS || '-',
      blok: propsRaw.Blok || '-',
      latLng: finalLatLng,
      status: apiData.status,
      tanggal: formatDateIndo(apiData.tanggal),
      foto_path: apiData.foto_path
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
}
</style>