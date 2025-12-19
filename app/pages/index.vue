<template>
  <div class="relative w-full h-[90vh] rounded-2xl overflow-hidden shadow-2xl border border-gray-200 dark:border-gray-800 bg-slate-900">
    
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

    <ClientOnly>
      <LMap
        ref="mapRef"
        :zoom="zoom"
        :max-zoom="18"
        :center="initialCenter"
        :use-global-leaflet="false"
        class="h-full w-full z-0"
        :options="{ zoomControl: false }" 
      >
        <LControlZoom position="bottomright" />
        <LControlLayers position="topright" />

        <LTileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          layer-type="base"
          name="Street Map"
          :visible="true"
        />
        <LTileLayer
          url="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"
          layer-type="base"
          name="Satellite View"
        />

        <BlokLayer 
          :filter-afd="selectedAfd" 
          @ready="handleLayerReady" 
          @update-afdelings="list => afdelingList = list"
        />
        
        <AfdelingLayer />

        <LTileLayer
          v-if="showRainOverlay"
          url="https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=4a192ab87b2343ada7da03f7712b7988"
          layer-type="overlay"
          name="Rain Overlay"
          :opacity="0.6"
          :z-index="1000"
        />
      </LMap>
    </ClientOnly>

    <RainLegend v-if="showRainOverlay" />
    
    <MapControls 
      :coords="coords" 
      :show-rain-overlay="showRainOverlay"
      @recenter="recenterMap"
      @toggle-rain="showRainOverlay = !showRainOverlay"
    />

    <LoadingOverlay v-if="isLocating" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { LMap, LTileLayer, LControlLayers, LControlZoom } from '@vue-leaflet/vue-leaflet'
import 'leaflet/dist/leaflet.css'

import AfdelingLayer from '~/components/map/AfdelingLayer.vue'
import BlokLayer from '~/components/map/BlokLayer.vue'
import MapControls from '~/components/map/MapControls.vue'
import RainLegend from '~/components/map/RainLegend.vue'
import LoadingOverlay from '~/components/map/LoadingOverlay.vue'

// Logic State
const mapRef = ref(null)
const zoom = ref(13)
const initialCenter = ref([-6.2088, 106.8456])
const showRainOverlay = ref(true)
const hasFitBounds = ref(false)

const afdelingList = ref([])      // Data dari BlokLayer via emit
const selectedAfd = ref('All')     // Filter aktif

// Composable for GPS
const { coords, isLocating } = useLocation()

/**
 * Handle ketika data GeoJSON sudah dimuat
 * Melakukan fly ke lokasi spesifik plywood/kebun
 */
const handleLayerReady = async (geojsonData) => {
  if (!process.client || hasFitBounds.value) return
  
  const map = mapRef.value?.leafletObject
  if (map) {
    // Timeout sedikit untuk memastikan transisi smooth
    setTimeout(() => {
      map.flyTo([1.24644, 117.90811], 14, {
        animate: true,
        duration: 1.5
      })
      hasFitBounds.value = true
    }, 500)
  }
}

/**
 * Recenter ke koordinat user (GPS)
 */
const recenterMap = () => {
  if (coords.value?.lat && mapRef.value?.leafletObject) {
    mapRef.value.leafletObject.flyTo([coords.value.lat, coords.value.lng], 16)
  }
}
</script>

<style>
/* 1. Sembunyikan Scrollbar tapi tetap fungsional */
.scrollbar-hide::-webkit-scrollbar {
    display: none;
}
.scrollbar-hide {
    -ms-overflow-style: none;
    scrollbar-width: none;
}

/* 2. Efek bayangan halus di ujung kanan filter */
.mask-fade-right {
  mask-image: linear-gradient(to right, black 85%, transparent 100%);
  -webkit-mask-image: linear-gradient(to right, black 85%, transparent 100%);
}

/* 3. Leaflet Overrides */
.leaflet-container {
  background: #0f172a !important; /* Warna dark slate saat map loading */
}

.leaflet-popup-content-wrapper {
  background-color: #ffffff !important;
  color: #1e293b !important;
  border-radius: 12px !important;
  padding: 4px;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
}

/* 4. Animasi tombol saat diklik */
button:active {
  transform: scale(0.95);
}
</style>