<template>
  <LGeoJson
    v-if="dissolvedData"
    :geojson="dissolvedData"
    :options-style="style"
    :options-on-each-feature="onEachFeature"
    :options="geoJsonOptions"
  />
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { LGeoJson } from '@vue-leaflet/vue-leaflet'
import proj4 from 'proj4'
import * as turf from '@turf/turf'

proj4.defs('EPSG:32650', '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs')

const dissolvedData = ref<any>(null)
const emit = defineEmits(['ready'])

// Options untuk GeoJson Layer - PENTING untuk rendering order
const geoJsonOptions = {
  pane: 'overlayPane',
  interactive: false  // Ini akan diterapkan ke seluruh layer
}

const style = () => ({
  color: '#f59e0b',
  weight: 4,
  fillOpacity: 0,
  opacity: 1,
  dashArray: '12, 12',
  fill: false,  // PENTING: Tidak ada fill sama sekali
  stroke: true
})

const onEachFeature = (feature: any, layer: any) => {
  if (feature.properties?.AFD_NAME) {
    const tooltip = layer.bindTooltip(`AFDELING ${feature.properties.AFD_NAME}`, {
      permanent: true,
      direction: 'center',
      className: 'custom-afdeling-label',
      interactive: false  // Tooltip juga non-interaktif
    })
    
    // Pastikan tooltip tidak bisa menerima pointer events
    tooltip.on('add', () => {
      const tooltipEl = tooltip.getElement()
      if (tooltipEl) {
        tooltipEl.style.pointerEvents = 'none'
      }
    })
  }
}

onMounted(async () => {
  try {
    const res = await fetch('http://localhost:8000/Blok.json')
    const data = await res.json()
    
    data.features.forEach((f: any) => {
      const convertCoords = (ring: any[]) => 
        ring.map(c => proj4('EPSG:32650', 'EPSG:4326', [c[0] ?? 0, c[1] ?? 0]))
      
      if (f.geometry.type === 'Polygon') {
        f.geometry.coordinates = f.geometry.coordinates.map(convertCoords)
      } else if (f.geometry.type === 'MultiPolygon') {
        f.geometry.coordinates = f.geometry.coordinates.map((poly: any) => 
          poly.map(convertCoords)
        )
      }
    })

    const flattened = turf.flatten(data) as any
    const dissolved = turf.dissolve(flattened, { propertyName: 'AFD_NAME' })
    
    dissolvedData.value = dissolved
    emit('ready', dissolved)
  } catch (e) {
    console.error("Afdeling Layer Error:", e)
  }
})
</script>