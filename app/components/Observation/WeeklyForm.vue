<template>
  <div class="min-h-screen bg-gray-50 py-8 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100">
      
      <div class="bg-gradient-to-r from-blue-700 to-blue-500 px-8 py-10 text-white relative overflow-hidden">
        <div class="relative z-10 flex justify-between items-center">
          <div>
            <h2 class="text-3xl font-extrabold tracking-tight">Weekly Observation</h2>
            <p class="mt-2 text-blue-100 text-lg">Monitoring Infrastruktur & Saluran Mingguan.</p>
          </div>
          <div class="bg-white/20 backdrop-blur-md border border-white/30 px-6 py-3 rounded-2xl text-center min-w-[120px]">
            <p class="text-xs font-bold uppercase tracking-wider text-blue-100">Rata-rata Skor</p>
            <p class="text-3xl font-black">{{ averageScore }}</p>
          </div>
        </div>
        <svg class="absolute right-0 bottom-0 h-full w-48 text-white opacity-10 transform translate-x-10 translate-y-10" fill="currentColor" viewBox="0 0 100 100">
          <circle cx="50" cy="50" r="50"/>
        </svg>
      </div>

      <div class="p-8">
        <form @submit.prevent="saveData" class="space-y-10">
          
          <div class="bg-white rounded-xl">
            <div class="flex items-center gap-3 mb-6 border-b border-gray-100 pb-4">
              <div class="bg-blue-100 p-2 rounded-lg text-blue-600">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" /></svg>
              </div>
              <h3 class="text-xl font-bold text-gray-800">Informasi Dasar</h3>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Tanggal <span class="text-red-500">*</span></label>
                <input v-model="form.tanggal" type="date" required :class="cls.input">
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Observer Name <span class="text-red-500">*</span></label>
                <SearchableSelect 
                  v-model="form.id_karyawan" 
                  :options="listKaryawan" 
                  label-key="nama" 
                  value-key="id" 
                  placeholder="Cari Nama Observer..." 
                />
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-6">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Afdeling <span class="text-red-500">*</span></label>
                <SearchableSelect v-model="selectedAfdeling" :options="uniqueAfdelings" placeholder="Cari Afdeling..." @change="resetBlok" />
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Block <span class="text-red-500">*</span></label>
                <SearchableSelect v-model="selectedBlok" :options="filteredBloks" :disabled="!selectedAfdeling" placeholder="Cari Blok..." />
              </div>
            </div>
          </div>

          <div class="bg-blue-50 rounded-2xl p-6 border border-blue-100 shadow-inner">
            <div class="grid md:grid-cols-2 gap-4 items-center mb-6">
                <div class="flex items-center gap-2">
                  <div class="bg-blue-600 p-1.5 rounded-full text-white">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
                  </div>
                  <h3 class="text-lg font-bold text-gray-800">Koordinat Lokasi</h3>
                </div>
                <button type="button" @click="getGeoLocation" class="flex items-center justify-center gap-2 text-sm bg-white text-blue-700 px-4 py-2 rounded-xl border border-blue-200 font-bold shadow-sm hover:bg-blue-50 transition active:scale-95">
                    📍 Ambil Lokasi Saat Ini
                </button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <input v-model="form.lat_aktual" type="number" step="any" placeholder="Latitude (contoh: -7.xxx)" :class="cls.input">
              <input v-model="form.long_aktual" type="number" step="any" placeholder="Longitude (contoh: 110.xxx)" :class="cls.input">
            </div>
          </div>

          <div class="bg-white">
            <div class="flex items-center gap-3 mb-6 border-b border-gray-100 pb-4">
              <div class="bg-indigo-100 p-2 rounded-lg text-indigo-600">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" /></svg>
              </div>
              <h3 class="text-xl font-bold text-gray-800">Detail Lapangan</h3>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
              <div>
                 <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">ID OBJEK</label>
                 <input v-model="form.id_objek" required type="text" :class="cls.input" placeholder="ID Objek (Tanpa Spasi)">
              </div>
              <div>
                 <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Tipe Objek</label>
                 <select v-model="form.jenis_infrastruktur" required :class="cls.select">
                    <option value="">Pilih Infrastruktur</option>
                    <option value="Jembatan">Jembatan</option>
                    <option value="Pipa (PVC)">Pipa (PVC)</option>
                    <option value="Gorong-Gorong Baja (NF)">Gorong-Gorong Baja (NF)</option>
                 </select>
              </div>
              <div>
                 <div class="flex justify-between items-center mb-2">
                   <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Kondisi Aliran</label>
                   <ScoreBadge :skor="scores.aliran" />
                 </div>
                 <select v-model="form.kondisi_aliran" required :class="cls.select">
                    <option value="" disabled>Pilih Aliran</option>
                    <option v-for="opt in getOptions('Aliran')" :key="opt.id" :value="opt.label_kondisi">{{ opt.label_kondisi }}</option>
                 </select>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
               <div>
                 <div class="flex justify-between items-center mb-2">
                   <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Penyebab</label>
                   <ScoreBadge :skor="scores.penyebab" />
                 </div>
                 <select v-model="form.penyebab" required :class="cls.select">
                    <option value="" disabled>Pilih Penyebab</option>
                    <option v-for="opt in getOptions('Penyebab')" :key="opt.id" :value="opt.label_kondisi">{{ opt.label_kondisi }}</option>
                 </select>
              </div>
               <div>
                 <div class="flex justify-between items-center mb-2">
                   <label class="block text-sm font-bold text-gray-700 uppercase tracking-wide">Tindakan</label>
                   <ScoreBadge :skor="scores.tindakan" />
                 </div>
                 <select v-model="form.tindakan" required :class="cls.select">
                    <option value="" disabled>Pilih Tindakan</option>
                    <option v-for="opt in getOptions('Tindakan')" :key="opt.id" :value="opt.label_kondisi">{{ opt.label_kondisi }}</option>
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
            <button type="button" @click="$emit('close')" :disabled="isLoading" class="px-8 py-4 border-2 border-gray-300 rounded-xl font-bold text-gray-600 hover:bg-gray-100 transition">
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
  if (!skor || skor === 0) return null
  const colors = skor === 3 ? 'bg-green-100 text-green-700' : skor === 2 ? 'bg-orange-100 text-orange-700' : 'bg-red-100 text-red-700'
  return h('span', { class: `px-2 py-0.5 rounded text-[10px] font-black ${colors}` }, `SKOR: ${skor}`)
}

const cls = {
  input: "w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 font-medium text-gray-700 transition-all",
  select: "w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 font-medium text-gray-700 appearance-none",
  uploadBox: "mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-xl bg-white hover:bg-gray-50 transition cursor-pointer relative min-h-[160px] items-center",
  delBtn: "absolute top-2 right-2 bg-red-600 text-white w-7 h-7 rounded-full flex items-center justify-center shadow-lg hover:bg-red-700",
  btnPrimary: "flex-1 flex justify-center items-center gap-3 bg-blue-600 text-white py-4 rounded-xl font-bold text-lg shadow-lg hover:bg-blue-700 transition transform active:scale-95 disabled:opacity-70"
}

// State Data
const listKaryawan = ref([]), listLokasi = ref([])
const selectedAfdeling = ref(''), selectedBlok = ref(''), isLoading = ref(false)

const previewUrl = ref(null), photoFile = ref(null)
const previewAfterUrl = ref(null), photoAfterFile = ref(null)

const form = reactive({
  tanggal: new Date().toISOString().substr(0, 10), 
  id_lokasi: '', 
  id_karyawan: '',
  id_objek: '',
  lat_aktual: '', 
  long_aktual: '', 
  jenis_infrastruktur: '', 
  kondisi_aliran: '', 
  penyebab: '', 
  tindakan: '', 
  keterangan: ''
})

// --- LOGIC SKORING BERDASARKAN JSON ---
const getOptions = (param) => props.skoringData.filter(i => i.kategori_parameter === param && i.label_kondisi !== null)

const scores = computed(() => {
  const findSkor = (param, value) => {
    if (!value) return 0
    return props.skoringData.find(i => i.kategori_parameter === param && i.label_kondisi === value)?.skor || 0
  }
  return {
    aliran: findSkor('Aliran', form.kondisi_aliran),
    penyebab: findSkor('Penyebab', form.penyebab),
    tindakan: findSkor('Tindakan', form.tindakan)
  }
})

const averageScore = computed(() => {
  const vals = Object.values(scores.value).filter(s => s > 0)
  return vals.length ? (vals.reduce((a, b) => a + b, 0) / vals.length).toFixed(2) : "0.00"
})

// --- GPS HANDLER ---
const getGeoLocation = () => {
    if (!navigator.geolocation) return Swal.fire('Error', 'GPS tidak didukung', 'error')
    Swal.fire({ title: 'Mencari Koordinat...', allowOutsideClick: false, didOpen: () => Swal.showLoading() })
    
    navigator.geolocation.getCurrentPosition(pos => {
        form.lat_aktual = pos.coords.latitude; form.long_aktual = pos.coords.longitude
        Swal.close()
        Swal.fire({ toast: true, position: 'top-end', icon: 'success', title: 'Lokasi didapat', timer: 2000, showConfirmButton: false })
    }, err => {
        Swal.close(); Swal.fire('Error', err.message, 'error')
    })
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

    fd.append('skor_aliran', scores.value.aliran)
    fd.append('skor_penyebab', scores.value.penyebab)
    fd.append('skor_tindakan', scores.value.tindakan)
    fd.append('rata_rata_skor', averageScore.value)

  if (photoFile.value) fd.append('foto_path', photoFile.value)
  if (photoAfterFile.value && perluAfter) fd.append('foto_after', photoAfterFile.value)

  try {
    await useApi('monitoring-mingguan', { method: 'POST', body: fd })
    await Swal.fire('Berhasil', 'Data observasi berhasil disimpan', 'success')
    location.reload()
  } catch (e) {
    Swal.fire('Error', 'Gagal menyimpan data ke server', 'error')
  } finally {
    isLoading.value = false
  }
}
// --- MASTER DATA LOGIC ---
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