<template>
  <aside 
    class="fixed inset-y-0 left-0 z-[1000] flex flex-col h-screen bg-white border-r border-gray-200 dark:bg-gray-900 dark:border-gray-800 transition-transform duration-300 ease-in-out shadow-2xl lg:shadow-none
    w-[85vw] max-w-[320px] sm:w-80 lg:w-72 lg:relative lg:translate-x-0 print:hidden"
    :class="isOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'"
  >
    
    <div class="flex items-center justify-between px-3 sm:px-4 h-14 sm:h-16 lg:h-20 flex-shrink-0 border-b border-gray-100 dark:border-gray-800">
      <div class="flex items-center gap-2 sm:gap-3 min-w-0 flex-1">
        <div class="h-8 sm:h-10 lg:h-12 w-fit px-1.5 sm:px-2 rounded-lg dark:bg-white flex items-center justify-center">
          <img src="/logo-nama.png" alt="Logo" class="h-full w-auto object-contain">
        </div>
      </div>
      
      <button 
        @click="$emit('close')"
        class="lg:hidden p-1.5 sm:p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-gray-500 transition-colors focus:outline-none flex-shrink-0"
      >
        <UIcon name="i-heroicons-x-mark" class="w-5 h-5 sm:w-6 sm:h-6" />
      </button>
    </div>

    <nav class="flex-1 px-3 sm:px-4 py-3 sm:py-4 space-y-4 sm:space-y-6 overflow-y-auto custom-scrollbar">
      
      <div>
        <div class="text-[9px] sm:text-[10px] font-bold text-gray-400 uppercase px-2 mb-2 tracking-wider flex items-center gap-2">
          <UIcon name="i-heroicons-globe-alt" class="w-3 h-3" />
          Mode Peta
        </div>
        <div class="grid grid-cols-3 gap-1.5 sm:gap-2 p-1 bg-gray-100 dark:bg-gray-800 rounded-lg border border-gray-200 dark:border-gray-700">
          <button 
            v-for="mode in ['street', 'satellite', 'topo']" 
            :key="mode"
            @click="$emit('update:basemap', mode)"
            :class="['flex flex-col items-center justify-center gap-1 sm:gap-1.5 py-1.5 sm:py-2 rounded-md text-[9px] sm:text-[10px] font-bold transition-all', basemap === mode ? 'bg-white dark:bg-gray-700 text-primary-600 dark:text-primary-400 shadow-sm' : 'text-gray-500 hover:text-gray-900 dark:hover:text-gray-300']"
          >
            <UIcon :name="mode === 'street' ? 'i-heroicons-map' : mode === 'satellite' ? 'i-heroicons-photo' : 'i-heroicons-signal'" class="w-3 h-3 sm:w-3.5 sm:h-3.5" /> 
            <span class="capitalize text-[8px] sm:text-[9px]">{{ mode }}</span>
          </button>
        </div>
      </div>

      <div>
        <div class="text-[9px] sm:text-[10px] font-bold text-gray-400 uppercase px-2 mb-2 tracking-wider flex items-center gap-2">
          <UIcon name="i-heroicons-square-3-stack-3d" class="w-3 h-3" />
          Layer & Overlay
        </div>
        
        <div class="space-y-2 sm:space-y-3">
          
          <div 
            class="flex items-center justify-between px-2 sm:px-3 py-2 sm:py-2.5 rounded-xl hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors cursor-pointer group" 
            @click="!loadingStates.blok && $emit('update:showBlok', !showBlok)"
            :class="{'opacity-75 cursor-wait': loadingStates.blok}"
          >
            <div class="flex items-center gap-2 sm:gap-3 min-w-0 flex-1">
              <div :class="['w-7 h-7 sm:w-8 sm:h-8 rounded-lg flex items-center justify-center transition-colors flex-shrink-0', showBlok ? 'bg-green-500/10 text-green-600' : 'bg-gray-100 text-gray-400']">
                <UIcon v-if="loadingStates.blok" name="i-heroicons-arrow-path" class="w-3.5 h-3.5 sm:w-4 sm:h-4 animate-spin" />
                <UIcon v-else name="i-heroicons-squares-plus" class="w-3.5 h-3.5 sm:w-4 sm:h-4" />
              </div>
              <div class="text-left min-w-0">
                <div class="text-[10px] sm:text-[11px] font-bold text-gray-700 dark:text-gray-200 truncate">
                   Area Blok 
                   <span v-if="loadingStates.blok" class="text-[8px] font-normal text-green-600 ml-1">(Memuat...)</span>
                </div>
                <div class="text-[8px] sm:text-[9px] text-gray-400 truncate">Polygon kebun</div>
              </div>
            </div>
            <div class="relative inline-flex items-center cursor-pointer" @click.stop>
              <input type="checkbox" :checked="showBlok" class="sr-only peer" @change="$emit('update:showBlok', !showBlok)" :disabled="loadingStates.blok">
              <div class="w-8 h-4 bg-gray-200 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-3 after:w-3 after:transition-all peer-checked:bg-green-600"></div>
            </div>
          </div>

          <div class="bg-gray-50 dark:bg-gray-800/50 rounded-xl border border-transparent hover:border-gray-200 dark:hover:border-gray-700 transition-all overflow-hidden">
            <div 
                class="flex items-center justify-between px-2 sm:px-3 py-2 sm:py-2.5 cursor-pointer" 
                @click="!loadingStates.infra && $emit('update:showInfra', !showInfra)"
                :class="{'opacity-75 cursor-wait': loadingStates.infra}"
            >
              <div class="flex items-center gap-2 sm:gap-3 min-w-0 flex-1">
                <div :class="['w-7 h-7 sm:w-8 sm:h-8 rounded-lg flex items-center justify-center transition-colors flex-shrink-0', showInfra ? 'bg-primary-500/10 text-primary-600' : 'bg-gray-100 text-gray-400']">
                  <UIcon v-if="loadingStates.infra" name="i-heroicons-arrow-path" class="w-3.5 h-3.5 sm:w-4 sm:h-4 animate-spin" />
                  <UIcon v-else name="i-heroicons-wrench-screwdriver" class="w-3.5 h-3.5 sm:w-4 sm:h-4" />
                </div>
                <div class="text-left min-w-0">
                  <div class="text-[10px] sm:text-[11px] font-bold text-gray-700 dark:text-gray-200 truncate">
                    Infrastruktur
                    <span v-if="loadingStates.infra" class="text-[8px] font-normal text-primary-600 ml-1">(Memuat...)</span>
                  </div>
                  <div class="text-[8px] sm:text-[9px] text-gray-400 truncate">Jembatan, PVC, NF</div>
                </div>
              </div>
              <div class="relative inline-flex items-center cursor-pointer" @click.stop>
                <input type="checkbox" :checked="showInfra" class="sr-only peer" @change="$emit('update:showInfra', !showInfra)" :disabled="loadingStates.infra">
                <div class="w-8 h-4 bg-gray-200 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-3 after:w-3 after:transition-all peer-checked:bg-primary-600"></div>
              </div>
            </div>

            <div v-if="showInfra && !loadingStates.infra" class="px-2 sm:px-3 pb-2 sm:pb-3 pt-1 border-t border-gray-100 dark:border-gray-700/50 mt-1">
              <div class="flex items-center justify-between mb-2 mt-1">
                <span class="text-[8px] sm:text-[9px] font-bold text-gray-400 uppercase tracking-wider">Filter Tipe</span>
                <button @click="toggleAllInfra" class="text-[8px] sm:text-[9px] font-bold text-primary-500 hover:text-primary-600 transition-colors">
                   {{ isAllInfraSelected ? 'Reset' : 'Pilih Semua' }}
                </button>
              </div>
              
              <div v-if="infraCategories.length === 0" class="text-center py-2">
                 <span class="text-[9px] sm:text-[10px] text-gray-400 italic">Memuat data...</span>
              </div>

              <div class="grid grid-cols-1 gap-1 sm:gap-1.5 max-h-40 sm:max-h-48 overflow-y-auto custom-scrollbar pr-1">
                <button
                  v-for="cat in infraCategories"
                  :key="cat.name"
                  @click="toggleInfraCategory(cat.name)"
                  :class="[
                    'flex items-center justify-between w-full px-2 py-1.5 sm:py-2 rounded-lg border text-left transition-all duration-200 group',
                    selectedInfra.includes(cat.name)
                      ? 'bg-white border-primary-200 shadow-sm dark:bg-primary-500/10 dark:border-primary-500/30'
                      : 'bg-transparent border-transparent hover:bg-white hover:shadow-sm dark:hover:bg-gray-700'
                  ]"
                >
                  <div class="flex items-center gap-2 sm:gap-3 overflow-hidden">
                    <div 
                      class="flex-shrink-0 w-2 h-2 sm:w-2.5 sm:h-2.5 rounded-full border border-gray-200 dark:border-gray-600 shadow-sm"
                      :style="{ backgroundColor: getInfraColor(cat.name) }"
                    ></div>
                    <span :class="['text-[9px] sm:text-[10px] font-bold uppercase truncate max-w-[100px] sm:max-w-[120px]', selectedInfra.includes(cat.name) ? 'text-primary-600 dark:text-primary-400' : 'text-gray-500 dark:text-gray-400']">
                      {{ cat.name }}
                    </span>
                  </div>
                  <UIcon v-if="selectedInfra.includes(cat.name)" name="i-heroicons-check" class="w-3 h-3 text-primary-500 flex-shrink-0" />
                </button>
              </div>
            </div>
          </div>

          <div 
            class="bg-gray-50 dark:bg-gray-800/50 rounded-xl border border-transparent hover:border-gray-200 dark:hover:border-gray-700 transition-all overflow-hidden"
          >
            <div 
                class="flex items-center justify-between px-2 sm:px-3 py-2 sm:py-2.5 cursor-pointer" 
                @click="!loadingStates.water && $emit('update:showWaterLevel', !showWaterLevel)"
                :class="{'opacity-75 cursor-wait': loadingStates.water}"
            >
              <div class="flex items-center gap-2 sm:gap-3 min-w-0 flex-1">
                <div :class="['w-7 h-7 sm:w-8 sm:h-8 rounded-lg flex items-center justify-center transition-colors flex-shrink-0', showWaterLevel ? 'bg-cyan-500/10 text-cyan-600' : 'bg-gray-100 text-gray-400']">
                  <UIcon v-if="loadingStates.water" name="i-heroicons-arrow-path" class="w-3.5 h-3.5 sm:w-4 sm:h-4 animate-spin" />
                  <UIcon v-else name="i-heroicons-presentation-chart-line" class="w-3.5 h-3.5 sm:w-4 sm:h-4" />
                </div>
                <div class="text-left min-w-0">
                  <div class="text-[10px] sm:text-[11px] font-bold text-gray-700 dark:text-gray-200 truncate">
                    Water Level
                    <span v-if="loadingStates.water" class="text-[8px] font-normal text-cyan-600 ml-1">(Memuat...)</span>
                  </div>
                  <div class="text-[8px] sm:text-[9px] text-gray-400 truncate">Tinggi & Status</div>
                </div>
              </div>
              <div class="relative inline-flex items-center cursor-pointer" @click.stop>
                <input type="checkbox" :checked="showWaterLevel" class="sr-only peer" @change="$emit('update:showWaterLevel', !showWaterLevel)" :disabled="loadingStates.water">
                <div class="w-8 h-4 bg-gray-200 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-3 after:w-3 after:transition-all peer-checked:bg-cyan-600"></div>
              </div>
            </div>
          </div>

          <div 
            class="flex items-center justify-between px-2 sm:px-3 py-2 sm:py-2.5 rounded-xl hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors cursor-pointer group" 
            @click="!loadingStates.das && $emit('update:showGroupDAS', !showGroupDAS)"
            :class="{'opacity-75 cursor-wait': loadingStates.das}"
          >
            <div class="flex items-center gap-2 sm:gap-3 min-w-0 flex-1">
              <div :class="['w-7 h-7 sm:w-8 sm:h-8 rounded-lg flex items-center justify-center transition-colors flex-shrink-0', showGroupDAS ? 'bg-orange-500/10 text-orange-600' : 'bg-gray-100 text-gray-400']">
                <UIcon v-if="loadingStates.das" name="i-heroicons-arrow-path" class="w-3.5 h-3.5 sm:w-4 sm:h-4 animate-spin" />
                <UIcon v-else name="i-heroicons-rectangle-group" class="w-3.5 h-3.5 sm:w-4 sm:h-4" />
              </div>
              <div class="text-left min-w-0">
                <div class="text-[10px] sm:text-[11px] font-bold text-gray-700 dark:text-gray-200 truncate">
                    Group DAS
                    <span v-if="loadingStates.das" class="text-[8px] font-normal text-orange-600 ml-1">(Memuat...)</span>
                </div>
                <div class="text-[8px] sm:text-[9px] text-gray-400 truncate">Zonasi area tangkapan air</div>
              </div>
            </div>
            <div class="relative inline-flex items-center cursor-pointer" @click.stop>
              <input type="checkbox" :checked="showGroupDAS" class="sr-only peer" @change="$emit('update:showGroupDAS', !showGroupDAS)" :disabled="loadingStates.das">
              <div class="w-8 h-4 bg-gray-200 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-3 after:w-3 after:transition-all peer-checked:bg-orange-600"></div>
            </div>
          </div>

          <div class="flex items-center justify-between px-2 sm:px-3 py-2 sm:py-2.5 rounded-xl hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors cursor-pointer group" @click="$emit('update:showRain', !showRain)">
            <div class="flex items-center gap-2 sm:gap-3 min-w-0 flex-1">
              <div :class="['w-7 h-7 sm:w-8 sm:h-8 rounded-lg flex items-center justify-center transition-colors flex-shrink-0', showRain ? 'bg-blue-500/10 text-blue-600' : 'bg-gray-100 text-gray-400']">
                <UIcon name="i-heroicons-cloud" class="w-3.5 h-3.5 sm:w-4 sm:h-4" />
              </div>
              <div class="text-left min-w-0">
                <div class="text-[10px] sm:text-[11px] font-bold text-gray-700 dark:text-gray-200 truncate">Cuaca</div>
                <div class="text-[8px] sm:text-[9px] text-gray-400 truncate">Curah hujan live</div>
              </div>
            </div>
            <div class="relative inline-flex items-center cursor-pointer" @click.stop>
              <input type="checkbox" :checked="showRain" class="sr-only peer" @change="$emit('update:showRain', !showRain)">
              <div class="w-8 h-4 bg-gray-200 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:rounded-full after:h-3 after:w-3 after:transition-all peer-checked:bg-blue-600"></div>
            </div>
          </div>

        </div>
      </div>
      
      <TideWidget />

    </nav>

    <div class="p-3 sm:p-4 mt-auto border-t border-gray-100 dark:border-gray-800 bg-gray-50/50 dark:bg-gray-800/30">
      <div class="grid grid-cols-2 gap-1.5 sm:gap-2">
         <button
            class="flex items-center justify-center gap-1 py-1.5 sm:py-2 px-2 sm:px-3 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 text-[9px] sm:text-[10px] font-bold hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors text-gray-600 dark:text-gray-300 shadow-sm"
            @click="handleUpdateLocation"
          >
            <UIcon :name="isLocating ? 'i-heroicons-arrow-path' : 'i-heroicons-map-pin'" :class="{'animate-spin': isLocating}" class="w-3 h-3 sm:w-3.5 sm:h-3.5 flex-shrink-0" />
            <span class="truncate">{{ isLocating ? 'Update...' : 'Lokasi Saya' }}</span>
          </button>
          
          <button
            class="flex items-center justify-center gap-1 py-1.5 sm:py-2 px-2 sm:px-3 rounded-lg bg-blue-600 border border-blue-500 text-[9px] sm:text-[10px] font-bold hover:bg-blue-700 transition-colors text-white shadow-sm shadow-blue-500/30 disabled:opacity-50 disabled:cursor-not-allowed"
            @click="$emit('recenter')"
            :disabled="!coords"
          >
            <UIcon name="i-heroicons-viewfinder-circle" class="w-3 h-3 sm:w-3.5 sm:h-3.5 flex-shrink-0" />
            <span class="truncate">Fokus Peta</span>
          </button>
      </div>
    </div>

  </aside>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import TideWidget from './TideWidget.vue';

const props = defineProps<{
  isOpen: boolean; 
  showBlok: boolean;
  showInfra: boolean;
  showRain: boolean;
  showWaterLevel: boolean;
  showGroupDAS: boolean;
  basemap: string;
  infraCategories: { name: string; count: number }[];
  selectedInfra: string[];
  showBmkg?: boolean;
  loadingBmkg?: boolean;
  // --- PROP UNTUK LOADING ---
  loadingStates?: {
     blok: boolean,
     infra: boolean,
     water: boolean,
     das: boolean
  }
}>()

// Default value untuk loadingStates jika undefined
const loadingStates = computed(() => props.loadingStates || { blok: false, infra: false, water: false, das: false })

const emit = defineEmits([
  'update:showBlok', 
  'update:showInfra', 
  'update:showRain', 
  'update:showGroupDAS',
  'update:showWaterLevel', 
  'update:basemap',
  'recenter', 
  'update:selectedInfra',
  'close'
])

const { coords, isLocating, updateLocation } = useLocation()

const handleUpdateLocation = async () => {
  await updateLocation()
  if(coords.value) { 
    emit('recenter') 
  }
}

const isAllInfraSelected = computed(() => {
  return props.infraCategories.length > 0 && 
         props.selectedInfra.length === props.infraCategories.length
})

const getInfraColor = (categoryName: string) => {
  const name = categoryName.toUpperCase()
  if (name.includes('JEMBATAN KAYU')) return '#59281E' 
  if (name.includes('PVC')) return '#06b6d4' 
  if (name.includes('NF')) return '#64748b' 
  if (name.includes('JEMBATAN')) return '#ef4444' 
  if (name.includes('GORONG')) return '#eab308'
  if (name.includes('GATE') || name.includes('PINTU')) return '#a855f7'
  return '#94a3b8' 
}

const toggleInfraCategory = (name: string) => {
  const newSelection = [...props.selectedInfra]
  if (newSelection.includes(name)) {
    newSelection.splice(newSelection.indexOf(name), 1)
  } else {
    newSelection.push(name)
  }
  emit('update:selectedInfra', newSelection)
}

const toggleAllInfra = () => {
  if (isAllInfraSelected.value) {
    emit('update:selectedInfra', [])
  } else {
    emit('update:selectedInfra', props.infraCategories.map(c => c.name))
  }
}
</script>

<style scoped>
/* Scrollbar yang lebih subtle */
.custom-scrollbar::-webkit-scrollbar { width: 4px; }
.custom-scrollbar::-webkit-scrollbar-track { background: transparent; }
.custom-scrollbar::-webkit-scrollbar-thumb { 
  background-color: rgba(100, 116, 139, 0.2); 
  border-radius: 20px; 
}

/* Animasi bayangan saat sidebar muncul */
.translate-x-0 {
  box-shadow: 20px 0 50px -12px rgb(0 0 0 / 0.15);
}

/* Peer classes untuk custom toggle (Tailwind) */
.peer:checked ~ .peer-checked\:bg-green-600 { background-color: #16a34a; }
.peer:checked ~ .peer-checked\:bg-primary-600 { background-color: #0284c7; }
.peer:checked ~ .peer-checked\:bg-cyan-600 { background-color: #0891b2; }
.peer:checked ~ .peer-checked\:bg-orange-600 { background-color: #ea580c; }
.peer:checked ~ .peer-checked\:bg-blue-600 { background-color: #2563eb; }
</style>