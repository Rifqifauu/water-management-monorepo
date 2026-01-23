<template>
  <div class="bg-white rounded-xl md:rounded-[1rem] shadow-sm border border-slate-200 overflow-hidden w-full">
    <div class="px-4 md:px-8 py-4 md:py-6 border-b border-slate-100 flex justify-between items-center">
      <div>
        <h3 class="font-black text-slate-800 uppercase tracking-wider text-xs md:text-sm text-left">Recent Activities</h3>
        <p class="text-[9px] md:text-[10px] text-slate-400 font-bold uppercase tracking-widest text-left">Live Monitoring Logs</p>
      </div>
    </div>

    <div class="w-full">
      <div v-if="isLoading" class="px-4 py-12 text-center">
        <div class="flex flex-col items-center justify-center">
          <div class="w-6 h-6 border-4 border-blue-600 border-t-transparent rounded-full animate-spin mb-2"></div>
          <span class="text-[9px] text-slate-400 font-black uppercase tracking-widest">Loading...</span>
        </div>
      </div>

      <div v-else-if="activities.length === 0" class="px-4 py-12 text-center text-slate-400 text-xs font-bold uppercase tracking-wider">
        No activities found
      </div>

      <div class="hidden md:block overflow-x-auto">
        <table class="w-full text-left">
          <thead>
            <tr class="bg-slate-50/50 text-slate-400 text-[10px] font-black uppercase tracking-widest">
              <th class="px-8 py-4 border-b border-slate-100">Waktu</th>
              <th class="px-8 py-4 border-b border-slate-100">Kategori</th>
              <th class="px-8 py-4 border-b border-slate-100">Lokasi</th>
              <th class="px-8 py-4 border-b border-slate-100 text-center">Skor</th>
            </tr>
          </thead>
          <tbody class="text-sm divide-y divide-slate-50">
            <tr v-for="item in activities" :key="item.type + item.id" class="group hover:bg-slate-50 transition-colors">
              <td class="px-8 py-5 text-[11px] font-bold text-slate-400 uppercase italic whitespace-nowrap">{{ item.tanggal }}</td>
              <td class="px-8 py-5">
                <span class="text-[9px] font-black uppercase bg-slate-100 px-2 py-1 rounded text-slate-500 tracking-tighter">{{ item.type }}</span>
              </td>
              <td class="px-8 py-5 font-black text-slate-800 uppercase text-xs tracking-tight">{{ item.lokasi }}</td>
              <td class="px-8 py-5 text-center">
                <span class="px-3 py-1 rounded-lg text-xs font-black border inline-block" :class="getScoreColor(item.skor)">{{ item.skor }}</span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="md:hidden divide-y divide-slate-100">
        <div v-for="item in activities" :key="'mob-' + item.type + item.id" class="p-4 active:bg-slate-50">
          <div class="flex justify-between items-start mb-2">
            <div>
              <span class="text-[8px] font-black uppercase bg-slate-100 px-2 py-0.5 rounded text-slate-500 tracking-wider">
                {{ item.type }}
              </span>
              <h4 class="font-black text-slate-800 uppercase text-xs mt-1">{{ item.lokasi }}</h4>
            </div>
            <div :class="getScoreColor(item.skor)" class="px-2 py-1 rounded-lg text-[10px] font-black border">
              {{ item.skor }}
            </div>
          </div>
          <div class="text-[9px] font-bold text-slate-400 uppercase italic">
            {{ item.tanggal }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>

const activities = ref([])
const isLoading = ref(true)

const getScoreColor = (s) => {
  const score = parseFloat(s)
  if (score >= 2.5) return 'bg-emerald-50 text-emerald-600 border-emerald-100'
  if (score >= 1.5) return 'bg-amber-50 text-amber-600 border-amber-100'
  return 'bg-rose-50 text-rose-600 border-rose-100'
}

const fetchData = async () => {
  isLoading.value = true
  try {
    const response = await useApi('recent-activities')
    
    activities.value = response.data || response
  } catch (error) {
    console.error("Gagal mengambil aktivitas terbaru:", error)
  } finally {
    isLoading.value = false
  }
}

onMounted(() => {
  fetchData()
})
</script>