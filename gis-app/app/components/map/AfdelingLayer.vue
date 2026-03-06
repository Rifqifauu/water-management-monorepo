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
import type { StyleFunction, PathOptions } from 'leaflet'

/* ===============================
   PROJECTION
================================ */
proj4.defs(
  'EPSG:32650',
  '+proj=utm +zone=50 +datum=WGS84 +units=m +no_defs'
)

/* ===============================
   STATE
================================ */
const dissolvedData = ref<any>(null)
const emit = defineEmits<{
  (e: 'ready', data: any): void
}>()

/* ===============================
   GEOJSON OPTIONS
================================ */
const geoJsonOptions = {
  pane: 'overlayPane',
  interactive: false
}

/* ===============================
   STYLE (TS SAFE)
================================ */
const style: StyleFunction<any> = (): PathOptions => ({
  color: '#f59e0b',
  weight: 3,
  opacity: 0.9,
  lineCap: 'round',
  lineJoin: 'round',
  fill: false
})

/* ===============================
   FEATURE HANDLER
================================ */
const onEachFeature = (feature: any, layer: any) => {
  if (!feature?.properties?.AFD_NAME) return

  const tooltip = layer.bindTooltip(
    `AFDELING ${feature.properties.AFD_NAME}`,
    {
      permanent: true,
      direction: 'center',
      className: 'custom-afdeling-label',
      interactive: false
    }
  )

  tooltip.on('add', () => {
    const el = tooltip.getElement()
    if (el) el.style.pointerEvents = 'none'
  })
}

/* ===============================
   LOAD & PROCESS DATA
================================ */
onMounted(async () => {
  try {
    const res = await fetch('/Blok.json')
    const data = await res.json()

    // Convert UTM → WGS84
    data.features.forEach((f: any) => {
      const convertRing = (ring: number[][]) =>
        ring.map(c =>
          proj4('EPSG:32650', 'EPSG:4326', [c[0] ?? 0, c[1] ?? 0])
        )

      if (f.geometry.type === 'Polygon') {
        f.geometry.coordinates = f.geometry.coordinates.map(convertRing)
      }

      if (f.geometry.type === 'MultiPolygon') {
        f.geometry.coordinates = f.geometry.coordinates.map(
          (poly: number[][][]) => poly.map(convertRing)
        )
      }
    })

    // Dissolve by AFD
    const flattened = turf.flatten(data) as any
    const dissolved = turf.dissolve(flattened, {
      propertyName: 'AFD_NAME'
    })

    dissolvedData.value = dissolved
    emit('ready', dissolved)
  } catch (err) {
    console.error('Afdeling Layer Error:', err)
  }
})
</script>

<style>

.leaflet-interactive {
  animation: dashmove 14s linear infinite;
}

@keyframes dashmove {
  from {
    stroke-dashoffset: 0;
  }
  to {
    stroke-dashoffset: -300;
  }
}

.leaflet-zoom-animated .leaflet-interactive {
  vector-effect: non-scaling-stroke;
}

.custom-afdeling-label {
  background: transparent;
  border: none;
  box-shadow: none;
  color: #92400e;
  font-size: 11px;
  font-weight: 700;
  text-shadow:
    0 1px 2px rgba(255, 255, 255, 0.9),
    0 0 3px rgba(255, 255, 255, 0.6);
  pointer-events: none;
}
</style>
