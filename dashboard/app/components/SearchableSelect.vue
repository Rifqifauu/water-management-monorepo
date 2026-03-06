<template>
  <div class="relative" ref="target">
    <div 
      @click="toggleDropdown"
      :class="[
        'w-full px-4 py-3 bg-gray-50 border rounded-xl flex items-center justify-between cursor-pointer transition-all',
        isOpen ? 'ring-2 ring-blue-500 border-blue-500 bg-white' : 'border-gray-300',
        disabled ? 'bg-gray-200 cursor-not-allowed text-gray-400' : 'hover:bg-white hover:border-blue-400'
      ]"
    >
      <span v-if="selectedLabel" class="font-medium text-gray-700 truncate">
        {{ selectedLabel }}
      </span>
      <span v-else class="text-gray-400 font-medium">
        {{ placeholder }}
      </span>
      
      <svg class="w-5 h-5 text-gray-500 transition-transform duration-200" :class="{ 'rotate-180': isOpen }" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
      </svg>
    </div>

    <transition
      enter-active-class="transition ease-out duration-100"
      enter-from-class="transform opacity-0 scale-95"
      enter-to-class="transform opacity-100 scale-100"
      leave-active-class="transition ease-in duration-75"
      leave-from-class="transform opacity-100 scale-100"
      leave-to-class="transform opacity-0 scale-95"
    >
      <div v-if="isOpen && !disabled" class="absolute z-50 mt-2 w-full bg-white rounded-xl shadow-xl border border-gray-100 overflow-hidden">
        
        <div class="p-2 border-b border-gray-100 bg-gray-50">
          <input 
            ref="searchInput"
            v-model="searchQuery"
            type="text" 
            class="w-full px-3 py-2 bg-white border border-gray-200 rounded-lg text-sm focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500"
            placeholder="Ketik untuk mencari..."
            @click.stop
          >
        </div>

        <ul class="max-h-60 overflow-y-auto custom-scrollbar">
          <li 
            v-for="(option, index) in filteredOptions" 
            :key="index"
            @click="selectOption(option)"
            class="px-4 py-3 text-sm text-gray-700 hover:bg-blue-50 hover:text-blue-700 cursor-pointer border-b border-gray-50 last:border-0 transition-colors"
            :class="{'bg-blue-50 text-blue-800 font-bold': isSelected(option)}"
          >
            {{ getLabel(option) }}
          </li>
          
          <li v-if="filteredOptions.length === 0" class="px-4 py-4 text-sm text-gray-400 text-center italic">
            Tidak ditemukan "{{ searchQuery }}"
          </li>
        </ul>
      </div>
    </transition>
  </div>
</template>

<script setup>
import { ref, computed, watch, nextTick, onMounted, onUnmounted } from 'vue'

const props = defineProps({
  modelValue: [String, Number], // Value yang disimpan (v-model)
  options: { type: Array, required: true }, // Array data
  placeholder: { type: String, default: 'Pilih data' },
  disabled: { type: Boolean, default: false },
  // Kalau datanya Object, key mana yang mau ditampilkan & disimpan?
  labelKey: { type: String, default: '' }, 
  valueKey: { type: String, default: '' }
})

const emit = defineEmits(['update:modelValue', 'change'])

const isOpen = ref(false)
const searchQuery = ref('')
const searchInput = ref(null)
const target = ref(null)

// Helper: Ambil text label dari opsi (bisa string biasa atau object)
const getLabel = (option) => {
  if (typeof option === 'object' && props.labelKey) return option[props.labelKey]
  return option
}

// Helper: Ambil value unik dari opsi
const getValue = (option) => {
  if (typeof option === 'object' && props.valueKey) return option[props.valueKey]
  return option
}

// Teks yang muncul di kotak utama saat terpilih
const selectedLabel = computed(() => {
  if (!props.modelValue) return ''
  const found = props.options.find(opt => getValue(opt) === props.modelValue)
  return found ? getLabel(found) : props.modelValue
})

// Filter logic
const filteredOptions = computed(() => {
  if (!searchQuery.value) return props.options
  const query = searchQuery.value.toLowerCase()
  return props.options.filter(opt => 
    String(getLabel(opt)).toLowerCase().includes(query)
  )
})

const isSelected = (option) => getValue(option) === props.modelValue

const toggleDropdown = () => {
  if (props.disabled) return
  isOpen.value = !isOpen.value
  if (isOpen.value) {
    searchQuery.value = '' // Reset search saat dibuka
    nextTick(() => searchInput.value?.focus())
  }
}

const selectOption = (option) => {
  emit('update:modelValue', getValue(option))
  emit('change', getValue(option)) // Emit event extra kalau butuh trigger function lain
  isOpen.value = false
}

// Tutup dropdown kalau klik di luar
const handleClickOutside = (event) => {
  if (target.value && !target.value.contains(event.target)) {
    isOpen.value = false
  }
}

onMounted(() => document.addEventListener('click', handleClickOutside))
onUnmounted(() => document.removeEventListener('click', handleClickOutside))
</script>

<style scoped>
/* Opsional: Style scrollbar biar cantik */
.custom-scrollbar::-webkit-scrollbar { width: 6px; }
.custom-scrollbar::-webkit-scrollbar-track { background: #f1f1f1; }
.custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }
.custom-scrollbar::-webkit-scrollbar-thumb:hover { background: #94a3b8; }
</style>