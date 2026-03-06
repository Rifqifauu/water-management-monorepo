<template>
  <div class="w-full mt-6 px-2 md:px-0">
    
    <div class="flex flex-col md:flex-row justify-between items-end md:items-center gap-4 mb-6">
      <div>
        <h2 class="text-xl font-black text-slate-800 tracking-tight">Matriks Skoring</h2>
        <p class="text-xs text-slate-500 italic">Kelas 1 (Skor 3) s/d Kelas 3 (Skor 1)</p>
      </div>

      <div class="flex flex-wrap gap-1.5 justify-end">
        <button 
          @click="selectedUnit = 'ALL'"
          :class="selectedUnit === 'ALL' ? 'bg-slate-800 text-white shadow-sm' : 'bg-white text-slate-600 border-slate-200'"
          class="px-3 py-1 rounded-md text-[10px] font-bold border transition-all uppercase tracking-wider"
        >
          All Units
        </button>
        <button 
          v-for="unit in availableUnits" 
          :key="unit"
          @click="selectedUnit = unit"
          :class="selectedUnit === unit ? 'bg-blue-600 text-white border-blue-600 shadow-sm' : 'bg-white text-slate-600 border-slate-200'"
          class="px-3 py-1 rounded-md text-[10px] font-bold border transition-all uppercase tracking-wider"
        >
          {{ unit }}
        </button>
      </div>
    </div>

    <div class="bg-white border border-slate-200 rounded-lg shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full text-left border-collapse min-w-[800px] table-fixed">
          <thead>
            <tr class="bg-slate-50 border-b border-slate-200">
              <th class="px-4 py-3 text-[10px] font-black text-slate-400 uppercase w-[200px] sticky left-0 bg-slate-50 z-20">
                Parameter
              </th>
              <th v-for="score in sortedUniqueScores" :key="score" class="px-4 py-3 text-[10px] font-black text-center uppercase border-l border-slate-100"
                :class="score === 3 ? 'text-emerald-600' : score === 1 ? 'text-rose-600' : 'text-amber-600'">
                Kelas {{ Math.abs(score - 4) }} 
                <span class="block text-[8px] opacity-60 font-medium">(Skor {{ score }})</span>
              </th>
            </tr>
          </thead>

          <tbody class="divide-y divide-slate-100">
            <template v-for="(parameters, unitName) in filteredMatrixData" :key="unitName">
              <tr class="bg-slate-50/80">
                <td :colspan="sortedUniqueScores.length + 1" class="px-4 py-1.5 border-y border-slate-200/60">
                  <span class="text-[9px] font-black text-slate-500 uppercase tracking-[0.2em] italic">
                    {{ unitName }}
                  </span>
                </td>
              </tr>

              <tr v-for="(scoreGroups, paramName) in parameters" :key="paramName" class="hover:bg-blue-50/5 group">
                <td class="px-4 py-3 align-top bg-white sticky left-0 z-10 border-r border-slate-100 shadow-[1px_0_0_0_#f1f5f9]">
                  <div class="text-[11px] font-bold text-slate-700 leading-tight">{{ paramName }}</div>
                </td>

                <td v-for="score in sortedUniqueScores" :key="score" class="px-2 py-2 align-top border-l border-slate-50">
                  <div v-if="scoreGroups[score] && scoreGroups[score].length > 0" class="flex flex-wrap gap-1.5">
                    
                    <div 
                      v-for="item in scoreGroups[score]" 
                      :key="item.id"
                      class="group/item relative px-2 py-1 rounded bg-white border border-slate-200 text-[10px] text-slate-600 flex items-center gap-2 hover:border-blue-300 hover:shadow-sm transition-all"
                    >
                      <span class="truncate max-w-[120px]" :title="item.label_kondisi">{{ formatLabelKondisi(item) }}</span>
                      
                      <div class="flex items-center gap-1 ml-1 pl-1 border-l border-slate-100 opacity-0 group-hover/item:opacity-100 transition-opacity">

                        <button @click="confirmDelete(item.id)" class="p-0.5 text-rose-500 hover:bg-rose-50 rounded" title="Hapus">
                          <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
                        </button>
                      </div>
                    </div>

                  </div>
                  
                  <div v-else class="flex justify-center items-center h-full py-2">
                    <span class="text-[10px] text-slate-200 tracking-widest">—</span>
                  </div>
                </td>
              </tr>
            </template>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

const emit = defineEmits(['edit', 'delete'])
const isLoading = ref(false)
const selectedUnit = ref('ALL')
const responseData = ref([])

const availableUnits = computed(() => {
  if (!responseData.value.length) return []
  const units = responseData.value.map(item => (item.unit || item.unit_penilaian || 'LAINNYA').trim())
  return [...new Set(units)].sort()
})

const filteredMatrixData = computed(() => {
  const matrix = {}
  const filteredRaw = selectedUnit.value === 'ALL' 
    ? responseData.value 
    : responseData.value.filter(item => (item.unit || item.unit_penilaian || '').trim() === selectedUnit.value)

  filteredRaw.forEach(item => {
    const unitName = (item.unit || item.unit_penilaian || 'LAINNYA').trim()
    const paramName = (item.kategori_parameter || 'Umum').trim()
    const scoreVal = parseInt(item.skor)

    if (!matrix[unitName]) matrix[unitName] = {}
    if (!matrix[unitName][paramName]) matrix[unitName][paramName] = {}
    if (!matrix[unitName][paramName][scoreVal]) matrix[unitName][paramName][scoreVal] = []
    
    matrix[unitName][paramName][scoreVal].push(item)
  })
  return matrix
})

const sortedUniqueScores = computed(() => {
  if (responseData.value.length === 0) return [3, 2, 1]
  const scores = [...new Set(responseData.value.map(item => parseInt(item.skor)))]
  return scores.sort((a, b) => b - a)
})

const formatLabelKondisi = (item) => {
  if (item.label_kondisi) return item.label_kondisi
  const unitSuffix = item.satuan ? ` ${item.satuan}` : ''
  const min = item.min_value != null ? parseFloat(item.min_value) : null
  const max = item.max_value != null ? parseFloat(item.max_value) : null
  if (min !== null && max !== null) return `${min}-${max}${unitSuffix}`
  if (min !== null) return `>${min}${unitSuffix}`
  if (max !== null) return `<${max}${unitSuffix}`
  return 'N/A'
}

const confirmDelete = (id) => {
  if (confirm('Apakah Anda yakin ingin menghapus kriteria ini?')) {
    emit('delete', id)
  }
}

const fetchData = async () => {
  isLoading.value = true
  try {
    const response = await useApi(`skoring`)
    responseData.value = Array.isArray(response) ? response : (response.data || [])
  } catch (error) {
    console.error("Fetch Error:", error)
  } finally {
    isLoading.value = false
  }
}

onMounted(() => fetchData())
</script>