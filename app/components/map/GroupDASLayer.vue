<template>
  <LGeoJson
    v-if="geoJsonData"
    :geojson="geoJsonData"
    :options-style="baseStyle"
    :options="geojsonOptions"
  />

  <div class="ui-overlay">
    
    <Transition name="fade">
      <div
        v-if="hoverInfo"
        class="glass-panel hover-card"
        :style="{ borderLeftColor: getColor(hoverInfo) }"
      >
        <div class="card-header">
          <span class="badge" :style="{ background: getColor(hoverInfo) }">
            {{ cleanCode(hoverInfo.Group_DAS) }}
          </span>
          <span class="card-label">SUB DAS</span>
        </div>
        
        <div class="card-title">
          {{ cleanCode(hoverInfo.DAS) || cleanCode(hoverInfo.Group_DAS) }}
        </div>

        <div class="card-stats">
          <div class="stat-item">
            <span class="stat-label">Blok</span>
            <span class="stat-value">{{ hoverInfo.BLOCK_NAME }}</span>
          </div>
          <div class="stat-item text-right">
            <span class="stat-label">Luas Area</span>
            <span class="stat-value">{{ formatNumber(hoverInfo.HA) }} <small>Ha</small></span>
          </div>
        </div>
      </div>
    </Transition>

    <div class="glass-panel legend-container">
      <div class="legend-header" @click="isLegendOpen = !isLegendOpen">
        <span>Legenda Area</span>
        <button class="toggle-btn">
          {{ isLegendOpen ? '▼' : '▲' }}
        </button>
      </div>
      
      <Transition name="slide-up">
        <div v-if="isLegendOpen" class="legend-body custom-scroll">
          <div
            v-for="(color, label) in activePalette"
            :key="label"
            class="legend-row"
          >
            <span class="color-dot" :style="{ background: color }"></span>
            <span class="legend-text">{{ label }}</span>
          </div>
        </div>
      </Transition>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { LGeoJson } from '@vue-leaflet/vue-leaflet'

/* ================= STATE ================= */
const geoJsonData = ref(null)
const hoverInfo = ref(null)
const isLegendOpen = ref(false) // Default terbuka, user bisa menutupnya

/* ================= BLUE SCALE PALETTE (Thematic Water/River) ================= */
// Menggunakan variasi dari Dark Blue (Hulu) ke Light Blue/Cyan (Hilir) atau sekedar grouping
const palette = {
  // Group 1: Deep Indigos/Slates
  '1': '#0f172a', '1A': '#1e293b', '1B': '#334155',
  
  // Group 2: Strong Blues
  '2': '#1e3a8a', '2A': '#1d4ed8', '2B': '#2563eb',
  
  // Group 3: Classic Blues
  '3': '#3b82f6', '3A': '#60a5fa', '3B': '#93c5fd', '3C': '#bfdbfe',
  
  // Group 4: Sky/Light Blues
  '4': '#0284c7', '4A': '#0ea5e9', '4B': '#38bdf8',
  '4C': '#7dd3fc', '4D': '#bae6fd', '4E': '#e0f2fe',
  
  // Group 5: Teals/Cyans (Pembeda kontras)
  '5': '#0e7490', '5A': '#06b6d4',
  
  // Group 6: Aquamarine
  '6': '#0f766e', '6A': '#14b8a6', '6B': '#2dd4bf',
  '6C': '#5eead4', '6D': '#99f6e4', '6E': '#ccfbf1',
  
  DEFAULT: '#94a3b8' // Greyish for undefined
}

const activePalette = computed(() => palette)

/* ================= LOAD DATA ================= */
onMounted(async () => {
  try {
    const res = await fetch('/GroupDAS.json')
    geoJsonData.value = await res.json()
  } catch (e) {
    console.error("Gagal load GeoJSON", e)
  }
})

/* ================= HELPERS ================= */
const cleanCode = (val) =>
  val ? String(val).replace(/[^a-zA-Z0-9]/g, '').toUpperCase() : '-'

const formatNumber = (n) =>
  Number(n).toLocaleString('id-ID', { maximumFractionDigits: 2 })

const getColor = (props) => {
  if (!props) return palette.DEFAULT
  const sub = cleanCode(props.DAS)
  const group = cleanCode(props.Group_DAS)
  return palette[sub] || palette[group] || palette.DEFAULT
}

/* ================= STYLE MAP ================= */
const baseStyle = (feature) => ({
  fillColor: getColor(feature.properties),
  fillOpacity: 0.75, // Sedikit lebih transparan agar basemap terlihat
  weight: 1,
  color: 'white', // Garis batas putih tipis
  opacity: 0.5,
  className: 'geo-path' // Class untuk CSS transition
})

const geojsonOptions = {
  onEachFeature: (feature, layer) => {
    layer.on({
      mouseover: (e) => {
        hoverInfo.value = feature.properties
        const layer = e.target
        
        layer.setStyle({
          weight: 2,
          color: '#fff',
          opacity: 1,
          fillOpacity: 0.95
        })
        layer.bringToFront()
      },
      mouseout: (e) => {
        hoverInfo.value = null
        // Reset style
        geoJsonData.value && e.target.setStyle(baseStyle(feature))
      }
    })
  }
}
</script>

<style scoped>
/* Container Overlay agar UI mengambang di atas peta */
.ui-overlay {
  pointer-events: none; /* Biarkan klik tembus ke peta */
  position: absolute;
  inset: 0;
  z-index: 1000;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  padding: 24px;
}

/* Glassmorphism Base Style */
.glass-panel {
  pointer-events: auto; /* Aktifkan klik pada panel */
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(8px);
  border: 1px solid rgba(255, 255, 255, 0.4);
  box-shadow: 0 8px 32px rgba(30, 58, 138, 0.15); /* Shadow biru tipis */
  border-radius: 12px;
  font-family: 'Inter', sans-serif; /* Pastikan font bagus */
}

/* === HOVER CARD (Bottom Left) === */
.hover-card {
  position: absolute;
  bottom: 24px;
  left: 24px;
  width: 260px;
  padding: 16px;
  border-left: 6px solid #ccc;
  transition: all 0.3s ease;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}

.card-label {
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 1px;
  color: #64748b;
  font-weight: 600;
}

.badge {
  font-size: 10px;
  color: white;
  padding: 2px 8px;
  border-radius: 10px;
  font-weight: 700;
}

.card-title {
  font-size: 18px;
  font-weight: 800;
  color: #1e293b;
  margin-bottom: 16px;
  line-height: 1.2;
}

.card-stats {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
  border-top: 1px dashed #cbd5e1;
  padding-top: 12px;
}

.stat-item {
  display: flex;
  flex-direction: column;
}

.stat-label {
  font-size: 11px;
  color: #64748b;
  margin-bottom: 2px;
}

.stat-value {
  font-size: 14px;
  font-weight: 600;
  color: #0f172a;
}

.text-right { text-align: right; }

/* === LEGEND (Bottom Right) === */
.legend-container {
  position: absolute;
  bottom: 24px;
  right: 50px;
  width: 160px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.legend-header {
  padding: 10px 14px;
  background: rgba(241, 245, 249, 0.8);
  font-size: 12px;
  font-weight: 700;
  color: #334155;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
  border-bottom: 1px solid rgba(0,0,0,0.05);
}

.toggle-btn {
  border: none;
  background: none;
  font-size: 10px;
  color: #64748b;
  cursor: pointer;
}

.legend-body {
  max-height: 200px; /* Batasi tinggi agar tidak memenuhi layar */
  overflow-y: auto;
  padding: 8px 0;
}

.legend-row {
  display: flex;
  align-items: center;
  padding: 4px 14px;
  transition: background 0.2s;
}

.legend-row:hover {
  background: rgba(0,0,0,0.03);
}

.color-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%; /* Bulat terlihat lebih modern daripada kotak */
  margin-right: 10px;
  box-shadow: 0 0 0 1px rgba(0,0,0,0.1);
}

.legend-text {
  font-size: 11px;
  color: #475569;
}

/* Custom Scrollbar yang halus */
.custom-scroll::-webkit-scrollbar {
  width: 4px;
}
.custom-scroll::-webkit-scrollbar-track {
  background: transparent;
}
.custom-scroll::-webkit-scrollbar-thumb {
  background: #cbd5e1;
  border-radius: 4px;
}

/* Animations */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease, transform 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
  transform: translateY(10px);
}

.slide-up-enter-active,
.slide-up-leave-active {
  transition: max-height 0.3s ease, opacity 0.3s ease;
}
.slide-up-enter-from,
.slide-up-leave-to {
  max-height: 0;
  opacity: 0;
}
</style>