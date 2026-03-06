<script setup>
const props = defineProps({
  modelValue: { type: Array, default: () => ['All'] },
  afdelingList: { type: Array, default: () => [] }
})

const emit = defineEmits(['update:modelValue'])
const isOpen = ref(false)

const toggleMenu = () => {
  isOpen.value = !isOpen.value
}

const toggleAfdeling = (name) => {
  let current = [...props.modelValue]
  if (name === 'All') {
    current = ['All']
  } else {
    current = current.filter(item => item !== 'All')
    if (current.includes(name)) {
      current = current.filter(item => item !== name)
    } else {
      current.push(name)
    }
        if (current.length === 0) current = ['All']
  }
  emit('update:modelValue', current)
}
</script>

<template>
  <div class="pointer-events-auto w-[180px] bg-white/90 dark:bg-gray-800/90 backdrop-blur-md rounded-xl shadow-lg border border-gray-200/50 dark:border-gray-700">
    <button @click="toggleMenu"
      class="w-full flex items-center justify-between px-3 py-2 text-[11px] font-black text-gray-800 dark:text-gray-200">
      <span>AFDELING</span>
      <UIcon name="i-heroicons-chevron-down" :class="isOpen ? 'rotate-180' : ''" class="transition-transform" />
    </button>
    
    <div v-show="isOpen" class="p-2 border-t border-gray-200/50 dark:border-gray-700 grid grid-cols-2 gap-1.5 max-h-[150px] overflow-y-auto">
      <button @click="toggleAfdeling('All')"
        :class="['col-span-2 py-1.5 rounded-md text-[10px] font-bold transition', modelValue.includes('All') ? 'bg-green-600 text-white' : 'bg-gray-100 dark:bg-gray-700 text-gray-600 dark:text-gray-300 hover:bg-gray-200']">
        SEMUA
      </button>
      
      <button v-for="afd in afdelingList" :key="afd.name" @click="toggleAfdeling(afd.name)"
        :class="['py-1.5 rounded-md text-[10px] font-bold transition', modelValue.includes(afd.name) ? 'bg-green-600 text-white' : 'bg-gray-100 dark:bg-gray-700 text-gray-600 dark:text-gray-300 hover:bg-gray-200']">
        AFD {{ afd.name }}
      </button>
    </div>
  </div>
</template>