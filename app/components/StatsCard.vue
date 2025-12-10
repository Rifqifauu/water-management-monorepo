<template>
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 p-6">
    
    <div 
      v-for="(item, index) in stats" 
      :key="index"
      :class="item.color"
      class="group relative overflow-hidden rounded-2xl p-8 text-white shadow-lg flex flex-col justify-between transition-transform duration-300 hover:-translate-y-1 hover:shadow-2xl"
    >
      <div class="pointer-events-none absolute top-0 left-[-150%] h-full w-3/4 z-10 transform bg-gradient-to-r from-transparent via-white/30 to-transparent transition-all duration-[1000ms] ease-in-out group-hover:left-[150%]"></div>
      
      <div 
        class="absolute top-5 right-5 opacity-40 mix-blend-overlay group-hover:opacity-60 transition-opacity z-20"
        v-html="item.icon"
      ></div>

      <div class="relative z-20"> 
<h3 
  class="text-sm font-bold uppercase tracking-widest opacity-80 drop-shadow-sm" 
  v-html="item.title"
></h3>      </div>

      <div class="mt-6 relative z-20">
        <span class="block text-5xl font-black tracking-tight mb-2 drop-shadow-md">{{ item.count }}</span>
        <span class="text-sm font-medium opacity-80 drop-shadow-sm">{{ item.subtitle }}</span>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref } from 'vue'


const IconSquare = `<svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"/></svg>`
const IconStar = `<svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>`
const IconHeart = `<svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>`
const IconCircle = `<svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/></svg>`

const stats = ref([
  {
    title: 'TOTAL RECORDS',
    count: 0, 
    subtitle: 'All time entries',
    color: 'bg-gradient-to-br from-emerald-400 to-emerald-700 ring-1 ring-emerald-300/40',
    icon: IconSquare
  },
  {
    title: 'GOOD CONDITION',
    count: 0,
    subtitle: 'Optimal status',
    color: 'bg-gradient-to-br from-amber-300 to-orange-600 ring-1 ring-orange-300/40', 
    icon: IconStar
  },
  {
    title: 'NEEDS <br> MAINTENANCE',
    count: 0,
    subtitle: 'Requires attention',
    color: 'bg-gradient-to-br from-rose-400 to-red-700 ring-1 ring-red-300/40',
    icon: IconHeart
  },
  {
    title: 'CRITICAL ISSUES',
    count: 0,
    subtitle: 'Urgent action needed',
    color: 'bg-gradient-to-br from-slate-500 to-slate-800 ring-1 ring-slate-400/40',
    icon: IconCircle
  }
])
</script>