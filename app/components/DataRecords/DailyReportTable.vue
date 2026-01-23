<template>
  <div class="w-full mt-6 px-2 md:px-0 max-w-[1250px] mx-auto pb-20 font-sans text-slate-900">

    <div class="bg-white p-6 rounded-[1rem] border border-slate-100 shadow-sm mb-6 transition-all">
      <div class="flex justify-between items-center mb-6">
        <h3 class="text-xs font-black text-slate-400 uppercase tracking-[0.2em] flex items-center gap-2">
          <div class="w-2.5 h-2.5 bg-blue-600 rounded-full animate-pulse"></div>
          Monitoring Parit & Genangan
        </h3>
        <button @click="resetFilters"
          class="text-[10px] font-black text-red-500 hover:bg-red-50 px-4 py-1.5 rounded-full transition uppercase tracking-widest border border-transparent hover:border-red-100">
          Reset Filter
        </button>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-12 gap-5">
        <div class="lg:col-span-4">
          <label class="block text-[10px] font-bold text-slate-400 uppercase mb-1.5 ml-1 tracking-wider">Pencarian
            Cepat</label>
          <input type="text" v-model="filters.search" @input="handleSearch" placeholder="Cari Blok, Afdeling, Jalur..."
            class="w-full px-5 py-3.5 bg-slate-50 border border-slate-100 rounded-2xl text-sm focus:ring-4 focus:ring-blue-500/10 outline-none transition-all font-semibold" />
        </div>

        <div class="lg:col-span-2">
          <label class="block text-[10px] font-bold text-slate-400 uppercase mb-1.5 ml-1 tracking-wider">Tanggal</label>
          <input type="date" v-model="filters.date" @change="handleFilterChange"
            class="w-full px-4 py-3.5 bg-slate-50 border border-slate-100 rounded-2xl text-sm focus:ring-4 focus:ring-blue-500/10 outline-none font-semibold" />
        </div>

        <div class="lg:col-span-2">
          <label
            class="block text-[10px] font-bold text-slate-400 uppercase mb-1.5 ml-1 tracking-wider">Pengamat</label>
          <select v-model="filters.id_karyawan" @change="handleFilterChange"
            class="w-full px-4 py-3.5 bg-slate-50 border border-slate-100 rounded-2xl text-sm outline-none font-semibold appearance-none">
            <option value="">Semua Personil</option>
            <option v-for="k in options.karyawan" :key="k.id" :value="k.id">{{ k.nama }}</option>
          </select>
        </div>

        <div class="lg:col-span-3">
          <label class="block text-[10px] font-bold text-slate-400 uppercase mb-1.5 ml-1 tracking-wider">
            Lokasi
          </label>

          <SearchableSelect v-model="filters.id_lokasi" :options="mappedLokasi" label-key="display" value-key="id"
            placeholder="Cari Lokasi..." @change="handleFilterChange" />
        </div>

      </div>
    </div>

    <transition enter-active-class="transition duration-300 ease-out"
      enter-from-class="transform -translate-y-4 opacity-0" enter-to-class="transform translate-y-0 opacity-100"
      leave-active-class="transition duration-200 ease-in" leave-from-class="transform translate-y-0 opacity-100"
      leave-to-class="transform -translate-y-4 opacity-0">
      <div v-if="selectedIds.length > 0"
        class="mb-6 flex items-center justify-between p-5 bg-red-600 rounded-[2rem] shadow-2xl shadow-red-200 text-white">
        <div class="flex items-center gap-3">
          <div class="bg-white/20 p-2 rounded-xl"><svg class="w-5 h-5" fill="none" stroke="currentColor"
              viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
            </svg></div>
          <span class="text-xs font-black uppercase tracking-widest">{{ selectedIds.length }} Data Terpilih</span>
        </div>
        <div class="flex gap-2">
          <button @click="bulkDelete"
            class="px-6 py-2.5 bg-white text-red-600 text-[10px] font-black rounded-xl hover:bg-red-50 transition uppercase tracking-widest">Hapus
            Permanen</button>
          <button @click="selectedIds = []"
            class="px-6 py-2.5 bg-red-700 text-white text-[10px] font-black rounded-xl hover:bg-red-800 transition uppercase tracking-widest border border-red-500">Batal</button>
        </div>
      </div>
    </transition>

    <div class="bg-white border border-slate-100 rounded-[1rem] shadow-2xl shadow-slate-200/40 overflow-hidden">

      <div class="block md:hidden bg-slate-50/50 p-3">
        <div v-if="isLoading"
          class="py-20 text-center font-bold text-blue-500 animate-pulse text-xs uppercase tracking-widest">Sinkronisasi
          Server...</div>
        <div v-for="item in responseData.data" :key="item.id"
          class="bg-white p-6 mb-4 rounded-[2rem] border border-slate-100 shadow-sm relative transition-all active:scale-[0.98]">

          <div class="flex justify-between items-start mb-6">
            <div class="flex gap-4">
              <input type="checkbox" v-model="selectedIds" :value="item.id"
                class="mt-1 rounded-lg border-slate-200 text-blue-600 h-6 w-6" />
              <div>
                <p class="text-sm font-black text-slate-800 leading-none mb-1">{{ formatDate(item.tanggal) }}</p>
                <p class="text-[10px] font-bold text-blue-500 uppercase tracking-tighter">{{ item.karyawan?.nama }}</p>
                <div class="mt-3 flex flex-wrap gap-1">
                  <span class="px-2.5 py-1 bg-slate-900 text-white text-[8px] font-black rounded-lg uppercase">{{
                    item.lokasi?.afdeling }} • {{ item.lokasi?.blok }}</span>
                  <span
                    class="px-2.5 py-1 bg-blue-50 text-blue-600 text-[8px] font-black rounded-lg uppercase border border-blue-100">{{
                    item.tipe_objek }}</span>
                </div>
              </div>
            </div>
            <div class="text-right">
              <span class="text-[8px] font-black text-slate-400 uppercase block mb-1">Avg Score</span>
              <div class="inline-flex items-center justify-center w-12 h-12 rounded-2xl border-2"
                :class="item.rata_rata_skor > 0 ? getScoreBorder(item.rata_rata_skor) : 'border-slate-100 bg-slate-50'">
                <span v-if="item.rata_rata_skor > 0" class="text-xl font-black tracking-tighter"
                  :class="getScoreColor(item.rata_rata_skor)">{{ item.rata_rata_skor }}</span>
                <span v-else class="text-[10px] font-black text-slate-300">N/A</span>
              </div>
            </div>
          </div>

          <div class="grid grid-cols-2 gap-3 mb-6">
            <div v-for="p in getVisibleParameters(item.tipe_objek)" :key="p"
              class="bg-slate-50/80 p-3 rounded-2xl border border-slate-100">
              <p class="text-[8px] font-black text-slate-400 uppercase mb-1.5">{{ p }}</p>
              <div class="flex justify-between items-center">
                <span class="text-[10px] font-bold text-slate-700 truncate pr-1">
                  {{ getRawValue(item, p) }}
                </span>
                <ScoreBadge :skor="getSkorValue(item, p)" />
              </div>
            </div>
          </div>

          <div class="flex gap-2">
            <a v-if="item.foto_path" :href="storageUrl + item.foto_path" target="_blank"
              class="flex-1 py-3.5 text-center bg-slate-50 text-slate-600 text-[9px] font-black rounded-2xl border border-slate-100 uppercase tracking-widest transition">Foto
              Before</a>
            <a v-if="item.foto_after" :href="storageUrl + item.foto_after" target="_blank"
              class="flex-1 py-3.5 text-center bg-slate-50 text-slate-600 text-[9px] font-black rounded-2xl border border-slate-100 uppercase tracking-widest transition">Foto
              After</a>
          </div>
        </div>
      </div>

      <div class="hidden md:block overflow-x-auto">
        <table class="w-full border-collapse">
          <thead>
            <tr class="bg-slate-50/50 border-b border-slate-100">
              <th class="pl-10 py-7 text-left w-10">
                <input type="checkbox" :checked="isAllSelected" @change="toggleSelectAll"
                  class="rounded-lg border-slate-300 text-blue-600 h-5 w-5 cursor-pointer" />
              </th>
              <th class="px-4 py-7 text-left text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">Detail
                Observasi</th>
              <th class="px-4 py-7 text-left text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">Area</th>
              <th class="px-4 py-7 text-left text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">Parameter
                & Skor Snapshot</th>
              <th class="px-4 py-7 text-center text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">Score
              </th>
              <th class="px-4 py-7 text-center text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">Dokumen
              </th>
              <th class="px-6 py-7 text-left text-[10px] font-black text-slate-400 uppercase tracking-[0.2em]">Notes
              </th>
            </tr>
          </thead>

          <tbody class="divide-y divide-slate-200 bg-white">
            <tr v-if="isLoading">
              <td colspan="7"
                class="py-24 text-center font-black text-blue-500 animate-pulse text-xs uppercase tracking-[0.3em]">
                Connecting to API...</td>
            </tr>
            <tr v-for="item in responseData.data" :key="item.id"
              class="hover:bg-blue-50/20 transition-all duration-200 group">
              <td class="pl-10 py-6">
                <input type="checkbox" v-model="selectedIds" :value="item.id"
                  class="rounded-lg border-slate-300 text-blue-600 h-5 w-5 cursor-pointer" />
              </td>
              <td class="px-4 py-6 whitespace-nowrap">
                <div class="text-sm font-black text-slate-800 mb-1">{{ formatDate(item.tanggal) }}</div>
                <div class="text-[10px] font-bold text-blue-500 uppercase tracking-tight">{{ item.karyawan?.nama }}
                </div>
                <div
                  class="mt-2 px-2.5 py-1 bg-slate-100 rounded-lg text-[9px] font-black text-slate-500 uppercase w-fit tracking-tighter border border-slate-200">
                  {{ item.tipe_objek }}</div>
              </td>
              <td class="px-4 py-6 whitespace-nowrap">
                <div class="text-sm font-black text-slate-800 tracking-tight leading-tight mb-1">{{
                  item.lokasi?.afdeling }}</div>
                <div class="text-[11px] font-bold text-slate-400 uppercase tracking-tighter">Blok: {{ item.lokasi?.blok
                  }}</div>
                <div class="text-[9px] font-black text-blue-400 mt-2 uppercase">Jalur: {{ item.nomor_jalur || '-' }}
                </div>
              </td>

              <td class="px-4 py-6">
                <div class="grid grid-cols-2 gap-2.5 w-[420px]">
                  <div v-for="p in getVisibleParameters(item.tipe_objek)" :key="p"
                    class="bg-white border border-slate-100 rounded-2xl p-3 shadow-sm flex items-center justify-between group-hover:border-blue-100 transition-colors">
                    <div class="max-w-[120px]">
                      <p class="text-[8px] font-black text-slate-400 uppercase leading-none mb-1.5 tracking-tighter">{{
                        p }}</p>
                      <p class="text-[10px] font-bold text-slate-700 truncate" :title="getRawValue(item, p)">{{
                        getRawValue(item, p) }}</p>
                    </div>
                    <ScoreBadge :skor="getSkorValue(item, p)" />
                  </div>
                </div>
              </td>
              <td class="px-4 py-6 text-center">
                <div
                  class="inline-flex flex-col items-center justify-center w-16 h-16 rounded-[1.5rem] border-2 transition-all group-hover:scale-110 shadow-sm"
                  :class="item.rata_rata_skor > 0 ? getScoreBorder(item.rata_rata_skor) : 'border-slate-100 bg-slate-50'">
                  <span v-if="item.rata_rata_skor > 0" class="text-xl font-black tracking-tighter"
                    :class="getScoreColor(item.rata_rata_skor)">{{ item.rata_rata_skor }}</span>
                  <span v-else class="text-[10px] font-black text-slate-300">N/A</span>
                </div>
              </td>

              <td class="px-4 py-6 text-center">
                <div class="flex flex-col gap-1.5 items-center">
                  <a v-if="item.foto_path" :href="storageUrl + item.foto_path" target="_blank"
                    class="text-[9px] font-black uppercase text-blue-600 bg-blue-50 px-4 py-2 rounded-xl border border-blue-100 hover:bg-blue-100 transition w-full block tracking-widest">Before</a>
                  <a v-if="item.foto_after" :href="storageUrl + item.foto_after" target="_blank"
                    class="text-[9px] font-black uppercase text-blue-600 bg-blue-50 px-4 py-2 rounded-xl border border-blue-100 hover:bg-blue-100 transition w-full block tracking-widest">After</a>
                  <span v-if="!item.foto_path && !item.foto_after"
                    class="text-[9px] text-slate-300 font-bold uppercase tracking-widest">Empty</span>
                </div>
              </td>

              <td class="px-6 py-6">
                <p class="text-[11px] text-slate-400 font-medium italic leading-relaxed max-w-[160px] line-clamp-2"
                  :title="item.keterangan">
                  {{ item.keterangan || '-' }}
                </p>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div v-if="responseData.total > 0"
        class="px-10 py-8 bg-slate-50/50 border-t border-slate-100 flex flex-col md:flex-row items-center justify-between gap-6">
        <div class="text-[10px] font-black text-slate-400 uppercase tracking-[0.3em]">
          Record <span class="text-slate-900">{{ responseData.from }}</span> to <span class="text-slate-900">{{
            responseData.to }}</span> of <span class="text-slate-900">{{ responseData.total }}</span>
        </div>

        <div class="flex gap-3">
          <button @click="changePage(responseData.current_page - 1)" :disabled="responseData.current_page === 1"
            class="px-6 py-3 bg-white border border-slate-200 rounded-2xl text-[10px] font-black text-slate-600 hover:bg-slate-100 disabled:opacity-30 transition uppercase tracking-widest">Prev</button>
          <div
            class="flex items-center px-6 text-xs font-black text-blue-600 bg-blue-100/50 rounded-2xl border border-blue-200 shadow-inner">
            {{ responseData.current_page }}</div>
          <button @click="changePage(responseData.current_page + 1)"
            :disabled="responseData.current_page === responseData.last_page"
            class="px-6 py-3 bg-white border border-slate-200 rounded-2xl text-[10px] font-black text-slate-600 hover:bg-slate-100 disabled:opacity-30 transition uppercase tracking-widest">Next</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, inject, h } from 'vue'
import { useApi } from '@/composables/useApi'
import Swal from 'sweetalert2'

const storageUrl = inject('storageUrl')
const apiUrl = inject('apiUrl')

/**
 * SUB-COMPONENT: ScoreBadge
 * Render N/A jika skor 0, atau angka skor dengan warna tematik
 */
const ScoreBadge = ({ skor }) => {
  if (!skor || skor === 0) {
    return h('div', { class: 'text-[9px] font-black text-slate-300 bg-slate-100 px-2 py-0.5 rounded-lg' }, 'N/A')
  }
  const theme = {
    3: 'bg-emerald-500 text-white shadow-lg shadow-emerald-100',
    2: 'bg-orange-500 text-white shadow-lg shadow-orange-100',
    1: 'bg-red-500 text-white shadow-lg shadow-red-100',
  }
  return h('div', {
    class: `text-[10px] font-black px-2 py-0.5 rounded-lg transition-transform hover:scale-110 ${theme[skor] || 'bg-slate-200'}`
  }, skor)
}

// --- STATE MANAGEMENT ---
const isLoading = ref(false), isExporting = ref(false), isDeleting = ref(false)
const selectedIds = ref([])
const responseData = ref({ current_page: 1, data: [], from: 0, last_page: 1, total: 0, to: 0 })
const options = ref({ karyawan: [], lokasi: [] })
const filters = ref({ search: '', date: '', id_karyawan: '', id_lokasi: '' })

// --- LOGIC HELPERS ---
const formatDate = (val) => val ? new Date(val).toLocaleDateString('id-ID', { day: '2-digit', month: 'short', year: 'numeric' }) : '-'

const getScoreColor = (skor) => {
  const v = parseFloat(skor)
  if (!v || v === 0) return 'text-slate-300'
  if (v >= 2.5) return 'text-emerald-600'
  if (v >= 1.5) return 'text-orange-500'
  return 'text-red-600'
}

const getScoreBorder = (skor) => {
  const v = parseFloat(skor)
  if (!v || v === 0) return 'border-slate-100 bg-slate-50'
  if (v >= 2.5) return 'border-emerald-100 bg-emerald-50'
  if (v >= 1.5) return 'border-orange-100 bg-orange-50'
  return 'border-red-100 bg-red-50'
}
// --- LOGIC HELPERS ---

// Fungsi baru untuk menentukan parameter berdasarkan tipe
const getVisibleParameters = (tipe) => {
  if (tipe?.toLowerCase().includes('genangan')) {
    return ['Durasi', 'Jumlah Pokok Terdampak', 'Kedalaman', 'Penyebab', 'Tindakan']
  }
  // Default untuk Parit atau tipe lainnya
  return ['Kedalaman', 'Penyebab', 'Aliran', 'Tindakan']
}

// Menerjemahkan nama parameter ke value aslinya
const getRawValue = (item, param) => {
  switch (param) {
    case 'Kedalaman': return item.kedalaman_cm ? `${item.kedalaman_cm} cm` : '-'
    case 'Aliran': return item.kondisi_aliran || '-'
    case 'Penyebab': return item.penyebab || '-'
    case 'Tindakan': return item.tindakan || '-'
    case 'Durasi': return item.durasi_genangan || '-'
    case 'Jumlah Pokok Terdampak': return item.jumlah_pokok ? `${item.jumlah_pokok} Pokok` : '-'
    default: return '-'
  }
}

// Menerjemahkan nama parameter ke value skornya
const getSkorValue = (item, param) => {
  switch (param) {
    case 'Kedalaman': return item.skor_kedalaman
    case 'Aliran': return item.skor_aliran
    case 'Penyebab': return item.skor_penyebab
    case 'Tindakan': return item.skor_tindakan
    case 'Durasi': return item.skor_durasi
    case 'Jumlah Pokok Terdampak': return item.skor_jumlah_pokok// Sesuaikan dengan field API Anda
    default: return 0
  }
}
const isAllSelected = computed(() => responseData.value.data.length > 0 && responseData.value.data.every(i => selectedIds.value.includes(i.id)))

// --- API ACTIONS ---
async function fetchData(page = 1) {
  isLoading.value = true
  try {
    const params = new URLSearchParams({ page, ...filters.value })
    console.log("Requesting with params:", params.toString())
    const res = await useApi(`monitoring-harian?${params.toString()}`)
    responseData.value = res
  } catch (e) { 
    console.error("Fetch Error:", e) 
  } finally { 
    isLoading.value = false 
  }
}
const mappedLokasi = computed(() => {
  return options.value.lokasi.map(loc => ({
    id: loc.id,
    display: `${loc.afdeling} - ${loc.blok}`
  }))
})
async function fetchFilterOptions() {
  try {
    const [kar, lok] = await Promise.all([useApi('list/karyawan'), useApi('list/lokasi')])
    options.value.karyawan = kar; options.value.lokasi = lok
  } catch (e) { console.error(e) }
}

const handleSearch = () => { clearTimeout(window.sT); window.sT = setTimeout(() => fetchData(1), 500) }
const handleFilterChange = () => fetchData(1)
const resetFilters = () => { filters.value = { search: '', date: '', id_karyawan: '', id_lokasi: '' }; fetchData(1) }
const changePage = (p) => { if (p >= 1 && p <= responseData.value.last_page) fetchData(p) }

const handleExport = () => {
  isExporting.value = true
  window.open(`${apiUrl}/export/monitoring-harian?${new URLSearchParams(filters.value)}`, '_blank')
  setTimeout(() => isExporting.value = false, 2000)
}

const toggleSelectAll = () => {
  const data = responseData.value.data
  if (isAllSelected.value) selectedIds.value = selectedIds.value.filter(id => !data.find(i => i.id === id))
  else selectedIds.value = [...new Set([...selectedIds.value, ...data.map(i => i.id)])]
}

const bulkDelete = async () => {
  const res = await Swal.fire({
    title: 'Hapus Permanen?',
    text: `Anda akan menghapus ${selectedIds.value.length} data. Tindakan ini tidak dapat dibatalkan!`,
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#0f172a',
    cancelButtonColor: '#f1f5f9',
    confirmButtonText: 'YA, HAPUS SEKARANG',
    cancelButtonText: 'BATAL',
    customClass: { confirmButton: 'rounded-2xl font-black text-[10px] tracking-widest px-8 py-4', cancelButton: 'rounded-2xl font-black text-[10px] tracking-widest px-8 py-4 text-slate-500' }
  })

  if (res.isConfirmed) {
    try {
      await Promise.all(selectedIds.value.map(id => useApi(`monitoring-harian/${id}`, { method: 'DELETE' })))
      selectedIds.value = []; fetchData()
      Swal.fire({ icon: 'success', title: 'Data Dibersihkan', timer: 1500, showConfirmButton: false })
    } catch (e) { Swal.fire('Error', 'Gagal memproses penghapusan.', 'error') }
  }
}

onMounted(() => { fetchFilterOptions(); fetchData(1) })
</script>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>