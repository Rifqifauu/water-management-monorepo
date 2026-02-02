<template>
  <div class="min-h-screen max-w-screen bg-[#F0F7FF] font-sans text-blue-950 overflow-x-hidden">

    <div v-if="pending" class="flex flex-col items-center justify-center min-h-screen px-4">
      <div class="relative">
        <div class="w-12 h-12 border-4 border-blue-200 rounded-full"></div>
        <div class="w-12 h-12 border-4 border-blue-600 border-t-transparent rounded-full animate-spin absolute top-0">
        </div>
      </div>
      <p class="mt-4 text-[10px] font-black text-blue-800/40 uppercase tracking-[0.2em]">Sinkronisasi Data</p>
    </div>

    <main v-else-if="detailData" class="w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-8 space-y-6 min-w-0">

      <header
        class="bg-white p-5 rounded-2xl border-2 border-blue-100 shadow-xl shadow-blue-900/5 flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div class="flex items-start sm:items-center gap-4">
          <button @click="navigateTo('/dashboard/analytics')"
            class="flex-shrink-0 p-2.5 bg-blue-600 hover:bg-blue-700 text-white rounded-xl transition-all shadow-md shadow-blue-200">
            <Icon name="ph:arrow-left-bold" class="w-5 h-5" />
          </button>
          <div class="min-w-0">
            <div class="flex flex-wrap items-center gap-2">
              <h1 class="text-xl sm:text-2xl font-black text-blue-900 tracking-tight leading-tight">
                Blok {{ detailData.header.lokasi.blok }}
              </h1>
              <span :class="getStatusStyles(detailData.header.performance.analisa.kategori)"
                class="text-[9px] px-2.5 py-1 rounded-lg uppercase tracking-wider font-extrabold border-2">
                {{ detailData.header.performance.analisa.kategori }}
              </span>
            </div>
            <p
              class="text-[10px] sm:text-xs font-bold text-blue-500 uppercase tracking-widest mt-1.5 flex items-center gap-1.5">
              <Icon name="ph:map-pin-fill" class="w-3 h-3" />
              Afd {{ detailData.header.lokasi.afdeling }} <span class="text-blue-200">|</span> {{
              detailData.header.periode }}
            </p>

            <div
              class="flex items-center mt-2 gap-3 bg-blue-50/50 border border-blue-100 rounded-lg p-1.5 pr-4 overflow-x-auto max-w-full">
              <div class="bg-blue-700 text-white px-3 py-1.5 rounded-md shadow-sm flex items-center gap-2 flex-shrink-0">
                <span class="text-[10px] font-bold uppercase opacity-80">Skor</span>
                <span class="text-sm font-black">{{ detailData.header.performance.scores.final_weighted }}</span>
              </div>

              <div class="w-px h-6 bg-blue-200/50"></div>

              <div class="flex items-center gap-4">
                <div v-for="comp in components" :key="comp.key" class="flex items-center gap-1.5 flex-shrink-0">
                  <Icon :name="comp.icon" class="w-3.5 h-3.5 text-blue-400" />
                  <div class="flex flex-col leading-none">
                    <span class="text-[9px] font-bold text-blue-300 uppercase">{{ comp.label }}</span>
                    <span class="text-xs font-bold text-blue-800">{{ detailData.header.performance.scores[comp.key]
                      }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <button @click="exportDetail" :disabled="isExporting"
          class="w-full md:w-auto inline-flex items-center justify-center gap-2 px-6 py-3 bg-blue-600 hover:bg-blue-800 text-white rounded-xl font-bold text-[11px] uppercase transition-all shadow-lg shadow-blue-600/20 active:scale-95 disabled:opacity-70 disabled:cursor-not-allowed">
          <Icon :name="isExporting ? 'ph:spinner-gap-bold' : 'ph:file-xls-bold'" class="w-4 h-4"
            :class="{ 'animate-spin': isExporting }" />
          <span>{{ isExporting ? 'Mengekspor...' : 'Export Excel' }}</span>
        </button>
      </header>

      <section class="bg-white border border-slate-200 rounded-3xl overflow-hidden shadow-sm">
        
        <div class="flex p-1.5 bg-slate-50 border-b border-slate-200 overflow-x-auto no-scrollbar">
          <div class="flex gap-1.5 min-w-full">
            <button v-for="tab in tabs" :key="tab.id" @click="activeTab = tab.id"
              :class="activeTab === tab.id ? 'bg-white text-blue-600 shadow-sm ring-1 ring-slate-200' : 'text-slate-500 hover:bg-slate-100'"
              class="flex-1 min-w-[120px] py-2 px-3 rounded-xl transition-all duration-200 flex items-center justify-center gap-2">
              <span class="text-[10px] font-bold uppercase tracking-wider">{{ tab.label }}</span>
              <span class="text-[10px] px-1.5 py-0.5 rounded-md font-bold bg-blue-50 text-blue-600">
                {{ detailData.details[tab.key]?.length || 0 }}
              </span>
            </button>
          </div>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-left border-collapse">
            <thead class="bg-slate-50 text-xs font-bold text-slate-500 uppercase tracking-wider border-b border-slate-200">
              <tr>
                <th class="px-4 py-3 min-w-[140px]">Waktu & Pengamat</th>
                <th class="px-4 py-3 min-w-[200px]">Objek & Status</th>
                <th class="px-4 py-3 min-w-[180px]">Detail Temuan</th>
                <th class="px-4 py-3 text-center w-20">Skor</th>
                <th class="px-4 py-3 text-right min-w-[140px]">Foto</th>
              </tr>
            </thead>

            <tbody class="divide-y divide-slate-100 text-sm">
              <tr v-for="item in detailData.details[tabs.find(t => t.id === activeTab).key]" :key="item.id"
                class="group hover:bg-slate-50/60 transition-colors">

                <td class="px-4 py-4 align-top">
                  <div class="flex flex-col gap-1">
                    <span class="font-bold text-slate-900">{{ item.tanggal }}</span>
                    <div class="flex items-center gap-1.5 text-blue-600">
                      <Icon name="ph:user-circle-fill" class="w-4 h-4 opacity-70" />
                      <span class="text-xs font-semibold uppercase">{{ item.pengamat }}</span>
                    </div>
                  </div>
                </td>

                <td class="px-4 py-4 align-top">
                  <div class="flex flex-col gap-1">
                    <span class="font-bold text-slate-800 group-hover:text-blue-600 transition-colors">
                      {{ item.objek || item.infra || 'Water Level ' + item.no_alat }}
                    </span>
                    <span class="text-xs text-slate-500 italic leading-relaxed">
                      "{{ item.kondisi_riil?.tindakan || item.temuan?.tindakan || item.tindakan || '-' }}"
                    </span>
                  </div>
                </td>

                <td class="px-4 py-4 align-top">
                  <div class="flex flex-col gap-1.5 text-xs">
                    <div v-for="(value, key) in getDynamicDetails(item)" :key="key" class="flex items-start">
                      <span class="w-24 text-slate-400 font-medium shrink-0 capitalize">
                        {{ formatLabel(key) }} :
                      </span>
                      <span class="text-slate-700 font-bold truncate max-w-[150px]" :title="value">
                        {{ value }}
                      </span>
                    </div>
                    
                    <span v-if="Object.keys(getDynamicDetails(item)).length === 0" class="text-slate-300 italic">
                      -
                    </span>
                  </div>
                </td>

                <td class="px-4 py-4 align-top text-center">
                  <span class="inline-block px-2.5 py-1 bg-slate-100 rounded-lg text-slate-800 font-black text-lg border border-slate-200">
                    {{ item.skor || item.skor_breakdown?.final || 0 }}
                  </span>
                </td>

                <td class="px-4 py-4 align-top">
                  <div class="flex justify-end gap-3 pt-1">
                    
                    <div v-if="item.dokumentasi?.before" class="relative group/img flex-shrink-0">
                      <div @click="openImage(item.dokumentasi.before)"
                        class="w-12 h-12 rounded-lg border border-slate-200 overflow-hidden cursor-pointer hover:border-slate-400 transition-all shadow-sm bg-slate-100">
                        <img :src="item.dokumentasi.before" class="w-full h-full object-cover opacity-90 hover:opacity-100 transition-opacity" loading="lazy">
                      </div>
                      <span class="absolute -bottom-2 left-1/2 -translate-x-1/2 bg-slate-700 text-white text-[8px] font-bold px-2 py-0.5 rounded-full shadow-sm border border-white tracking-wide z-10 pointer-events-none">
                        BEFORE
                      </span>
                    </div>

                    <div v-if="item.dokumentasi?.after" class="relative group/img flex-shrink-0">
                      <div @click="openImage(item.dokumentasi.after)"
                        class="w-12 h-12 rounded-lg border border-blue-200 overflow-hidden cursor-pointer hover:border-blue-500 transition-all shadow-sm bg-blue-50">
                        <img :src="item.dokumentasi.after" class="w-full h-full object-cover hover:scale-110 transition-transform duration-500" loading="lazy">
                      </div>
                      <span class="absolute -bottom-2 left-1/2 -translate-x-1/2 bg-blue-600 text-white text-[8px] font-bold px-2 py-0.5 rounded-full shadow-sm border border-white tracking-wide z-10 pointer-events-none">
                        AFTER
                      </span>
                    </div>
                    
                    <span v-if="!item.dokumentasi?.before && !item.dokumentasi?.after" class="text-[10px] text-slate-300 italic self-center">
                      No IMG
                    </span>

                  </div>
                </td>

              </tr>
            </tbody>
          </table>
        </div>
      </section>

    </main>
  </div>
</template>

<script setup>
import Swal from 'sweetalert2'

const route = useRoute()
const config = useRuntimeConfig()
const activeTab = ref('harian')

const tabs = [
  { id: 'harian', label: 'Harian', key: 'monitoring_harian' },
  { id: 'mingguan', label: 'Infrastruktur', key: 'monitoring_mingguan' },
  { id: 'water', label: 'Water Level', key: 'water_level' }
]

const components = [
  { label: 'Harian', key: 'harian', icon: 'ph:calendar-check-bold' },
  { label: 'Infra', key: 'mingguan', icon: 'ph:hard-drive-bold' },
  { label: 'Water', key: 'water_level', icon: 'ph:waves-bold' }
]

// === DATA FETCHING ===
const { data: detailData, pending } = await useAsyncData(`analytics-${route.params.id}`, async () => {
  try {
    const response = await useApi(`analytics/detail/${route.params.id}`, {
      params: {
        month: route.query.month || new Date().getMonth() + 1,
        year: route.query.year || new Date().getFullYear()
      }
    })
    return response.data
  } catch (err) {
    console.error("API Error:", err)
    return null
  }
})

// === DYNAMIC DETAIL LOGIC ===
// Memformat key database menjadi label yang enak dibaca
const formatLabel = (key) => {
  if (!key) return ''
  // Hapus underscore, huruf pertama besar
  return key.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase())
}

// Mengambil detail secara dinamis tanpa hardcode key
const getDynamicDetails = (item) => {
  // 1. Cari object detail (biasanya kondisi_riil atau temuan)
  let details = item.kondisi_riil || item.temuan || {}

  // 2. Logic khusus jika data 'flat' (misal water level tidak punya sub-object)
  if (Object.keys(details).length === 0) {
     // Jika kosong, kita coba ambil data dari root item tapi filter manual
     details = { ...item } 
  }

  // 3. Blacklist key yang TIDAK perlu muncul di kolom detail
  // (Karena sudah muncul di judul, status, atau data teknis)
  const blacklist = [
    'id', 'uuid', 'created_at', 'updated_at', 'deleted_at',
    'tanggal', 'pengamat', 'no_alat', 'skor', 'skor_breakdown', // Sudah di kolom lain
    'objek', 'infra', 'tindakan', // Sudah di kolom Judul/Status
    'dokumentasi', 'foto', 'image', 'file', // Gambar
    'lat', 'long', 'latitude', 'longitude', 'koordinat' // Teknis
  ]

  // 4. Bersihkan object
  const result = {}
  Object.entries(details).forEach(([key, value]) => {
    // Validasi: tidak diblacklist, value tidak null/kosong
    if (!blacklist.includes(key) && value !== null && value !== '' && value !== undefined) {
      result[key] = value
    }
  })

  return result
}

// === EXPORT LOGIC ===
const isExporting = ref(false)

const exportDetail = async () => {
  if (isExporting.value || !detailData.value) return

  isExporting.value = true
  try {
    const response = await useApi(`export/monitoring-detail/${route.params.id}`, {
      method: 'GET',
      params: {
        month: route.query.month || new Date().getMonth() + 1,
        year: route.query.year || new Date().getFullYear()
      },
      responseType: 'blob'
    })

    const url = window.URL.createObjectURL(response)
    const link = document.createElement('a')
    link.href = url
    // Nama file dinamis
    const blok = detailData.value?.header?.lokasi?.blok || 'Report'
    link.setAttribute('download', `Laporan_Monitoring_Blok_${blok}.xlsx`)
    document.body.appendChild(link)
    link.click()

    document.body.removeChild(link)
    window.URL.revokeObjectURL(url)

    Swal.fire({
      icon: 'success',
      title: 'Berhasil',
      text: 'File Excel berhasil diunduh',
      timer: 1500,
      showConfirmButton: false
    })

  } catch (error) {
    console.error("Export error:", error)
    Swal.fire({
      icon: 'error',
      title: 'Gagal Unduh',
      text: 'Terjadi kesalahan saat mengekspor data.'
    })
  } finally {
    isExporting.value = false
  }
}

// === UTILS ===
const getStatusStyles = (status) => {
  const s = (status || '').toLowerCase()
  if (s === 'aman' || s === 'kelas 1') return 'bg-emerald-50 text-emerald-600 border-emerald-100'
  if (s === 'sedang' || s === 'cukup' || s === 'kelas 2') return 'bg-amber-50 text-amber-600 border-amber-100'
  if (s === 'buruk' || s === 'kritis' || s === 'kelas 3') return 'bg-red-50 text-red-600 border-red-100'
  return 'bg-blue-950 text-white border-blue-900'
}

const openImage = (url) => { 
  if (url) window.open(url, '_blank') 
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

.font-sans {
  font-family: 'Plus Jakarta Sans', sans-serif;
}

/* Custom Scrollbar for Table */
.overflow-x-auto::-webkit-scrollbar {
  height: 6px;
}
.overflow-x-auto::-webkit-scrollbar-track {
  background: transparent;
}
.overflow-x-auto::-webkit-scrollbar-thumb {
  background: #CBD5E1; /* Slate-300 */
  border-radius: 10px;
}
.overflow-x-auto::-webkit-scrollbar-thumb:hover {
  background: #94A3B8; /* Slate-400 */
}
</style>