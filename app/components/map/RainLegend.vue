<template>
  <div class="absolute bottom-6 left-6 z-[1000] bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl p-5 rounded-2xl border border-white/20 dark:border-gray-800/50 shadow-2xl min-w-[240px] transition-all hover:shadow-3xl hover:scale-[1.02]">
    <div class="flex flex-col gap-4">
      <!-- Header -->
      <div class="flex items-center gap-3">
        <div class="relative">
          <div class="w-3 h-3 rounded-full bg-purple-500 animate-pulse"></div>
          <div class="absolute inset-0 w-3 h-3 rounded-full bg-purple-400 animate-ping opacity-75"></div>
        </div>
        <h4 class="text-xs font-bold uppercase tracking-wider text-gray-600 dark:text-gray-300">
          Intensitas Hujan
        </h4>
      </div>
      
      <!-- Gradient Bar -->
      <div class="space-y-2">
        <div class="h-4 w-full bg-gradient-to-r from-transparent via-[#9370DB] via-[#6A5ACD] via-[#4169E1] to-[#0000CD] rounded-lg shadow-inner border border-gray-200 dark:border-gray-700"></div>
        
        <!-- Labels -->
        <div class="flex justify-between text-[10px] font-semibold text-gray-500 dark:text-gray-400 uppercase tracking-tight px-1">
          <span class="flex items-center gap-1">
            <UIcon name="i-heroicons-cloud" class="w-3 h-3 text-gray-400" />
            Tidak Ada
          </span>
          <span class="flex items-center gap-1">
            <UIcon name="i-heroicons-cloud-20-solid" class="w-3 h-3 text-purple-500" />
            Ringan
          </span>
          <span class="flex items-center gap-1">
            <UIcon name="i-heroicons-bolt" class="w-3 h-3 text-blue-600" />
            Lebat
          </span>
        </div>
      </div>

      <!-- Info Text -->
      <div class="pt-2 border-t border-gray-200 dark:border-gray-800">
        <p class="text-[9px] text-gray-500 dark:text-gray-400 leading-relaxed">
          Data curah hujan real-time dari OpenWeatherMap
        </p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

</script>