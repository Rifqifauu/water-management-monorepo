<template>
  <div class="relative w-full h-full rounded-2xl overflow-hidden shadow-2xl border border-gray-200 dark:border-gray-800 bg-slate-900">
    
    <!-- Filter Wilayah -->
    <div class="absolute top-4 left-4 right-4 z-[1000] flex flex-col gap-2 pointer-events-none">
      <div class="flex items-center gap-2 px-1">
        <span class="bg-slate-900/80 backdrop-blur-md text-[10px] text-white px-2 py-0.5 rounded-md border border-white/10 font-bold uppercase tracking-wider shadow-sm pointer-events-auto">
          Filter Wilayah
        </span>
      </div>

      <div class="flex items-center gap-2 overflow-x-auto pb-4 scrollbar-hide pointer-events-auto mask-fade-right">
        <button 
          @click="selectedAfd = 'All'"
          :class="[
            'flex-none px-4 py-2.5 rounded-xl text-[11px] font-bold transition-all duration-300 border shadow-lg flex items-center gap-2', 
            selectedAfd === 'All' 
              ? 'bg-green-600 border-green-500 text-white shadow-green-500/20 scale-105' 
              : 'bg-white/90 backdrop-blur-md border-gray-200 text-gray-700 hover:bg-white'
          ]"
        >
          <UIcon name="i-heroicons-squares-2x2-20-solid" class="w-4 h-4" />
          SEMUA BLOK
        </button>
        
        <div class="w-[1px] h-6 bg-gray-400/30 flex-none mx-1"></div>

        <button 
          v-for="afd in afdelingList" 
          :key="afd.name"
          @click="selectedAfd = afd.name"
          :class="[
            'flex-none px-4 py-2.5 rounded-xl text-[11px] font-bold transition-all duration-300 border shadow-lg flex items-center gap-2 uppercase', 
            selectedAfd === afd.name 
              ? 'bg-green-600 border-green-500 text-white shadow-green-500/20 scale-105' 
              : 'bg-white/90 backdrop-blur-md border-gray-200 text-gray-700 hover:bg-white'
          ]"
        >
          <span>AFD {{ afd.name }}</span>
          <span 
            :class="[
              'px-1.5 py-0.5 rounded-md text-[9px] font-black',
              selectedAfd === afd.name ? 'bg-white/20 text-white' : 'bg-gray-100 text-gray-500'
            ]"
          >
            {{ afd.count }}
          </span>
        </button>
      </div>
    </div>

    <!-- Leaflet Map -->
    <ClientOnly>
      <LMap
        ref="mapRef"
        :zoom="14"
        :max-zoom="18"
        :center="[1.24644, 117.90811]"
        :use-global-leaflet="false"
        class="h-full w-full z-0"
        :options="{ zoomControl: false, attributionControl: false }" 
      >
        <LControlZoom position="bottomright" />

        <LTileLayer
          v-if="basemap === 'street'"
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          layer-type="base"
          name="Street Map"
        />
        <LTileLayer
          v-if="basemap === 'satellite'"
          url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"
          layer-type="base"
          name="Satellite View"
        />

        <BlokLayer 
          :filter-afd="selectedAfd" 
          @update-afdelings="list => afdelingList = list"
        />
        
        <AfdelingLayer />

        <LTileLayer
          v-if="showRainOverlay"
          url="https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=4a192ab87b2343ada7da03f7712b7988"
          :opacity="1.0"
          :z-index="1000"
        />
        <LTileLayer
          v-if="showRainOverlay"
          url="https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=4a192ab87b2343ada7da03f7712b7988"
          :opacity="0.7"
          :z-index="1001"
        />
      </LMap>
    </ClientOnly>

    <RainLegend v-if="showRainOverlay" />
    <LoadingOverlay v-if="isLocating" />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { LMap, LTileLayer, LControlZoom } from '@vue-leaflet/vue-leaflet'
import 'leaflet/dist/leaflet.css'

const props = defineProps({
  basemap: { type: String, default: 'satellite' },
  showRainOverlay: { type: Boolean, default: false }
})

const mapRef = ref(null)
const afdelingList = ref([])      
const selectedAfd = ref('All')     
const { coords, isLocating } = useLocation()

const recenterMap = () => {
  if (coords.value?.lat && mapRef.value?.leafletObject) {
    mapRef.value.leafletObject.flyTo([coords.value.lat, coords.value.lng], 16)
  }
}

defineExpose({ recenterMap })
</script>

<style scoped>
.scrollbar-hide::-webkit-scrollbar { display: none; }
.scrollbar-hide { -ms-overflow-style: none; scrollbar-width: none; }

.mask-fade-right {
  mask-image: linear-gradient(to right, black 85%, transparent 100%);
  -webkit-mask-image: linear-gradient(to right, black 85%, transparent 100%);
}
</style>