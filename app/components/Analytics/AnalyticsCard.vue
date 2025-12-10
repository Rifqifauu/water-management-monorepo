<template>
  <div class="grid grid-cols-1 md:grid-cols-3 gap-6 p-6 0">
    
    <div 
      v-for="(item, index) in stats" 
      :key="index"
      :class="item.color"
      class="group relative overflow-hidden rounded-2xl p-4 shadow-lg flex text-black flex-col justify-between transition-transform duration-300 hover:-translate-y-1 hover:shadow-2xl"
    >
      <div class="pointer-events-none absolute top-0 left-[-150%] h-full w-3/4 z-10 transform  bg-gradient-to-r from-transparent via-white/30 to-transparent transition-all duration-[1000ms] ease-in-out group-hover:left-[150%]"></div>
      <div class="absolute top-5 right-5 opacity-40 mix-blend-overlay group-hover:opacity-60 transition-opacity">
         <component :is="item.icon" class="w-10 h-10" />
      </div>

      <div class="relative z-20"> <h3 class="text-sm text-black font-bold uppercase tracking-widest opacity-80 drop-shadow-sm">{{ item.title }}</h3>
      </div>

      <div class="mt-6 relative z-20">
        <span class="block text-4xl font-black tracking-tight mb-2 drop-shadow-md">{{ item.item }}</span>
        <span class="text-sm  font-medium opacity-80 drop-shadow-sm">{{ item.subtitle }}</span>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref } from 'vue'


const stats = ref([
  {
    title: 'Total Infrastructure',
    item: 0, 
    subtitle: 'entries recorded',
  },
  {
    title: 'Total Water Level',
    item: 0,
    subtitle: 'measurements taken',
  },
  {
    title: 'Average Condition',
    item: 'Good',
    subtitle: 'overall status',
  },

])
onMounted(() => {

  
})
</script>