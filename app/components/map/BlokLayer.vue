<template>
  <LLayerGroup v-if="filteredFeatures">
    <LPolygon
      v-for="(feature, index) in filteredFeatures"
      :key="`${feature.properties.BLOCK_NAME}-${index}`"
      :lat-lngs="feature.geometry.coordinates"
      :color="'#ffffff'"
      :weight="1"
      :fill-color="getBlockColor(feature.properties.BLOCK_NAME)"
      :fill-opacity="0.4"
      @click="handleBlockClick(feature.properties.BLOCK_NAME)"
    >
      <LPopup>
        <div class="min-w-[220px] p-1 font-sans">
          <div class="flex justify-between items-start border-b pb-2 mb-2">
            <h3 class="font-bold text-lg text-green-700 uppercase">
              Blok {{ feature.properties.BLOCK_NAME }}
            </h3>
            <span class="text-[10px] bg-slate-100 px-2 py-1 rounded text-slate-500 font-mono">
              {{ feature.properties.AFD_NAME }}
            </span>
          </div>
          
          <div class="grid grid-cols-2 gap-2 text-xs mb-3">
            <div>
              <p class="text-gray-400">Luas Area</p>
              <p class="font-semibold">{{ feature.properties.HA || '0' }} Ha</p>
            </div>
            <div>
              <p class="text-gray-400">Topografi</p>
              <p class="font-semibold">{{ feature.properties.TOPO || '-' }}</p>
            </div>
            <div>
              <p class="text-gray-400">Tahun Tanam</p>
              <p class="font-semibold">{{ feature.properties.YOP || '-' }}</p>
            </div>
          </div>

          <hr class="my-2 border-slate-100">

          <div class="bg-slate-50 p-2 rounded-lg border border-slate-200">
            <p class="text-[10px] uppercase text-slate-400 font-bold mb-1 tracking-wider">Status Real-time</p>
            
            <div v-if="loadingStates[feature.properties.BLOCK_NAME]" class="flex items-center gap-2 py-1 text-xs text-blue-600">
              <span class="animate-spin text-sm">🌀</span> Memuat data status...
            </div>

            <div v-else-if="apiData[feature.properties.BLOCK_NAME]" class="text-xs space-y-1">
              <div class="flex justify-between">
                <span>Status:</span>
                <span class="font-bold text-blue-600 uppercase">{{ apiData[feature.properties.BLOCK_NAME].status }}</span>
              </div>
              <p><b>Keterangan:</b> {{ apiData[feature.properties.BLOCK_NAME].description || '-' }}</p>
              <p class="text-[10px] text-gray-400 mt-1 italic">Update: {{ apiData[feature.properties.BLOCK_NAME].last_update }}</p>
            </div>

            <div v-else class="text-[10px] text-gray-400 italic py-1">
              Klik area untuk melihat status terbaru
            </div>
          </div>
        </div>
      </LPopup>

      <LTooltip>{{ feature.properties.BLOCK_NAME }}</LTooltip>
    </LPolygon>
  </LLayerGroup>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { LLayerGroup, LPolygon, LPopup, LTooltip } from '@vue-leaflet/vue-leaflet'
import proj4 from 'proj4'

const props = defineProps({
  filterAfd: { type: String, default: 'All' }
})

const emit = defineEmits(['ready', 'update-afdelings'])

proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

const geoJsonData = ref(null)
const apiData = ref({})
const loadingStates = ref({})

// Filter data berdasarkan tombol yang diklik di parent
const filteredFeatures = computed(() => {
  if (!geoJsonData.value) return []
  if (props.filterAfd === 'All') return geoJsonData.value.features
  return geoJsonData.value.features.filter(f => f.properties.AFD_NAME === props.filterAfd)
})

const getBlockColor = (blockName) => {
  const status = apiData.value[blockName]?.status?.toLowerCase()
  if (status === 'critical') return '#ef4444'
  if (status === 'maintenance') return '#f59e0b'
  return '#22c55e' 
}

const handleBlockClick = async (blockName) => {
  if (apiData.value[blockName]) return // Cache sederhana
  loadingStates.value[blockName] = true
  
  try {
    const res = await fetch(`http://localhost:8000/api/block-status/${blockName}`)
    if (!res.ok) throw new Error()
    apiData.value[blockName] = await res.json()
  } catch (err) {
    apiData.value[blockName] = { status: 'Error', description: 'Gagal memuat API', last_update: '-' }
  } finally {
    loadingStates.value[blockName] = false
  }
}

onMounted(async () => {
  try {
    const res = await fetch('http://localhost:8000/Blok.json')
    const data = await res.json()
    if (data.crs) delete data.crs

    // Ekstrak daftar Afdeling unik + Hitung jumlah blok per afdeling
    const afdMap = {}
    data.features.forEach(f => {
      const name = f.properties.AFD_NAME
      afdMap[name] = (afdMap[name] || 0) + 1
    })
    
    const sortedAfdelings = Object.keys(afdMap).sort().map(name => ({
      name,
      count: afdMap[name]
    }))
    emit('update-afdelings', sortedAfdelings)

    // Konversi koordinat (Fix 3D & UTM)
    data.features = data.features.map(f => {
      const convertRing = (ring) => ring.map(c => {
        const result = proj4('EPSG:32650', 'EPSG:4326', [c[0], c[1]])
        return [result[1], result[0]] // Lat, Lng
      })

      if (f.geometry.type === 'Polygon') {
        f.geometry.coordinates = f.geometry.coordinates.map(convertRing)
      } else if (f.geometry.type === 'MultiPolygon') {
        f.geometry.coordinates = f.geometry.coordinates.map(p => p.map(convertRing))
      }
      return f
    })

    geoJsonData.value = data
    emit('ready', data)
  } catch (e) {
    console.error("Blok Layer Error:", e)
  }
})
</script>