<script setup>
const props = defineProps({
  selectedMonth: { type: [Number, null], default: null },
  selectedYear: { type: [Number, null], default: null },
  monthList: { type: Array, required: true },
  yearList: { type: Array, required: true }
})

const emit = defineEmits(['update:selectedMonth', 'update:selectedYear'])
const isOpen = ref(false)

const toggleMenu = () => {
  isOpen.value = !isOpen.value
}

const reset = () => {
  emit('update:selectedMonth', null)
  emit('update:selectedYear', null)
  isOpen.value = false
}

const selectYear = (y) => emit('update:selectedYear', y)
const selectMonth = (m) => emit('update:selectedMonth', m)

const displayLabel = computed(() => {
  if (!props.selectedMonth || !props.selectedYear) return 'DEFAULT'
  const month = props.monthList.find(m => m.id === props.selectedMonth)
  return `${month?.name} ${props.selectedYear}`
})
</script>

<template>
  <div class="pointer-events-auto w-[200px] bg-white/90 dark:bg-gray-800/90 backdrop-blur-md rounded-xl shadow-lg border border-gray-200/50 dark:border-gray-700">
    <button @click="toggleMenu"
      class="w-full flex items-center justify-between px-3 py-2 text-[11px] font-black text-gray-800 dark:text-gray-200">
      <div class="text-left leading-none">
        <p class="text-[9px] text-gray-400 font-normal mb-1">PERIODE</p>
        <span :class="!selectedMonth ? 'text-blue-600' : 'text-green-600'">
          {{ displayLabel }}
        </span>
      </div>
      <UIcon name="i-heroicons-calendar-days" class="w-5 h-5" :class="selectedMonth ? 'text-green-600' : 'text-blue-600'" />
    </button>

    <div v-show="isOpen" class="p-3 border-t border-gray-200/50 dark:border-gray-700 space-y-3">
      <button @click="reset"
        class="w-full py-2 rounded-lg text-[10px] font-black uppercase tracking-wider transition-all border flex flex-col items-center justify-center gap-0.5"
        :class="!selectedMonth ? 'bg-blue-50 border-blue-200 text-blue-700' : 'bg-white dark:bg-gray-800 border-gray-200 text-gray-600 hover:bg-blue-50'">
        <div class="flex items-center gap-2">
          <UIcon name="i-heroicons-arrow-path" class="w-3 h-3" /> RESET TO DEFAULT
        </div>
      </button>

      <div class="relative flex py-1 items-center">
        <div class="flex-grow border-t border-gray-100 dark:border-gray-700"></div>
        <span class="flex-shrink mx-2 text-[8px] text-gray-400 font-bold uppercase">Filter per Bulan</span>
        <div class="flex-grow border-t border-gray-100 dark:border-gray-700"></div>
      </div>

      <div>
        <p class="text-[9px] font-black text-gray-400 mb-1.5 uppercase">Tahun</p>
        <div class="flex gap-1 overflow-x-auto pb-1 scrollbar-hide">
          <button v-for="y in yearList" :key="y" @click="selectYear(y)"
            :class="['px-3 py-1.5 rounded-md text-[10px] font-bold transition-all', selectedYear === y ? 'bg-green-600 text-white' : 'bg-gray-100 dark:bg-gray-700 text-gray-600']">
            {{ y }}
          </button>
        </div>
      </div>

      <div>
        <p class="text-[9px] font-black text-gray-400 mb-1.5 uppercase">Bulan</p>
        <div class="grid grid-cols-4 gap-1">
          <button v-for="m in monthList" :key="m.id" @click="selectMonth(m.id)"
            :class="['py-1 rounded-md text-[9px] font-bold transition-all', selectedMonth === m.id ? 'bg-green-600 text-white' : 'bg-gray-100 dark:bg-gray-700 text-gray-600']">
            {{ m.name }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>