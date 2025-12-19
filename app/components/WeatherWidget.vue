<script setup>
/* =========================
   CONFIG
========================= */
const config = {
  apiKey: '4a192ab87b2343ada7da03f7712b7988',
  baseUrl: 'https://api.openweathermap.org/data/2.5'
}

/* =========================
   GLOBAL LOCATION (READ ONLY)
========================= */
const { coords } = useLocation()

/* =========================
   FALLBACK CITY
========================= */
const fallbackCity = ref('Jakarta')

/* =========================
   QUERY PARAMS
========================= */
const queryParams = computed(() => ({
  appid: config.apiKey,
  units: 'metric',
  lang: 'id',
  ...(coords.value
    ? { lat: coords.value.lat, lon: coords.value.lng }
    : { q: fallbackCity.value }
  )
}))

/* =========================
   FETCH WEATHER
========================= */
const {
  data: current,
  error,
  pending
} = await useFetch(`${config.baseUrl}/weather`, {
  query: queryParams,
  watch: [queryParams]
})

const {
  data: forecastRaw,
  pending: forecastPending
} = await useFetch(`${config.baseUrl}/forecast`, {
  query: queryParams,
  watch: [queryParams]
})

/* =========================
   PROCESS FORECAST (3 DAYS)
========================= */
const forecastThreeDays = computed(() => {
  if (!forecastRaw.value?.list) return []

  const days = []
  const seenDates = new Set()
  const today = new Date().toISOString().split('T')[0]

  for (const item of forecastRaw.value.list) {
    const date = item.dt_txt.split(' ')[0]
    if (date !== today && !seenDates.has(date) && days.length < 3) {
      seenDates.add(date)
      days.push(item)
    }
  }
  return days
})

/* =========================
   HELPERS
========================= */
const formatDate = (dt) =>
  new Date(dt * 1000).toLocaleDateString('id-ID', {
    weekday: 'short',
    day: 'numeric'
  })

const isLoading = computed(() => pending.value || forecastPending.value)
</script>

<template>
  <div class="w-full max-w-[320px] font-sans">

    <!-- WEATHER CARD -->
    <UCard
      v-if="current && !error"
      class="relative overflow-hidden shadow-xl"
      :ui="{
        body: { padding: 'p-5' },
        rounded: 'rounded-3xl',
        background: 'bg-white dark:bg-slate-900',
        ring: 'ring-1 ring-slate-100 dark:ring-slate-800'
      }"
    >
      <!-- Header -->
      <div class="flex justify-between mb-4">
        <div>
          <div class="flex items-center gap-1.5">
            <h2 class="text-lg font-black truncate max-w-[140px]">
              {{ current.name }}
            </h2>
            <UIcon
              v-if="coords"
              name="i-heroicons-map-pin-20-solid"
              class="text-primary-500 w-4 h-4"
            />
          </div>
          <span class="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
            {{ formatDate(current.dt) }}
          </span>
        </div>

        <div class="text-right">
          <div class="flex items-start justify-end">
            <span class="text-3xl font-black">
              {{ Math.round(current.main.temp) }}
            </span>
            <span class="text-lg font-bold text-primary-500 mt-0.5">°C</span>
          </div>
          <p class="text-[10px] font-bold text-primary-500 uppercase">
            {{ current.weather[0].description }}
          </p>
        </div>
      </div>

      <!-- Icon -->
      <div class="flex justify-center my-4">
        <img
          :src="`https://openweathermap.org/img/wn/${current.weather[0].icon}@4x.png`"
          class="w-28 h-28 drop-shadow-lg select-none"
        />
      </div>

      <!-- Stats -->
      <div class="grid grid-cols-2 gap-3 mb-5">
        <div
          class="flex items-center gap-3 p-3 rounded-2xl border
                 bg-slate-50 dark:bg-slate-800/50
                 border-slate-100 dark:border-slate-800"
        >
          <div class="w-8 h-8 rounded-full bg-blue-100 dark:bg-blue-900/30 flex items-center justify-center">
            <UIcon name="i-lucide-droplet" class="text-blue-500 w-4 h-4" />
          </div>
          <div>
            <p class="text-[9px] font-bold text-slate-400 uppercase">Lembap</p>
            <p class="text-xs font-black">{{ current.main.humidity }}%</p>
          </div>
        </div>

        <div
          class="flex items-center gap-3 p-3 rounded-2xl border
                 bg-slate-50 dark:bg-slate-800/50
                 border-slate-100 dark:border-slate-800"
        >
          <div class="w-8 h-8 rounded-full bg-teal-100 dark:bg-teal-900/30 flex items-center justify-center">
            <UIcon name="i-lucide-wind" class="text-teal-500 w-4 h-4" />
          </div>
          <div>
            <p class="text-[9px] font-bold text-slate-400 uppercase">Angin</p>
            <p class="text-xs font-black">
              {{ Math.round(current.wind.speed) }} m/s
            </p>
          </div>
        </div>
      </div>

      <!-- Forecast -->
      <div class="pt-4 border-t border-slate-100 dark:border-slate-800">
        <h4 class="text-[10px] font-black text-slate-400 uppercase tracking-[0.2em] text-center mb-4">
          Ramalan 3 Hari
        </h4>

        <div class="space-y-3">
          <div
            v-for="day in forecastThreeDays"
            :key="day.dt"
            class="flex items-center justify-between"
          >
            <span class="text-xs font-bold uppercase text-slate-500">
              {{ formatDate(day.dt).split(',')[0] }}
            </span>

            <img
              :src="`https://openweathermap.org/img/wn/${day.weather[0].icon}.png`"
              class="w-8 h-8"
            />

            <span class="text-sm font-black">
              {{ Math.round(day.main.temp) }}°
            </span>
          </div>
        </div>
      </div>
    </UCard>

    <!-- LOADING / ERROR -->
    <UCard
      v-else
      class="h-[360px] flex items-center justify-center rounded-3xl"
    >
      <div v-if="error" class="text-center px-4">
        <UIcon
          name="i-heroicons-exclamation-triangle-20-solid"
          class="w-10 h-10 text-red-500 mx-auto mb-3"
        />
        <p class="text-sm font-black">Cuaca tidak tersedia</p>
      </div>

      <div v-else class="text-center">
        <div
          class="w-10 h-10 border-4 border-primary-500/20
                 border-t-primary-500 rounded-full animate-spin mx-auto mb-3"
        ></div>
        <p class="text-[10px] font-black text-slate-400 uppercase tracking-widest animate-pulse">
          Memuat Cuaca
        </p>
      </div>
    </UCard>

  </div>
</template>
