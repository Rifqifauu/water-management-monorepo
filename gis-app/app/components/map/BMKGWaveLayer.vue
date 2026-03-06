<template>
  <LLayerGroup>
    <LImageOverlay
      v-if="imageUrl && validBounds"
      :url="imageUrl"
      :bounds="validBounds"
      :opacity="0.6" 
      :z-index="500"
    />
  </LLayerGroup>
</template>

<script setup>
import { ref, watch, onMounted, computed, toRaw } from 'vue'
import { LLayerGroup, LImageOverlay } from '@vue-leaflet/vue-leaflet'

const props = defineProps({
  matrixData: { type: Array, default: () => [] },
  dynamicBounds: { type: Array, default: null }, 
  minVal: { type: Number, default: -1.0 }, // Meter
  maxVal: { type: Number, default: 1.0 }   // Meter
})

const imageUrl = ref(null)

// Validasi Bounds agar tidak error
const validBounds = computed(() => {
  const b = props.dynamicBounds
  if (b && b.length === 2 && 
      Number.isFinite(b[0][0]) && Number.isFinite(b[0][1]) &&
      Number.isFinite(b[1][0]) && Number.isFinite(b[1][1])) {
      // Deep copy untuk melepas Proxy Vue
      return JSON.parse(JSON.stringify(b))
  }
  return null
})

// Fungsi helper agar nilai RGB aman (0-255)
const clampRGB = (val) => Math.max(0, Math.min(255, Math.floor(val || 0)))

const generateOverlay = () => {
  if (!props.matrixData || props.matrixData.length === 0) return

  // toRaw meningkatkan performa loop pada array besar
  const rawMatrix = toRaw(props.matrixData)
  
  const rows = rawMatrix.length
  const cols = rawMatrix[0]?.length || 0
  
  if (rows === 0 || cols === 0) return

  try {
    const canvas = document.createElement('canvas')
    canvas.width = cols
    canvas.height = rows
    const ctx = canvas.getContext('2d')
    const imgData = ctx.createImageData(cols, rows)
    const data = imgData.data

    for (let y = 0; y < rows; y++) {
      const rowData = rawMatrix[y]
      if (!rowData) continue

      for (let x = 0; x < cols; x++) {
        // Ambil data
        const value = parseFloat(rowData[x])
        const i = (y * cols + x) * 4

        // Filter Data Valid (Abaikan 9999/Darat dan NaN)
        if (Number.isFinite(value) && Math.abs(value) < 100) {
          
          // Normalisasi nilai (-1 s/d 1) menjadi (0 s/d 1)
          let t = (value - props.minVal) / (props.maxVal - props.minVal)
          if (t < 0) t = 0; if (t > 1) t = 1;

          let r = 0, g = 0, b = 0
          
          // Logic Gradasi Warna: Biru -> Hijau -> Merah
          if (t < 0.5) {
             // Fase Surut ke Normal (Biru ke Hijau)
             // t: 0 -> 0.5
             b = 255 * (1 - (t * 2))
             g = 255 * (t * 2)
          } else {
             // Fase Normal ke Pasang (Hijau ke Merah)
             // t: 0.5 -> 1.0
             g = 255 * (1 - ((t - 0.5) * 2))
             r = 255 * ((t - 0.5) * 2)
          }

          data[i] = clampRGB(r)
          data[i + 1] = clampRGB(g)
          data[i + 2] = clampRGB(b)
          data[i + 3] = 200 // Opacity (0-255), set 200 agar agak transparan
        } else {
          // Pixel Transparan (Daratan/No Data)
          data[i + 3] = 0 
        }
      }
    }

    ctx.putImageData(imgData, 0, 0)
    imageUrl.value = canvas.toDataURL()

  } catch (err) {
    console.error("Error Generate Layer:", err)
  }
}

watch(() => props.matrixData, generateOverlay, { deep: true, immediate: true })
</script>