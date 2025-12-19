<template>
  <div class="flex min-h-screen bg-white dark:bg-gray-900 transition-colors duration-300 relative">
    
    <div 
      v-if="isOpen" 
      class="fixed inset-0 bg-gray-900/50 backdrop-blur-sm z-[60] lg:hidden"
      @click="isOpen = false"
    ></div>

    <Sidebar 
      :class="[
        isOpen ? 'translate-x-0' : '-translate-x-full',
        'fixed inset-y-0 left-0 z-[70] w-72 bg-white dark:bg-gray-900 shadow-xl transition-transform duration-300 ease-in-out lg:static lg:translate-x-0 lg:flex'
      ]" 
    />
    
    <div class="flex-1 flex flex-col min-w-0">
      <header class="sticky top-0 z-50 w-full border-b border-gray-200 dark:border-gray-800 bg-white/80 dark:bg-gray-900/80 backdrop-blur-md">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex justify-between items-center h-20">
            <div class="flex items-center gap-4">
              <UButton
                icon="i-heroicons-bars-3-20-solid"
                color="gray"
                variant="ghost"
                class="lg:hidden rounded-full"
                @click="isOpen = !isOpen"
              />

              <div>
                <h1 class="text-xl md:text-2xl font-bold text-green-900 dark:text-green-400 leading-tight">
                  Web GIS & Water Management
                </h1>
                <p class="text-xs md:text-md text-gray-500 dark:text-gray-400">
                  Monitoring & Predictive Analytics System
                </p>
              </div>
            </div>

            <div class="flex items-center gap-4">
              <div v-if="weather" class="hidden md:flex items-center gap-3 px-4 py-2 bg-gray-50 dark:bg-gray-800/50 rounded-2xl border border-gray-100 dark:border-gray-700">
                <div class="text-right">
                  <p class="text-[10px] font-bold uppercase text-gray-400 leading-none mb-1">Kondisi Saat Ini</p>
                  <p class="text-sm font-bold text-gray-700 dark:text-gray-200">
                    {{ weather.temp }}°C <span class="text-gray-400 font-medium ml-1">| {{ weather.description }}</span>
                  </p>
                </div>
                <img 
                  :src="`https://openweathermap.org/img/wn/${weather.icon}@2x.png`" 
                  alt="Weather Icon"
                  class="w-10 h-10 -my-2"
                />
              </div>

              <div class="h-8 w-[1px] bg-gray-200 dark:bg-gray-800 hidden md:block" />

              <ClientOnly>
                <UButton 
                  :icon="isDark ? 'i-heroicons-moon-20-solid' : 'i-heroicons-sun-20-solid'"
                  color="gray" 
                  variant="ghost" 
                  aria-label="Toggle dark mode"
                  class="rounded-full transition-transform active:scale-95"
                  @click="isDark = !isDark" 
                />
                <template #fallback>
                  <div class="w-8 h-8" />
                </template>
              </ClientOnly>
            </div>
          </div>
        </div>
      </header>

      <main class="p-6 overflow-y-auto">
        <div class="max-w-7xl mx-auto">
          <slot />
        </div>
      </main>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'

const colorMode = useColorMode()
// Ganti isSidebarHidden dengan ref isOpen
const isOpen = ref(false)

const { coords } = useLocation()

const weather = ref<{ temp: number, description: string, icon: string } | null>(null)

const isDark = computed({
  get() { return colorMode.value === 'dark' },
  set() { colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark' }
})

// Fungsi ambil data cuaca
const fetchWeather = async (lat: number, lng: number) => {
  try {
    const API_KEY = '4a192ab87b2343ada7da03f7712b7988' 
    const res = await $fetch<any>(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&units=metric&lang=id&appid=${API_KEY}`)
    
    weather.value = {
      temp: Math.round(res.main.temp),
      description: res.weather[0].description,
      icon: res.weather[0].icon
    }
  } catch (err) {
    console.error('Gagal mengambil cuaca:', err)
  }
}

watch(() => coords.value, (newCoords) => {
  if (newCoords?.lat) {
    fetchWeather(newCoords.lat, newCoords.lng)
  }
}, { immediate: true, deep: true })

// Menutup sidebar otomatis jika route berubah (Opsional)
const route = useRoute()
watch(() => route.fullPath, () => {
  isOpen.value = false
})
</script>