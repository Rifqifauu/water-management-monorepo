<template>
  <div class="absolute top-24 left-6 z-[1000] flex flex-col gap-3">
    
    <button
      @click="$emit('change-basemap', basemap === 'street' ? 'satellite' : 'street')"
      class="group relative bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl hover:bg-emerald-500/10 dark:hover:bg-emerald-500/20 p-4 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all hover:shadow-2xl hover:scale-110 active:scale-95"
    >
      <UIcon 
        :name="basemap === 'street' ? 'i-lucide-map' : 'i-lucide-satellite'" 
        class="w-5 h-5 transition-colors"
        :class="basemap === 'satellite' ? 'text-emerald-500' : 'text-gray-700 dark:text-gray-200'"
      />
      <span class="absolute left-16 bg-slate-900 text-white text-[10px] px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap pointer-events-none z-50">
        Mode Peta
      </span>
    </button>

    <button
      @click="$emit('toggle-blok')"
      class="group relative bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl hover:bg-green-500/10 dark:hover:bg-green-500/20 p-4 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all hover:shadow-2xl hover:scale-110 active:scale-95"
    >
      <UIcon 
        :name="showBlok ? 'i-lucide-layout-grid' : 'i-lucide-layout-grid'" 
        class="w-5 h-5 transition-colors"
        :class="showBlok ? 'text-green-600' : 'text-gray-400'"
      />
      <div v-if="!showBlok" class="absolute top-3 right-3 w-2 h-2 bg-gray-400 rounded-full border border-white"></div>
      
      <span class="absolute left-16 bg-slate-900 text-white text-[10px] px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap pointer-events-none z-50">
        {{ showBlok ? 'Sembunyikan Blok' : 'Tampilkan Blok' }}
      </span>
    </button>

    <button
      @click="$emit('toggle-infra')"
      class="group relative bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl hover:bg-orange-500/10 dark:hover:bg-orange-500/20 p-4 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all hover:shadow-2xl hover:scale-110 active:scale-95"
    >
      <UIcon 
        name="i-lucide-wrench" 
        class="w-5 h-5 transition-colors"
        :class="showInfra ? 'text-orange-500' : 'text-gray-400'"
      />
      <span class="absolute left-16 bg-slate-900 text-white text-[10px] px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap pointer-events-none z-50">
        {{ showInfra ? 'Sembunyikan Infra' : 'Tampilkan Infra' }}
      </span>
    </button>

    <button
      @click="$emit('toggle-rain')"
      class="group relative bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl hover:bg-blue-500/10 dark:hover:bg-blue-500/20 p-4 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all hover:shadow-2xl hover:scale-110 active:scale-95"
    >
      <UIcon 
        :name="showRainOverlay ? 'i-lucide-cloud-rain' : 'i-lucide-cloud-off'" 
        class="w-5 h-5 transition-colors"
        :class="showRainOverlay ? 'text-blue-500' : 'text-gray-400'"
      />
      <span class="absolute left-16 bg-slate-900 text-white text-[10px] px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap pointer-events-none z-50">
        Cuaca
      </span>
    </button>

    <button
      @click="$emit('recenter')"
      :disabled="!coords?.lat"
      class="group relative bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl hover:bg-primary/10 dark:hover:bg-primary/20 disabled:opacity-50 disabled:cursor-not-allowed p-4 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all hover:shadow-2xl hover:scale-110 active:scale-95"
    >
      <UIcon 
        name="i-lucide-crosshair" 
        class="w-5 h-5 text-gray-700 dark:text-gray-200 group-hover:text-primary transition-colors" 
      />
      <span class="absolute left-16 bg-slate-900 text-white text-[10px] px-2 py-1 rounded opacity-0 group-hover:opacity-100 transition-opacity whitespace-nowrap pointer-events-none z-50">
        Lokasi Saya
      </span>
    </button>

    <div v-if="coords?.lat" class="bg-white/90 dark:bg-gray-950/90 backdrop-blur-xl px-3 py-2 rounded-xl border border-white/20 dark:border-gray-800/50 shadow-xl transition-all animate-fade-in">
      <div class="flex items-center gap-2">
        <div class="w-1.5 h-1.5 rounded-full bg-green-500 animate-pulse"></div>
        <span class="text-[10px] font-bold text-gray-600 dark:text-gray-300 uppercase tracking-wider">
          GPS Aktif
        </span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
// UPDATE PROPS: Menambahkan showBlok dan showInfra
defineProps<{
  coords: any
  showRainOverlay: boolean
  basemap: string
  showBlok: boolean   // <-- Baru
  showInfra: boolean  // <-- Baru
}>()

// UPDATE EMITS: Menambahkan event toggle-blok dan toggle-infra
defineEmits<{
  recenter: []
  'toggle-rain': []
  'change-basemap': [value: string]
  'toggle-blok': []   // <-- Baru
  'toggle-infra': []  // <-- Baru
}>()
</script>