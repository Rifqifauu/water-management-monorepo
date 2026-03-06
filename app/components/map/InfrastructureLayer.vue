<template>
  <LLayerGroup :key="`layer-group-infra-${featuresToDisplay.length}-${filterKey}`">
    <LMarker
      v-for="feature in featuresToDisplay"
      :key="getMarkerKey(feature)"
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
                  Skor: <span class="text-slate-700 font-mono font-bold">{{ getCurrentData(feature).skor }}</span>
                </span>
                <span class="text-[10px] text-slate-500 font-bold uppercase tracking-wider">
                  Tindakan: <span class="text-slate-700">{{ getCurrentData(feature).tindakan }}</span>
                </span>
              </div>
            </div>
            
            <div 
              class="px-2.5 py-1 rounded-md text-[10px] font-black uppercase text-white shadow-sm tracking-wide text-center max-w-[100px]"
              :style="{ backgroundColor: getStatusColor(getCurrentData(feature).status) }"
            >
              {{ getCurrentData(feature).status }}
            </div>
          </div>
          
  <div v-if="getCurrentData(feature).foto_path || getCurrentData(feature).foto_after" class="mb-3 overflow-hidden">
  <div class="grid gap-2" :class="getCurrentData(feature).foto_after ? 'grid-cols-2' : 'grid-cols-1'">
    
    <div v-if="getCurrentData(feature).foto_path" class="relative group">
      <div class="absolute top-0 left-0 bg-black/60 text-[8px] text-white px-1.5 py-0.5 rounded-br-md z-10 font-bold uppercase tracking-tighter">Sebelum</div>
      <div class="rounded-lg overflow-hidden border border-slate-200 shadow-sm bg-slate-100 h-36">
        <img 
          :src="`https://api.palmwateros-tap.com/storage/${getCurrentData(feature).foto_path}`"
          alt="Foto Sebelum" 
          class="w-full h-full object-cover"
          @error="$event.target.closest('.relative').style.display='none'"
        />
      </div>
    </div>

    <div v-if="getCurrentData(feature).foto_after" class="relative group">
      <div class="absolute top-0 left-0 bg-green-600 text-[8px] text-white px-1.5 py-0.5 rounded-br-md z-10 font-bold uppercase tracking-tighter">Sesudah</div>
      <div class="rounded-lg overflow-hidden border border-green-200 shadow-sm bg-slate-100 h-36">
        <img 
          :src="`https://api.palmwateros-tap.com/storage/${getCurrentData(feature).foto_after}`"
          alt="Foto Sesudah" 
          class="w-full h-full object-cover"
          @error="$event.target.closest('.relative').style.display='none'"
        />
      </div>
    </div>

  </div>
</div>

          <div class="grid grid-cols-2 gap-2">
            <div class="bg-blue-50 border border-blue-100 p-2.5 rounded-lg mb-3 shadow-sm">
               <div class="flex items-center gap-1.5 mb-1">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-3.5 h-3.5 text-blue-500">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm.75-13a.75.75 0 00-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 000-1.5h-3.25V5z" clip-rule="evenodd" />
                  </svg>
                  <span class="text-[10px] font-bold text-blue-600 uppercase tracking-wide">Pengamatan Terakhir</span>
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
import { computed, ref, watch, onUnmounted, nextTick } from 'vue'
import { LLayerGroup, LMarker, LPopup, LTooltip } from '@vue-leaflet/vue-leaflet'
import L from 'leaflet' 
import proj4 from 'proj4'

const props = defineProps({ 
  geoJson: { type: Object, default: null },
  filterAfd: { type: Array, default: () => ['All'] },
  activeCategories: { type: Array, default: () => [] },
  selectedMonth: { type: [Number, Object], default: null },
  selectedYear: { type: [Number, Object], default: null },
  selectedBlock: { type: String, default: null } 
})

const infraStatusMap = ref({}) 
const isLoading = ref(false)
const isUnmounted = ref(false) 

proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

const getCurrentData = (feature) => {
  const rawId = feature.properties.OBJECTID
  if (!rawId) return { status: 'Unknown', tanggal: '-', foto_path: null, skor: '0.00', tindakan: '-' }
  const id = String(rawId).trim()
  const apiData = infraStatusMap.value[id]
  if (apiData) return apiData
  return { 
    status: props.selectedMonth ? 'Tidak Ada Laporan' : 'Belum Ada Data', 
    tanggal: '-', 
    tindakan: '-',
    foto_path: null, 
    skor: '0.00' 
  }
}

const getMarkerKey = (feature) => {
  const objId = feature.properties.OBJECTID
  const data = getCurrentData(feature)
  return `marker-${objId}-${data.status}-${props.selectedMonth}-${props.selectedYear}`
}

const fetchInfraStatus = async () => {
  if (isUnmounted.value) return; 
  isLoading.value = true
  
  try {
    const m = props.selectedMonth || ''
    const y = props.selectedYear || ''
    
    const response = await fetch(`https://api.palmwateros-tap.com/api/gis/cek-infra?month=${m}&year=${y}`) 
    if (isUnmounted.value) return; 

    const result = await response.json()
    const mapping = {}
    const items = result.data || [] 
    
    if (Array.isArray(items)) {
      items.forEach(item => {
        if (item.id_objek) {
          const key = String(item.id_objek).trim()
          mapping[key] = { 
            status: item.status, 
            tanggal: item.tanggal,
            skor: item.skor,
            foto_path: item.foto_path,
            foto_after: item.foto_after,
            tindakan: item.tindakan 
          }
        }
      })
    }
    
    await nextTick();
    if (!isUnmounted.value) {
        infraStatusMap.value = mapping
    }
  } catch (e) {
    if(!isUnmounted.value) console.error("Gagal fetch infra status:", e)
  } finally {
    if(!isUnmounted.value) isLoading.value = false
  }
}

watch(
  () => [props.selectedMonth, props.selectedYear], 
  () => { fetchInfraStatus() }, 
  { immediate: true }
)

// --- HELPERS ---
const formatDate = (dateString) => {
  if (!dateString || dateString === '-' || dateString === null) return '-'
  const parts = dateString.split('-')
  if (parts.length === 3) {
    const day = parseInt(parts[0], 10)
    const month = parseInt(parts[1], 10) - 1 
    const year = parseInt(parts[2], 10)
    const date = new Date(year, month, day)
    if (!isNaN(date.getTime())) {
      return new Intl.DateTimeFormat('id-ID', { day: 'numeric', month: 'short', year: 'numeric' }).format(date)
    }
  }
  return dateString
}

const getStatusColor = (kondisi) => {
  const status = kondisi?.toString().trim().toLowerCase() || ''
  if (status.includes('baik') || status.includes('1')) return '#22c55e'
  if (status.includes('perawatan') || status.includes('2')) return '#f97316'
  if (status.includes('rusak') || status.includes('3')) return '#ef4444'
  return '#94a3b8' // Abu-abu untuk 'Tidak Ada Laporan'
}

const createMarkerIcon = (feature) => {
  const cat = (feature.properties.KATEGORY || '').toString().toUpperCase()
  let color = '#64748b'
  if (cat.includes('JEMBATAN KAYU')) color = '#59281E' 
  else if (cat.includes('PVC')) color = '#06b6d4' 
  else if (cat.includes('NF')) color = '#64748b' 

  const html = `<div class="w-3 h-3 rounded-full border border-white shadow-sm hover:scale-125 transition-transform" style="background-color: ${color};"></div>`
  return L.divIcon({ className: '', html: html, iconSize: [12, 12], iconAnchor: [6, 6], popupAnchor: [0, -6] })
}

const filterKey = computed(() => {
    return `${props.filterAfd.join('-')}-${props.activeCategories.join('-')}-${props.selectedBlock || 'all'}`
})

// --- FILTERING LOGIC (SUDAH DIPERBAIKI) ---
const featuresToDisplay = computed(() => {
  if (!props.geoJson || !props.geoJson.features) return []
  
  const cleanFilterAfd = props.filterAfd.map(a => a.toString().trim().toUpperCase())
  const isAllAfd = cleanFilterAfd.includes('ALL')
  const targetBlock = props.selectedBlock ? props.selectedBlock.toString().trim().toUpperCase() : null

  return props.geoJson.features
    .filter(f => {
      // 1. FILTER ISOLASI BLOK
      if (targetBlock) {
          const infraBlock = (f.properties.BLOCK_NAME || '').toString().trim().toUpperCase()
          if (infraBlock !== targetBlock) return false
      }

      // 2. FILTER KATEGORI (Wajib)
      const matchCat = props.activeCategories.includes(f.properties.KATEGORY)
      if (!matchCat) return false

      // 3. FILTER AFDELING
      if (!targetBlock) {
          const dataAfd = (f.properties.AFD_NAME || '').toString().trim().toUpperCase()
          const matchAfd = isAllAfd || cleanFilterAfd.includes(dataAfd)
          if (!matchAfd) return false
      }

      // 4. FILTER API HAPUS! 
      // Kita hapus bagian pemeriksaan `infraStatusMap` agar data yang tidak ada laporan tetap muncul.
      
      return true // Loloskan semua yang memenuhi filter kategori/blok/afd
    })
    .map(f => {
      const feature = { ...f, geometry: { ...f.geometry, coordinates: [...f.geometry.coordinates] } }
      const coords = feature.geometry.coordinates
      if (coords[0] > 180 || coords[1] > 180) {
        const r = proj4('EPSG:32650', 'EPSG:4326', [parseFloat(coords[0]), parseFloat(coords[1])])
        feature.geometry.coordinates = [r[1], r[0]] 
      }
      return feature
    })
})

onUnmounted(() => { isUnmounted.value = true })
</script>

<style>
.leaflet-popup-content-wrapper { border-radius: 12px; padding: 0; overflow: hidden; box-shadow: 0 10px 15px -3px rgba(0,0,0,0.1); }
.leaflet-popup-content { margin: 16px !important; line-height: 1.4; }
.label-infra-tooltip { background: rgba(0, 0, 0, 0.8) !important; border: none !important; color: white !important; border-radius: 4px; padding: 2px 6px; }
</style>