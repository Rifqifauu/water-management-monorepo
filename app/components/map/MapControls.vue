<template>
  <div class="absolute top-24 left-6 z-[1000] flex flex-col gap-3">
    <!-- Recenter Button -->
    <button
      @click="$emit('recenter')"
      :disabled="!coords?.lat"
      class="group bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl hover:bg-primary/10 dark:hover:bg-primary/20 disabled:opacity-50 disabled:cursor-not-allowed p-4 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all hover:shadow-2xl hover:scale-110 active:scale-95"
      :class="coords?.lat ? 'cursor-pointer' : ''"
    >
      <UIcon 
        name="i-lucide-crosshair" 
        class="w-5 h-5 text-gray-700 dark:text-gray-200 group-hover:text-primary transition-colors" 
      />
    </button>

    <!-- Toggle Rain Overlay -->
    <button
      @click="$emit('toggle-rain')"
      class="group bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl hover:bg-blue-500/10 dark:hover:bg-blue-500/20 p-4 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all hover:shadow-2xl hover:scale-110 active:scale-95"
    >
      <UIcon 
        :name="showRainOverlay ? 'i-lucide-cloud-rain' : 'i-lucide-cloud-off'" 
        class="w-5 h-5 transition-colors"
        :class="showRainOverlay ? 'text-blue-500' : 'text-gray-400'"
      />
    </button>

    <!-- Zoom Info Badge -->
    <div v-if="coords?.lat" class="bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl px-3 py-2 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl">
      <div class="flex items-center gap-2">
        <UIcon name="i-heroicons-signal" class="w-3 h-3 text-green-500" />
        <span class="text-[10px] font-bold text-gray-600 dark:text-gray-300 uppercase tracking-wider">
          GPS Aktif
        </span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  coords: any
  showRainOverlay: boolean
}>()

defineEmits<{
  recenter: []
  'toggle-rain': []
}>()
</script>