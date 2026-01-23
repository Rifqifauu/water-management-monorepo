<template>
  <div class="min-h-screen bg-gray-50 py-8 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100">

      <div class="bg-gradient-to-r from-blue-700 to-blue-500 px-8 py-10 text-white relative overflow-hidden">
        <div class="relative z-10 flex justify-between items-center">
          <div>
            <h2 class="text-3xl font-extrabold tracking-tight">Daily Observation</h2>
            <p class="mt-2 text-blue-100 text-lg">Form pencatatan observasi lapangan harian.</p>
          </div>
          <div class="bg-white/20 backdrop-blur-md border border-white/30 px-6 py-3 rounded-2xl text-center">
            <p class="text-xs font-bold uppercase tracking-wider text-blue-100">Rata-rata Skor</p>
            <p class="text-3xl font-black">{{ averageScore }}</p>
          </div>
        </div>
        <svg class="absolute right-0 bottom-0 h-full w-48 text-white opacity-10 transform translate-x-10 translate-y-10"
          fill="currentColor" viewBox="0 0 100 100">
          <circle cx="50" cy="50" r="50" />
        </svg>
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
          <div class="bg-white">
            <div class="flex items-center gap-3 mb-6 border-b border-gray-100 pb-4">
              <div class="bg-indigo-100 p-2 rounded-lg text-indigo-600">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                  stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                </svg>
              </div>
              <h3 class="text-xl font-bold text-gray-800">Detail Lapangan</h3>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Tipe Objek</label>
                <select v-model="form.tipe_objek" :class="cls.select" @change="resetDynamicFields">
                  <option value="">Pilih Objek</option>
                  <option v-for="unit in availableUnits" :key="unit" :value="unit">{{ unit }}</option>
                </select>
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Nomor Jalur</label>
                <input v-model="form.nomor_jalur" type="text" :class="cls.input">
              </div>
              <div v-if="hasParam('Kedalaman')">
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Kedalaman (cm)</label>
                  <ScoreBadge :skor="scores.kedalaman" />
                </div>
                <input v-model="form.kedalaman_cm" type="number" :class="cls.input">
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
              <div v-if="hasParam('Jumlah Pokok Terdampak')">
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Jumlah Pokok</label>
                  <ScoreBadge :skor="scores.jumlah_pokok" />
                </div>
                <input v-model="form.jumlah_pokok" type="number" :class="cls.input">
              </div>
              <div v-if="hasParam('Durasi')">
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Durasi</label>
                  <ScoreBadge :skor="scores.durasi" />
                </div>
                <select v-model="form.durasi_genangan" :class="cls.select">
                  <pre class="text-[10px] text-red-500">{{ getOptions('Durasi') }}</pre>
                  <option value="">Pilih Durasi</option>
                  <option v-for="opt in getOptions('Durasi')" :key="opt.id" :value="opt.label_kondisi">{{
                    opt.label_kondisi }}</option>
                </select>
              </div>
              <div v-if="hasParam('Aliran')">
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Aliran</label>
                  <ScoreBadge :skor="scores.aliran" />
                </div>
                <select v-model="form.kondisi_aliran" :class="cls.select">
                  <option value="">Pilih Aliran</option>
                  <option v-for="opt in getOptions('Aliran')" :key="opt.id" :value="opt.label_kondisi">{{
                    opt.label_kondisi }}</option>
                </select>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Penyebab</label>
                  <ScoreBadge :skor="scores.penyebab" />
                </div>
                <select v-model="form.penyebab" required :class="cls.select">
                  <option value="" disabled>Pilih Penyebab</option>
                  <option v-for="opt in getOptions('Penyebab')" :key="opt.id" :value="opt.label_kondisi">{{
                    opt.label_kondisi }}</option>
                </select>
              </div>
              <div>
                <div class="flex justify-between items-center mb-2">
                  <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Tindakan</label>
                  <ScoreBadge :skor="scores.tindakan" />
                </div>
                <select v-model="form.tindakan" :class="cls.select">
                  <option value="">Pilih Tindakan</option>
                  <option v-for="opt in getOptions('Tindakan')" :key="opt.id" :value="opt.label_kondisi">{{
                    opt.label_kondisi }}</option>
                </select>
              </div>
            </div>
          </div>

          <div class="bg-gray-50 p-6 rounded-2xl border border-gray-200">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">
                  Foto Lapangan (Before) <span class="text-red-500">*</span>
                </label>
                <div @click="$refs.fileInputBefore.click()" :class="cls.uploadBox">
                  <div class="text-center" v-if="!previewUrl">
                    <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                      <path
                        d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    <p class="text-xs font-bold text-blue-600 mt-2 tracking-wide">Klik untuk Upload Before</p>
                  </div>
                  <div v-else class="relative w-full flex justify-center h-full p-2">
                    <img :src="previewUrl" class="h-full w-auto rounded-lg shadow-md border object-cover" />
                    <button type="button" @click.stop="clearImage('before')" :class="cls.delBtn">✕</button>
                  </div>
                  <input ref="fileInputBefore" type="file" @change="e => handleFileUpload(e, 'before')" accept="image/*"
                    class="hidden" />
                </div>
              </div>

              <div v-if="form.tindakan && form.tindakan !== 'Tidak Perlu'">
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">
                  Foto Lapangan (After) <span class="text-red-500">*</span>
                </label>
                <div @click="$refs.fileInputAfter.click()" :class="cls.uploadBox">
                  <div class="text-center" v-if="!previewAfterUrl">
                    <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                      <path
                        d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    <p class="text-xs font-bold text-green-600 mt-2 tracking-wide">Klik untuk Upload After</p>
                  </div>
                  <div v-else class="relative w-full flex justify-center h-full p-2">
                    <img :src="previewAfterUrl" class="h-full w-auto rounded-lg shadow-md border object-cover" />
                    <button type="button" @click.stop="clearImage('after')" :class="cls.delBtn">✕</button>
                  </div>
                  <input ref="fileInputAfter" type="file" @change="e => handleFileUpload(e, 'after')" accept="image/*"
                    class="hidden" />
                </div>
              </div>

            </div>
          </div>

          <div class="flex flex-col md:flex-row gap-4 pt-4 border-t border-gray-200">
            <button type="submit" :disabled="isLoading" :class="cls.btnPrimary">
              <span v-if="!isLoading">Save Observation</span>
              <span v-else>Processing...</span>
            </button>
            <button type="button" @click="$emit('close')" :disabled="isLoading"
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
const fileInputBefore = ref(null)
const fileInputAfter = ref(null)
const props = defineProps({
  skoringData: { type: Array, default: () => [] }
})

const ScoreBadge = ({ skor }) => {
  if (!skor) return null
  const colors = skor === 3 ? 'bg-green-100 text-green-700' : skor === 2 ? 'bg-orange-100 text-orange-700' : 'bg-red-100 text-red-700'
  return h('span', { class: `px-2 py-0.5 rounded text-[10px] font-black ${colors}` }, `SKOR: ${skor}`)
}
const clearImage = (type) => {
  if (type === 'before') {
    if (previewUrl.value) URL.revokeObjectURL(previewUrl.value)
    previewUrl.value = null
    photoFile.value = null
    if (fileInputBefore.value) fileInputBefore.value.value = ''
  } else {
    if (previewAfterUrl.value) URL.revokeObjectURL(previewAfterUrl.value)
    previewAfterUrl.value = null
    photoAfterFile.value = null
    if (fileInputAfter.value) fileInputAfter.value.value = ''
  }
}

const cls = {
  input: "w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 font-medium text-gray-700",
  select: "w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 font-medium text-gray-700",
  uploadBox: "mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-xl bg-white hover:bg-gray-50 transition cursor-pointer relative min-h-[160px] items-center",
  delBtn: "absolute top-2 right-2 bg-red-600 text-white w-7 h-7 rounded-full flex items-center justify-center shadow-lg",
  btnPrimary: "flex-1 flex justify-center items-center gap-3 bg-blue-600 text-white py-4 rounded-xl font-bold text-lg shadow-lg hover:bg-blue-700 transition transform disabled:opacity-70"
}

// Refs
const selectedAfdeling = ref(''), selectedBlok = ref(''), isLoading = ref(false)
const listKaryawan = ref([]), listLokasi = ref([])

// Files
const previewUrl = ref(null), photoFile = ref(null), fileInput = ref(null)
const previewAfterUrl = ref(null), photoAfterFile = ref(null)

const form = reactive({
  tanggal: new Date().toISOString().substr(0, 10), id_lokasi: '', id_karyawan: '',
  lat_aktual: '', long_aktual: '', tipe_objek: '', nomor_jalur: '', kedalaman_cm: '',
  jumlah_pokok: '', durasi_genangan: '', kondisi_aliran: '', penyebab: '', tindakan: '', keterangan: ''
})

// --- DATA LOGIC ---
const availableUnits = computed(() => [...new Set(props.skoringData.map(i => i.unit))])
const getOptions = (param) => props.skoringData.filter(i => i.unit === form.tipe_objek && i.kategori_parameter === param && i.label_kondisi !== null)
const hasParam = (param) => props.skoringData.some(i => i.unit === form.tipe_objek && i.kategori_parameter === param)

const scores = computed(() => {
  const getSkor = (param, value, isNumeric = false) => {
    if (!form.tipe_objek || value === '' || value === null) return 0
    const criteria = props.skoringData.filter(i => i.unit === form.tipe_objek && i.kategori_parameter === param)
    if (isNumeric) {
      const val = parseFloat(value)
      const match = criteria.find(c => {
        const min = c.min_value ? parseFloat(c.min_value) : -Infinity
        const max = c.max_value ? parseFloat(c.max_value) : Infinity
        return val >= min && val <= max
      })
      return match ? match.skor : 0
    }
    return criteria.find(c => c.label_kondisi === value)?.skor || 0
  }
  return {
    kedalaman: getSkor('Kedalaman', form.kedalaman_cm, true),
    aliran: getSkor('Aliran', form.kondisi_aliran),
    durasi: getSkor('Durasi', form.durasi_genangan),
    jumlah_pokok: getSkor('Jumlah Pokok Terdampak', form.jumlah_pokok, true),
    penyebab: getSkor('Penyebab', form.penyebab),
    tindakan: getSkor('Tindakan', form.tindakan)
  }
})

const averageScore = computed(() => {
  const active = Object.values(scores.value).filter(s => s > 0)
  return active.length ? (active.reduce((a, b) => a + b, 0) / active.length).toFixed(2) : "0.00"
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


// Update fungsi handleFileUpload agar lebih akurat
const handleFileUpload = (e, type) => {
  const file = e.target.files[0]
  if (!file) return
  if (file.size > 10 * 1024 * 1024) {
    return Swal.fire('Error', 'Ukuran file maksimal 10MB', 'error')
  }

  const url = URL.createObjectURL(file)
  if (type === 'before') {
    photoFile.value = file
    previewUrl.value = url
  } else {
    photoAfterFile.value = file
    previewAfterUrl.value = url
  }
}

// Update fungsi saveData untuk menyertakan foto After
const saveData = async () => {
  // Validasi Dasar
  if (!form.id_lokasi) return Swal.fire('Warning', 'Pilih Lokasi', 'warning')
  if (!photoFile.value) return Swal.fire('Warning', 'Foto Before wajib diunggah', 'warning')

  // Validasi Foto After jika ada tindakan
  const perluAfter = form.tindakan && form.tindakan !== 'Tidak Perlu'
  if (perluAfter && !photoAfterFile.value) {
    return Swal.fire('Warning', 'Foto After wajib diunggah untuk tindakan yang dipilih', 'warning')
  }

  isLoading.value = true
  const fd = new FormData()

  Object.keys(form).forEach(k => fd.append(k, form[k] ?? ''))

  fd.append('skor_kedalaman', scores.value.kedalaman)
  fd.append('skor_aliran', scores.value.aliran)
  fd.append('skor_durasi', scores.value.durasi)
  fd.append('skor_jumlah_pokok', scores.value.jumlah_pokok)
  fd.append('skor_penyebab', scores.value.penyebab)
  fd.append('skor_tindakan', scores.value.tindakan)
  fd.append('rata_rata_skor', averageScore.value)

  if (photoFile.value) fd.append('foto_path', photoFile.value)
  if (photoAfterFile.value && perluAfter) fd.append('foto_after', photoAfterFile.value)

  try {
    await useApi('monitoring-harian', { method: 'POST', body: fd })
    await Swal.fire('Berhasil', 'Data observasi berhasil disimpan', 'success')
    location.reload()
  } catch (e) {
    Swal.fire('Error', 'Gagal menyimpan data ke server', 'error')
  } finally {
    isLoading.value = false
  }
}

// Lokasi Logic
const uniqueAfdelings = computed(() => [...new Set(listLokasi.value.map(i => i.afdeling))].sort())
const filteredBloks = computed(() => listLokasi.value.filter(i => i.afdeling === selectedAfdeling.value).map(i => i.blok).sort())
watch([selectedAfdeling, selectedBlok], ([a, b]) => {
  form.id_lokasi = (a && b) ? (listLokasi.value.find(l => l.afdeling === a && l.blok === b)?.id || '') : ''
})

const resetDynamicFields = () => {
  form.kedalaman_cm = ''; form.jumlah_pokok = ''; form.durasi_genangan = '';
  form.kondisi_aliran = ''; form.penyebab = ''; form.tindakan = ''
}
const resetBlok = () => { selectedBlok.value = ''; form.id_lokasi = '' }

onMounted(async () => {
  const [kar, lok] = await Promise.all([useApi('list/karyawan'), useApi('list/lokasi')])
  listKaryawan.value = kar; listLokasi.value = lok
})
</script>