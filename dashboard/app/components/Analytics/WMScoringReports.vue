<template>
  <div class="w-full mt-6 px-3 md:px-0 max-w-[1250px] mx-auto pb-20 font-sans text-blue-950">

    <div class="bg-white p-4 md:p-6 rounded-2xl md:rounded-[2rem] border-2 border-blue-100 shadow-xl shadow-blue-900/5 mb-6">
      <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 mb-5">
        <h3 class="text-[10px] md:text-xs font-black text-blue-600 uppercase tracking-[0.2em] flex items-center gap-2">
          <div class="w-2 h-2 bg-blue-600 rounded-full animate-pulse"></div>
          Water Management Analytics
        </h3>
        <button @click="resetFilters" class="text-[9px] md:text-[10px] font-black text-red-500 hover:bg-red-50 px-4 py-2 rounded-xl transition uppercase tracking-widest border-2 border-red-50 w-full sm:w-auto">
          Reset Filter
        </button>
      </div>
      
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-12 gap-3 md:gap-4">
        <div class="lg:col-span-4">
          <label class="block text-[10px] font-bold text-blue-400 uppercase mb-2 ml-1 tracking-wider">Pencarian</label>
          <div class="relative">
            <input 
              type="text" 
              v-model="filters.search" 
              @input="handleSearch" 
              placeholder="Cari Blok/Afdeling..." 
              class="w-full px-5 py-3.5 bg-blue-50/50 border-2 border-blue-100 rounded-2xl text-sm focus:ring-4 focus:ring-blue-500/10 focus:border-blue-300 outline-none transition-all font-semibold placeholder:text-blue-300" 
            />
          </div>
        </div>

        <div class="lg:col-span-3">
          <label class="block text-[10px] font-bold text-blue-400 uppercase mb-2 ml-1 tracking-wider">Lokasi</label>
          <SearchableSelect 
            v-model="filters.id_lokasi" 
            :options="mappedLokasi" 
            label-key="display" 
            value-key="id" 
            placeholder="Pilih Lokasi..." 
            @change="handleFilterChange" 
          />
        </div>

        <div class="grid grid-cols-2 lg:col-span-5 gap-3">
          <div>
            <label class="block text-[10px] font-bold text-blue-400 uppercase mb-2 ml-1 tracking-wider">Bulan</label>
            <select v-model="filters.month" @change="handleFilterChange" 
              class="w-full px-4 py-3.5 bg-blue-50/50 border-2 border-blue-100 rounded-2xl text-sm outline-none font-bold cursor-pointer focus:border-blue-300 transition-all">
              <option v-for="(m, i) in monthOptions" :key="i" :value="i + 1">{{ m }}</option>
            </select>
          </div>
          <div>
            <label class="block text-[10px] font-bold text-blue-400 uppercase mb-2 ml-1 tracking-wider">Tahun</label>
            <select v-model="filters.year" @change="handleFilterChange" 
              class="w-full px-4 py-3.5 bg-blue-50/50 border-2 border-blue-100 rounded-2xl text-sm outline-none font-bold cursor-pointer focus:border-blue-300 transition-all">
              <option v-for="y in yearOptions" :key="y" :value="y">{{ y }}</option>
            </select>
          </div>
        </div>
      </div>
    </div>

    <div class="bg-transparent md:bg-white md:border-2 md:border-blue-100 md:rounded-[2.5rem] md:shadow-2xl md:shadow-blue-900/5 overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full border-collapse block md:table">
          <thead class="hidden md:table-header-group">
            <tr class="bg-blue-50/50 border-b-2 border-blue-100">
              <th class="pl-10 py-7 text-left text-[10px] font-black text-blue-700 uppercase tracking-[0.2em]">Wilayah</th>
              <th class="px-4 py-7 text-left text-[10px] font-black text-blue-700 uppercase tracking-[0.2em]">Skor Komponen</th>
              <th class="px-4 py-7 text-center text-[10px] font-black text-blue-700 uppercase tracking-[0.2em]">Final Score</th>
              <th class="px-4 py-7 text-left text-[10px] font-black text-blue-700 uppercase tracking-[0.2em]">Hasil Analisa</th>
              <th class="px-10 py-7 text-center text-[10px] font-black text-blue-700 uppercase tracking-[0.2em]">Aksi</th>
            </tr>
          </thead>

          <tbody class="divide-y-2 divide-blue-50 bg-transparent md:bg-white block md:table-row-group space-y-4 md:space-y-0">
            <tr v-if="isLoading" class="block md:table-row">
              <td colspan="5" class="py-24 text-center block md:table-cell">
                <div class="flex flex-col items-center gap-4">
                  <div class="w-12 h-12 border-4 border-blue-100 border-t-blue-600 rounded-full animate-spin"></div>
                  <span class="text-[10px] font-black text-blue-600 uppercase tracking-widest">Memuat Data Analitik...</span>
                </div>
              </td>
            </tr>

            <tr v-else-if="responseData.data.length === 0" class="block md:table-row">
              <td colspan="5" class="py-24 text-center block md:table-cell bg-white rounded-3xl md:rounded-none">
                <div class="flex flex-col items-center gap-3">
                  <Icon name="ph:folder-open-duotone" class="w-16 h-16 text-blue-100" />
                  <span class="text-xs font-bold text-blue-300 uppercase tracking-widest">Data Tidak Ditemukan</span>
                </div>
              </td>
            </tr>

            <tr v-for="item in responseData.data" :key="item.lokasi.id" 
                class="block md:table-row bg-white rounded-3xl md:rounded-none border-2 border-blue-50 md:border-0 p-5 md:p-0 hover:bg-blue-50/40 transition-all duration-300 group">
              
              <td class="block md:table-cell md:pl-10 md:py-8">
                <div class="flex justify-between items-start md:block mb-4 md:mb-0">
                  <div>
                    <div class="text-lg font-black text-blue-900 mb-1 group-hover:text-blue-600 transition-colors">Afdeling {{ item.lokasi.afdeling }}</div>
                    <div class="flex items-center gap-2">
                        <span class="text-[10px] font-bold text-blue-400 uppercase bg-blue-50 px-2 py-0.5 rounded-md border border-blue-100">Blok {{ item.lokasi.blok }}</span>
                    </div>
                  </div>
                  <div class="md:mt-3 text-[9px] font-black text-blue-700 bg-white px-3 py-1.5 rounded-xl border-2 border-blue-100 uppercase tracking-wider">
                    {{ item.periode.tanggal_indo }}
                  </div>
                </div>
              </td>
              
              <td class="block md:table-cell px-0 md:px-4 py-4 md:py-8">
                <div class="grid grid-cols-3 gap-2 w-full md:w-[280px]">
                  <div v-for="(val, key) in {Harian: 'harian', Infra: 'mingguan', WL: 'water_level'}" :key="key"
                       class="bg-blue-50/50 border-2 border-blue-100 rounded-2xl p-3 text-center transition-colors group-hover:bg-white group-hover:border-blue-200">
                    <p class="text-[8px] font-black text-blue-400 uppercase mb-1 tracking-tighter">{{ key }}</p>
                    <p :class="getScoreTextClass(item.data.breakdown[val])" class="text-base font-black">{{ item.data.breakdown[val] }}</p>
                  </div>
                </div>
              </td>

              <td class="block md:table-cell px-0 md:px-4 py-4 md:py-8 md:text-center">
                <div class="flex items-center md:justify-center gap-4 md:flex-col">
                  <div :class="getTheme(item.analisa.status).border"
                       class="inline-flex flex-col items-center justify-center w-16 h-16 rounded-[1.25rem] border-2 transition-transform duration-500 group-hover:scale-110 shadow-lg bg-white shrink-0">
                    <span :class="getTheme(item.analisa.status).text" class="text-xl font-black tracking-tighter">
                      {{ item.data.total_skor }}
                    </span>
                  </div>
                  <span :class="getTheme(item.analisa.status).badge" class="px-3 py-1.5 rounded-xl text-[9px] font-black uppercase tracking-widest border-2 shadow-sm">
                    {{ item.analisa.status }}
                  </span>
                </div>
              </td>

              <td class="block md:table-cell px-0 md:px-4 py-4 md:py-8">
                <div class="bg-blue-50/50 p-4 rounded-2xl border-2 border-blue-100 relative overflow-hidden">
                  <Icon name="ph:quotes-fill" class="absolute -right-1 -top-1 text-blue-100 w-8 h-8 opacity-50" />
                  <p class="text-xs text-blue-800 font-semibold italic leading-relaxed md:max-w-[240px] relative z-10">
                    "{{ item.analisa.rekomendasi }}"
                  </p>
                </div>
              </td>
              
              <td class="block md:table-cell md:px-10 py-4 md:py-8 text-center">
                <button @click="goToDetail(item)" 
                  class="text-[10px] font-black uppercase text-white bg-blue-600 hover:bg-blue-800 px-6 py-4 rounded-2xl transition-all w-full shadow-lg shadow-blue-600/20 active:scale-95 tracking-widest">
                  View Analysis
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div v-if="responseData.total > 0" class="mt-6 md:mt-0 px-6 md:px-10 py-8 bg-blue-50/30 border-t-2 border-blue-100 flex flex-col md:flex-row items-center justify-between gap-6">
        <div class="text-[11px] font-black text-blue-400 uppercase tracking-widest order-2 md:order-1">
          Showing 
          <span class="text-blue-900 bg-blue-100 px-2 py-1 rounded-lg mx-1">{{ paginationInfo.from }}</span> 
          to 
          <span class="text-blue-900 bg-blue-100 px-2 py-1 rounded-lg mx-1">{{ paginationInfo.to }}</span> 
          of 
          <span class="text-blue-600 ml-1">{{ responseData.total }}</span> Data
        </div>

        <div class="flex gap-3 w-full md:w-auto order-1 md:order-2">
          <button @click="changePage(responseData.current_page - 1)" :disabled="responseData.current_page <= 1" 
            class="flex-1 md:flex-none px-8 py-3.5 bg-white border-2 border-blue-100 rounded-2xl text-[10px] font-black text-blue-700 hover:bg-blue-600 hover:text-white disabled:opacity-30 disabled:cursor-not-allowed transition-all uppercase tracking-widest shadow-sm">
            Prev
          </button>
          <button @click="changePage(responseData.current_page + 1)" :disabled="responseData.current_page >= responseData.last_page" 
            class="flex-1 md:flex-none px-8 py-3.5 bg-white border-2 border-blue-100 rounded-2xl text-[10px] font-black text-blue-700 hover:bg-blue-600 hover:text-white disabled:opacity-30 disabled:cursor-not-allowed transition-all uppercase tracking-widest shadow-sm">
            Next
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
// --- STATE ---
const isLoading = ref(false)
const responseData = ref({ current_page: 1, data: [], total: 0, last_page: 1 })
const lokasis = ref([])
const filters = ref({ 
  search: '', 
  id_lokasi: '', 
  month: new Date().getMonth() + 1, 
  year: new Date().getFullYear() 
})

// --- DATA OPTIONS ---
const monthOptions = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"]
const yearOptions = Array.from({ length: 5 }, (_, i) => new Date().getFullYear() - i)
const mappedLokasi = computed(() => lokasis.value.map(l => ({ id: l.id, display: `${l.afdeling} - ${l.blok}` })))

// --- COMPUTED PAGINATION (FIXING THE MISSING LABELS) ---
const paginationInfo = computed(() => {
  const perPage = 10 // Sesuaikan dengan limit dari backend Anda
  const current = responseData.value.current_page || 1
  const count = responseData.value.data.length
  
  const from = count === 0 ? 0 : (current - 1) * perPage + 1
  const to = count === 0 ? 0 : from + count - 1
  
  return { from, to }
})

// --- THEME & COLOR LOGIC (RED, YELLOW, GREEN) ---
const getScoreTextClass = (score) => {
  const val = parseFloat(score)
  if (val <= 1.5) return 'text-red-600'
  if (val <= 2.5) return 'text-amber-600'
  return 'text-emerald-600'
}

const getTheme = (status) => {
  const s = (status || '').toLowerCase()
  if (s.includes('1') || s.includes('baik') || s.includes('aman')) {
    return { border: 'border-emerald-200 shadow-emerald-500/10', text: 'text-emerald-600', badge: 'bg-emerald-50 text-emerald-700 border-emerald-200' }
  }
  if (s.includes('2') || s.includes('sedang') || s.includes('cukup')) {
    return { border: 'border-amber-200 shadow-amber-500/10', text: 'text-amber-600', badge: 'bg-amber-50 text-amber-700 border-amber-200' }
  }
  return { border: 'border-red-200 shadow-red-500/10', text: 'text-red-600', badge: 'bg-red-50 text-red-700 border-red-200' }
}

// --- API ACTIONS ---
async function fetchData(page = 1) {
  isLoading.value = true
  try {
    const params = new URLSearchParams({ page, ...filters.value })
    const res = await useApi(`analytics/performance?${params.toString()}`)
    // Memastikan responseData terupdate dengan struktur yang benar
    if (res.status) {
      responseData.value = res.data
    }
  } catch (e) {
    console.error(e)
  } finally {
    isLoading.value = false
  }
}

async function fetchInitialOptions() {
  try {
    const res = await useApi('list/lokasi')
    lokasis.value = res
  } catch (e) { console.error(e) }
}

// --- HANDLERS ---
const handleSearch = () => {
  clearTimeout(window.sT)
  window.sT = setTimeout(() => fetchData(1), 500)
}
const handleFilterChange = () => fetchData(1)
const changePage = (p) => { if (p >= 1 && p <= responseData.value.last_page) fetchData(p) }
const resetFilters = () => {
  filters.value = { search: '', id_lokasi: '', month: new Date().getMonth() + 1, year: new Date().getFullYear() }
  fetchData(1)
}
const goToDetail = (item) => {
  navigateTo(`analytics/detail/${item.lokasi.id}?month=${filters.value.month}&year=${filters.value.year}`)
}

onMounted(() => {
  fetchInitialOptions()
  fetchData(1)
})
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap');
.font-sans { font-family: 'Plus Jakarta Sans', sans-serif; }
</style>