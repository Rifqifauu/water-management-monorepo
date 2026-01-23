<template>
  <div class="min-h-screen max-w-screen bg-[#F0F7FF] font-sans text-blue-950 overflow-x-hidden">
    
    <div v-if="pending" class="flex flex-col items-center justify-center min-h-screen px-4">
      <div class="relative">
        <div class="w-12 h-12 border-4 border-blue-200 rounded-full"></div>
        <div class="w-12 h-12 border-4 border-blue-600 border-t-transparent rounded-full animate-spin absolute top-0"></div>
      </div>
      <p class="mt-4 text-[10px] font-black text-blue-800/40 uppercase tracking-[0.2em]">Sinkronisasi Data</p>
    </div>

    <main v-else-if="detailData" class="w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 sm:py-8 space-y-6 min-w-0">
      
      <header class="bg-white p-5 rounded-2xl border-2 border-blue-100 shadow-xl shadow-blue-900/5 flex flex-col md:flex-row md:items-center justify-between gap-4">
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
            <p class="text-[10px] sm:text-xs font-bold text-blue-500 uppercase tracking-widest mt-1.5 flex items-center gap-1.5">
              <Icon name="ph:map-pin-fill" class="w-3 h-3" />
              Afd {{ detailData.header.lokasi.afdeling }} <span class="text-blue-200">|</span> {{ detailData.header.periode }}
            </p>
          </div>
        </div>
        
        <button 
          @click="exportDetail" 
          :disabled="isExporting"
          class="w-full md:w-auto inline-flex items-center justify-center gap-2 px-6 py-3 bg-blue-600 hover:bg-blue-800 text-white rounded-xl font-bold text-[11px] uppercase transition-all shadow-lg shadow-blue-600/20 active:scale-95"
        >
          <Icon :name="isExporting ? 'ph:spinner-gap-bold' : 'ph:file-xls-bold'" class="w-4 h-4" :class="{'animate-spin': isExporting}" />
          <span>{{ isExporting ? 'Mengekspor...' : 'Export Excel' }}</span>
        </button>
      </header>

      <section class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <div class="bg-blue-700 p-5 rounded-2xl shadow-xl shadow-blue-600/20 relative overflow-hidden">
          <div class="relative z-10">
            <span class="text-[10px] font-bold text-blue-100 uppercase tracking-widest">Skor Akhir</span>
            <div class="text-4xl font-black text-white mt-1">{{ detailData.header.performance.scores.final_weighted }}</div>
          </div>
          <Icon name="ph:chart-line-up-bold" class="absolute -right-2 -bottom-2 text-white/10 w-24 h-24 rotate-12" />
        </div>
        
        <div v-for="comp in components" :key="comp.key" 
             class="bg-white p-5 rounded-2xl border-2 border-blue-100 shadow-sm">
          <div class="flex items-center gap-2 mb-2">
            <div class="p-1.5 bg-blue-50 rounded-lg">
              <Icon :name="comp.icon" class="w-4 h-4 text-blue-600" />
            </div>
            <span class="text-[10px] font-bold text-blue-400 uppercase tracking-wider">{{ comp.label }}</span>
          </div>
          <div class="text-2xl font-black text-blue-900">{{ detailData.header.performance.scores[comp.key] }}</div>
        </div>
      </section>

      <section class="bg-blue-900 rounded-2xl p-5 flex gap-4 items-center border-l-[8px] border-blue-400 shadow-xl shadow-blue-900/10">
        <div class="p-2 bg-blue-800 rounded-xl">
          <Icon name="ph:seal-check-fill" class="w-6 h-6 text-blue-300 flex-shrink-0" />
        </div>
        <div class="min-w-0">
          <h4 class="text-[10px] font-bold text-blue-300 uppercase tracking-[0.2em] mb-1">Rekomendasi Tindakan</h4>
          <p class="text-white text-sm sm:text-base font-semibold leading-relaxed">
            "{{ detailData.header.performance.analisa.tindakan }}"
          </p>
        </div>
      </section>

      <section class="bg-white border-2 border-blue-100 rounded-[2rem] overflow-hidden shadow-2xl shadow-blue-900/5">
        <div class="flex p-2 bg-blue-50/50 border-b-2 border-blue-100 overflow-x-auto no-scrollbar">
          <div class="flex gap-2 min-w-full">
            <button v-for="tab in tabs" :key="tab.id" @click="activeTab = tab.id"
              :class="activeTab === tab.id ? 'bg-blue-600 text-white shadow-lg' : 'text-blue-500 hover:bg-blue-100'"
              class="flex-1 min-w-[140px] py-3 px-4 rounded-xl transition-all duration-300 flex items-center justify-center gap-3 whitespace-nowrap">
              <span class="text-[11px] font-black uppercase tracking-widest">{{ tab.label }}</span>
              <span class="text-[10px] px-2 py-0.5 rounded-lg font-bold" :class="activeTab === tab.id ? 'bg-white/20 text-white' : 'bg-blue-200/50 text-blue-600'">
                {{ detailData.details[tab.key]?.length || 0 }}
              </span>
            </button>
          </div>
        </div>

        <div class="divide-y-2 divide-blue-100/80">
          <div v-for="item in detailData.details[tabs.find(t => t.id === activeTab).key]" :key="item.id" 
               class="p-5 sm:p-8 hover:bg-blue-50/50 transition-all group">
            
            <div class="flex flex-col lg:flex-row gap-6 lg:gap-8">
              <div class="lg:w-1/5 flex-shrink-0">
                <div class="bg-blue-50 inline-block px-3 py-1 rounded-lg mb-2">
                    <span class="text-sm font-black text-blue-700">{{ item.tanggal }}</span>
                </div>
                <div class="flex items-center gap-2 text-blue-400">
                  <Icon name="ph:user-circle-gear-fill" class="w-4 h-4" />
                  <span class="text-[10px] font-bold uppercase tracking-tight">{{ item.pengamat }}</span>
                </div>
              </div>

              <div class="lg:flex-1 min-w-0">
                <h3 class="text-base sm:text-lg font-black text-blue-900 mb-4 leading-tight group-hover:text-blue-600 transition-colors">
                  {{ item.objek || item.infra || 'Water Level ' + item.no_alat }}
                </h3>
                
                <div class="flex flex-wrap gap-3 mb-5">
                  <template v-if="activeTab === 'harian'">
                    <div class="flex flex-col px-3 py-1.5 bg-white border-2 border-blue-100 rounded-xl min-w-[80px]">
                      <span class="text-[8px] font-bold text-blue-400 uppercase">Kedalaman</span>
                      <span class="text-xs font-black text-blue-800">{{ item.kondisi_riil.kedalaman }}</span>
                    </div>
                    <div class="flex flex-col px-3 py-1.5 bg-white border-2 border-blue-100 rounded-xl min-w-[80px]">
                      <span class="text-[8px] font-bold text-blue-400 uppercase">Aliran</span>
                      <span class="text-xs font-black text-blue-800">{{ item.kondisi_riil.aliran }}</span>
                    </div>
                  </template>
                </div>

                <div class="bg-blue-50/80 p-4 rounded-2xl border border-blue-100 flex items-start gap-3">
                  <div class="mt-1">
                    <Icon name="ph:info-fill" class="w-4 h-4 text-blue-500" />
                  </div>
                  <span class="text-xs sm:text-[13px] font-semibold text-blue-800 leading-relaxed">
                    {{ item.kondisi_riil?.tindakan || item.temuan?.tindakan }}
                  </span>
                </div>
              </div>

              <div class="flex items-center justify-between lg:flex-col lg:justify-center lg:items-end gap-4 flex-shrink-0 lg:border-l-2 lg:border-blue-50 lg:pl-8">
                <div class="text-center lg:text-right">
                  <div class="text-3xl font-black text-blue-900">{{ item.skor || item.skor_breakdown?.final }}</div>
                  <div class="text-[10px] font-black text-blue-400 uppercase tracking-widest">Point</div>
                </div>

                <div class="flex gap-2">
                  <button v-if="item.dokumentasi?.before" @click="openImage(item.dokumentasi.before)" 
                          class="group/btn relative flex items-center justify-center p-3 bg-white border-2 border-blue-200 text-blue-500 rounded-xl hover:border-blue-600 hover:text-blue-600 transition-all shadow-sm">
                    <Icon name="ph:image-square-bold" class="w-6 h-6" />
                    <span class="absolute -top-8 bg-blue-900 text-white text-[8px] px-2 py-1 rounded opacity-0 group-hover/btn:opacity-100 transition-opacity">Before</span>
                  </button>
                  <button v-if="item.dokumentasi?.after" @click="openImage(item.dokumentasi.after)" 
                          class="group/btn relative flex items-center justify-center p-3 bg-blue-600 text-white rounded-xl hover:bg-blue-800 transition-all shadow-lg shadow-blue-600/20">
                    <Icon name="ph:check-circle-bold" class="w-6 h-6" />
                    <span class="absolute -top-8 bg-blue-900 text-white text-[8px] px-2 py-1 rounded opacity-0 group-hover/btn:opacity-100 transition-opacity">After</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
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
  { label: 'Harian', key: 'harian', weight: '40%', icon: 'ph:calendar-check-bold' },
  { label: 'Infra', key: 'mingguan', weight: '30%', icon: 'ph:hard-drive-bold' },
  { label: 'Water', key: 'water_level', weight: '30%', icon: 'ph:waves-bold' }
]

// FETCH DATA WITH PARAMS
const { data: detailData, pending } = await useAsyncData(`analytics-${route.params.id}`, async () => {
  const response = await useApi(`analytics/detail/${route.params.id}`, {
    params: {
      month: route.query.month || new Date().getMonth() + 1,
      year: route.query.year || new Date().getFullYear()
    }
  })
  console.log("📦 Debug API Response:", response.data)
  return response.data
})

const isExporting = ref(false)

const exportDetail = async () => {
  if (isExporting.value) return
  
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
    link.setAttribute('download', `Laporan_Monitoring_Blok_${detailData.value.header.lokasi.blok}.xlsx`)
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

const getStatusStyles = (status) => {
  const s = status || ''
  if (s === 'Kelas 1' || s === 'aman') return 'bg-emerald-50 text-emerald-600 border-emerald-100'
  if (s === 'Kelas 2' || s === 'sedang' || s === 'cukup') return 'bg-amber-50 text-amber-600 border-amber-100'
  if (s === 'Kelas 3' || s === 'buruk' || s === 'kritis') return 'bg-red-50 text-red-600 border-red-100'
  return 'bg-blue-950 text-white border-blue-900'
}

const openImage = (url) => { if (url) window.open(url, '_blank') }
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;700;800&display=swap');
.font-sans { font-family: 'Plus Jakarta Sans', sans-serif; }

.overflow-x-auto::-webkit-scrollbar { height: 6px; }
.overflow-x-auto::-webkit-scrollbar-track { background: transparent; }
.overflow-x-auto::-webkit-scrollbar-thumb { background: #BFDBFE; border-radius: 10px; }
.overflow-x-auto::-webkit-scrollbar-thumb:hover { background: #93C5FD; }
</style>