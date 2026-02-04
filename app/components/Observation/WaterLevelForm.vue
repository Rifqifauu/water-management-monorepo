<template>
  <div class="min-h-screen bg-gray-50 py-8 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100">

      <div class="bg-gradient-to-r from-blue-700 to-blue-500 px-8 py-10 text-white relative overflow-hidden">
        <div class="relative z-10 flex justify-between items-center">
          <div>
            <h2 class="text-3xl font-extrabold tracking-tight">Water Level Observation</h2>
            <p class="mt-2 text-blue-100 text-lg">Monitoring Water Level & Drainage Capacity</p>
          </div>
          <div
            class="bg-white/20 backdrop-blur-md border border-white/30 px-6 py-3 rounded-2xl text-center min-w-[120px]">
            <p class="text-xs font-bold uppercase tracking-wider text-blue-100">Rata-rata Skor</p>
            <p class="text-3xl font-black">{{ averageScore }}</p>
          </div>
        </div>
      </div>

      <div class="p-8">
        <form @submit.prevent="saveData" class="space-y-10">

          <div class="bg-white rounded-xl">
            <div class="flex items-center gap-3 mb-6 border-b border-gray-100 pb-4">
              <div class="bg-blue-100 p-2 rounded-lg text-blue-600">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                  stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                </svg>
              </div>
              <h3 class="text-xl font-bold text-gray-800">Informasi Dasar</h3>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Tanggal <span
                    class="text-red-500">*</span></label>
                <input v-model="form.tanggal" type="date" required :class="cls.input">
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Observer Name <span
                    class="text-red-500">*</span></label>
                <SearchableSelect v-model="form.id_karyawan" :options="listKaryawan" label-key="nama" value-key="id"
                  placeholder="Cari Nama Observer..." />
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-6">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Afdeling <span
                    class="text-red-500">*</span></label>
                <SearchableSelect v-model="selectedAfdeling" :options="uniqueAfdelings" placeholder="Cari Afdeling..."
                  @change="resetBlok" />
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Block <span
                    class="text-red-500">*</span></label>
                <SearchableSelect v-model="selectedBlok" :options="filteredBloks" :disabled="!selectedAfdeling"
                  placeholder="Cari Blok..." />
              </div>
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">No Water Level</label>
                </div>
                <input v-model.number="form.no_water_level" type="text" :class="cls.input"
                  placeholder="Masukkan no water level...">
              </div>
            </div>
          </div>

          <div class="bg-blue-50 rounded-2xl p-6 border border-blue-100 shadow-inner">
            <div class="grid md:grid-cols-2 gap-4 items-center mb-6">
              <div class="flex items-center gap-2">
                <div class="bg-blue-600 p-1.5 rounded-full text-white">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24"
                    stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                </div>
                <h3 class="text-lg font-bold text-gray-800">Koordinat Lokasi</h3>
              </div>
              <button type="button" @click="getGeoLocation"
                class="flex items-center justify-center gap-2 text-sm bg-white text-blue-700 px-4 py-2 rounded-xl border border-blue-200 font-bold shadow-sm hover:bg-blue-50 transition active:scale-95">
                📍 Ambil Lokasi Saat Ini
              </button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <input v-model="form.lat_aktual" type="number" step="any" placeholder="Latitude (contoh: -7.xxx)"
                :class="cls.input">
              <input v-model="form.long_aktual" type="number" step="any" placeholder="Longitude (contoh: 110.xxx)"
                :class="cls.input">
            </div>
          </div>

          <div class="bg-gray-50 p-6 rounded-2xl border border-gray-200">
            <h3 class="text-lg font-bold text-gray-800 mb-6 flex items-center gap-2">
              <span class="bg-blue-600 w-2 h-6 rounded-full"></span> Pengukuran Lapangan (cm)
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Ketinggian Air
                    (cm)</label>
                  <ScoreBadge :skor="scores.ketinggian" />
                </div>
                <input v-model.number="form.tinggi_level_air" type="number" step="0.01" :class="cls.input"
                  placeholder="Masukkan tinggi air...">
              </div>
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Jarak ke Bibir
                    (cm)</label>
                  <ScoreBadge :skor="scores.jarak" />
                </div>
                <input v-model.number="form.jarak_ke_bibir" type="number" step="0.01" :class="cls.input"
                  placeholder="Masukkan jarak ke bibir...">
              </div>
            </div>
          </div>

          <div class="bg-white">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Kondisi Aliran</label>
                  <ScoreBadge :skor="scores.aliran" />
                </div>
                <select v-model="form.kondisi_aliran" required :class="cls.select">
                  <option value="" disabled>Pilih Aliran</option>
                  <option v-for="opt in getOptions('Kondisi Aliran')" :key="opt.id" :value="opt.label_kondisi">{{
                    opt.label_kondisi }}</option>
                </select>
              </div>
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Risiko</label>
                  <ScoreBadge :skor="scores.risiko" />
                </div>
                <select v-model="form.risiko" required :class="cls.select">
                  <option value="" disabled>Pilih Risiko</option>
                  <option v-for="opt in getOptions('Risiko')" :key="opt.id" :value="opt.label_kondisi">{{
                    opt.label_kondisi }}</option>
                </select>
              </div>
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Kapasitas
                    Drainase</label>
                  <ScoreBadge :skor="scores.drainase" />
                </div>
                <select v-model="form.kapasitas_drainase" required :class="cls.select">
                  <option value="" disabled>Pilih Kapasitas</option>
                  <option v-for="opt in getOptions('Kapasitas Drainase')" :key="opt.id" :value="opt.label_kondisi">{{
                    opt.label_kondisi }}</option>
                </select>
              </div>
            </div>
          </div>

          <div class="bg-gray-50 p-6 rounded-2xl border border-gray-200">
            <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Foto Lokasi <span
                class="text-red-500">*</span></label>
            <div @click="$refs.fileInput.click()" :class="cls.uploadBox">
              <div v-if="!previewUrl" class="text-center">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path
                    d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"
                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
                <p class="text-xs font-bold text-blue-600 mt-2 uppercase tracking-widest">Klik Upload Foto</p>
              </div>
              <div v-else class="relative w-full flex justify-center h-full p-2">
                <img :src="previewUrl" class="h-full w-auto rounded-lg shadow-md object-cover" />
                <button type="button" @click.stop="clearImage" :class="cls.delBtn">✕</button>
              </div>
              <input ref="fileInput" type="file" @change="handleFileUpload" accept="image/*" class="hidden" />
            </div>
            <div class="mt-6">
              <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Keterangan
                Tambahan</label>
              <textarea v-model="form.keterangan" rows="3" :class="cls.input"
                placeholder="Catatan tambahan..."></textarea>
            </div>
          </div>

          <div class="flex flex-col md:flex-row gap-4 pt-4 border-t border-gray-200">
            <button type="submit" :disabled="isLoading" :class="cls.btnPrimary">
              Save Observation
            </button>
            <button type="button" @click="$emit('close')"
              class="px-8 py-4 border-2 border-gray-300 rounded-xl font-bold text-gray-600 hover:bg-gray-100 transition">
              Cancel
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive, ref, onMounted, computed, watch, h } from 'vue'
import Swal from 'sweetalert2'
import { useApi } from '@/composables/useApi'

const props = defineProps({
  skoringData: { type: Array, default: () => [] }
})

const ScoreBadge = ({ skor }) => {
  if (!skor) return null
  const colors = skor === 3 ? 'bg-green-500 text-white' : skor === 2 ? 'bg-yellow-500 text-white' : 'bg-red-500 text-white'
  return h('span', { class: `px-2 py-0.5 rounded text-[10px] font-black ${colors}` }, `SKOR: ${skor}`)
}

const cls = {
  input: "w-full px-4 py-3 bg-white border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 font-medium text-gray-700 transition-all",
  select: "w-full px-4 py-3 bg-white border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 font-medium text-gray-700 appearance-none",
  uploadBox: "mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-xl bg-white hover:bg-gray-50 transition cursor-pointer relative min-h-[160px] items-center",
  delBtn: "absolute top-2 right-2 bg-red-600 text-white w-7 h-7 rounded-full flex items-center justify-center shadow-lg hover:bg-red-700",
  btnPrimary: "flex-1 flex justify-center items-center gap-3 bg-blue-600 text-white py-4 rounded-xl font-bold text-lg shadow-lg hover:bg-blue-700 transition transform active:scale-95 disabled:opacity-70"
}

const listKaryawan = ref([]), listLokasi = ref([])
const selectedAfdeling = ref(''), selectedBlok = ref(''), isLoading = ref(false)
const previewUrl = ref(null), photoFile = ref(null)

const form = reactive({
  tanggal: new Date().toISOString().substr(0, 10),
  id_lokasi: '',
  id_karyawan: '',
  lat_aktual: '',
  long_aktual: '',
  no_water_level: null, // Default set to 1
  tinggi_level_air: null,
  jarak_ke_bibir: null,
  kondisi_aliran: '',
  risiko: '',
  kapasitas_drainase: '',
  keterangan: ''
})

// --- GPS HANDLER ---
const getGeoLocation = () => {
  if (!navigator.geolocation) return Swal.fire('Error', 'GPS tidak didukung oleh browser Anda', 'error')

  Swal.fire({
    title: 'Mencari Koordinat...',
    text: 'Mohon tunggu sebentar',
    allowOutsideClick: false,
    didOpen: () => Swal.showLoading()
  })

  navigator.geolocation.getCurrentPosition(pos => {
    form.lat_aktual = pos.coords.latitude
    form.long_aktual = pos.coords.longitude
    Swal.close()
    Swal.fire({ toast: true, position: 'top-end', icon: 'success', title: 'Lokasi berhasil didapatkan', timer: 2000, showConfirmButton: false })
  }, err => {
    Swal.close()
    Swal.fire('Error GPS', 'Gagal mengambil lokasi. Pastikan izin GPS aktif.', 'error')
  }, { enableHighAccuracy: true })
}

// --- LOGIC SKORING ---
const getOptions = (param) => props.skoringData.filter(i => i.kategori_parameter === param && i.label_kondisi !== null)

const calculateRangeScore = (paramName, value) => {
  if (value === null || value === undefined || value === '') return 0
  const rules = props.skoringData.filter(i => i.kategori_parameter === paramName)
  for (const rule of rules) {
    const min = rule.min_value ? parseFloat(rule.min_value) : -Infinity
    const max = rule.max_value ? parseFloat(rule.max_value) : Infinity
    if (value >= min && value <= max) return rule.skor
  }
  return 0
}

const scores = computed(() => {
  const getSelectSkor = (param, val) => props.skoringData.find(i => i.kategori_parameter === param && i.label_kondisi === val)?.skor || 0
  return {
    ketinggian: calculateRangeScore('Ketinggian Air', form.tinggi_level_air),
    jarak: calculateRangeScore('Jarak ke Bibir', form.jarak_ke_bibir),
    aliran: getSelectSkor('Kondisi Aliran', form.kondisi_aliran),
    risiko: getSelectSkor('Risiko', form.risiko),
    drainase: getSelectSkor('Kapasitas Drainase', form.kapasitas_drainase)
  }
})

const averageScore = computed(() => {
  const vals = Object.values(scores.value).filter(s => s > 0)
  return vals.length ? (vals.reduce((a, b) => a + b, 0) / vals.length).toFixed(2) : "0.00"
})

// --- FILE HANDLERS ---
const handleFileUpload = (e) => {
  const file = e.target.files[0]
  if (!file) return
  if (file.size > 5 * 1024 * 1024) return Swal.fire('Error', 'Ukuran foto maksimal 5MB', 'error')
  photoFile.value = file
  previewUrl.value = URL.createObjectURL(file)
}
const clearImage = () => { photoFile.value = null; previewUrl.value = null }

// --- SAVE DATA ---
const saveData = async () => {
  if (!form.id_lokasi) return Swal.fire('Error', 'Pilih lokasi terlebih dahulu', 'error')
  if (!photoFile.value) return Swal.fire('Error', 'Foto wajib diunggah', 'error')

  isLoading.value = true
  const fd = new FormData()

  // Masukkan data form
  Object.keys(form).forEach(k => fd.append(k, form[k] ?? ''))

  // Masukkan data skor
  fd.append('skor_ketinggian', scores.value.ketinggian)
  fd.append('skor_jarak', scores.value.jarak)
  fd.append('skor_aliran', scores.value.aliran)
  fd.append('skor_risiko', scores.value.risiko)
  fd.append('skor_drainase', scores.value.drainase)
  fd.append('rata_rata_skor', averageScore.value)
  fd.append('foto_path', photoFile.value)

  try {
    await useApi('water-level', { method: 'POST', body: fd })
    await Swal.fire('Berhasil', 'Data berhasil disimpan', 'success')
    location.reload()
  } catch (e) {
    Swal.fire('Error', 'Gagal menyimpan data ke server', 'error')
  } finally {
    isLoading.value = false
  }
}

// Master Data Logic
const uniqueAfdelings = computed(() => [...new Set(listLokasi.value.map(i => i.afdeling))].sort())
const filteredBloks = computed(() => listLokasi.value.filter(i => i.afdeling === selectedAfdeling.value).map(i => i.blok).sort())
const resetBlok = () => { selectedBlok.value = ''; form.id_lokasi = '' }

watch([selectedAfdeling, selectedBlok], ([a, b]) => {
  form.id_lokasi = (a && b) ? (listLokasi.value.find(l => l.afdeling === a && l.blok === b)?.id || '') : ''
})

onMounted(async () => {
  const [kar, lok] = await Promise.all([useApi('list/karyawan'), useApi('list/lokasi')])
  listKaryawan.value = kar; listLokasi.value = lok
})
</script>