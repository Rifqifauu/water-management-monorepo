<template>
  <aside
    class="flex flex-col w-72 min-h-screen bg-white border-r border-gray-200 dark:bg-gray-900 dark:border-gray-800"
  >
    <div class="flex items-center h-16 px-6 border-b border-transparent">
      <div class="flex items-center gap-2">
        <div class="w-8 h-8 rounded-lg bg-primary-500 flex items-center justify-center">
          <UIcon name="i-heroicons-beaker-20-solid" class="w-5 h-5 text-white" />
        </div>
        <span class="text-sm font-black uppercase tracking-tighter text-gray-900 dark:text-white">
          Water<span class="text-primary-500">System</span>
        </span>
      </div>
    </div>

    <nav class="flex-1 px-4 py-4 space-y-1 overflow-y-auto">
      <div class="text-xs font-semibold text-gray-400 uppercase px-2 py-2 tracking-wider">
        Menu Utama
      </div>
      </nav>

    <div class="p-4 mt-auto border-t border-gray-100 dark:border-gray-800 bg-gray-50/50 dark:bg-gray-800/30">
      
      <div class="mb-4 overflow-hidden rounded-xl border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-800 shadow-sm">
        <div class="p-3">
          <div class="flex items-center justify-between mb-2">
            <span class="text-[10px] font-bold uppercase tracking-wider text-gray-400">
              Koordinat Aktif
            </span>
            <div v-if="coords" class="w-2 h-2 rounded-full bg-green-500 animate-pulse" />
          </div>
          
          <div class="font-mono text-[11px] text-gray-600 dark:text-gray-300 bg-gray-50 dark:bg-gray-900/50 p-2 rounded-md border border-gray-100 dark:border-gray-800">
            <template v-if="coords">
              <div class="flex justify-between">
                <span>LAT:</span> <span>{{ coords.lat.toFixed(6) }}</span>
              </div>
              <div class="flex justify-between">
                <span>LNG:</span> <span>{{ coords.lng.toFixed(6) }}</span>
              </div>
            </template>
            <span v-else class="italic text-gray-400">Lokasi belum terdeteksi</span>
          </div>
        </div>

        <UButton
          block
          :loading="isLocating"
          variant="ghost"
          color="primary"
          class="rounded-none border-t border-gray-100 dark:border-gray-800 py-2.5 text-xs"
          @click="updateLocation"
        >
          <template #leading>
            <UIcon :name="isLocating ? 'i-heroicons-arrow-path' : 'i-heroicons-map-pin'" 
                   :class="{'animate-spin': isLocating}" 
                   class="w-4 h-4" />
          </template>
          {{ isLocating ? 'Sinkronisasi...' : 'Update Lokasi' }}
        </UButton>
      </div>

      <div class="rounded-xl overflow-hidden">
        <WeatherWidget />
      </div>

    </div>
  </aside>
</template>

<script setup lang="ts">
// Pastikan composable useLocation sudah menangani error handling
const { coords, isLocating, updateLocation } = useLocation()
</script>