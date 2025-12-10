<template>
  <div class="min-h-screen bg-gray-50 py-8 px-4 sm:px-6 lg:px-8">
    <div class="max-w-6xl mx-auto bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100">
      
      <div class="bg-gradient-to-r from-blue-700 to-blue-500 px-8 py-10 text-white relative overflow-hidden">
        <div class="relative z-10">
          <h2 class="text-3xl font-extrabold tracking-tight">Weekly Observation</h2>
          <p class="mt-2 text-blue-100 text-lg">Form pencatatan observasi lapangan mingguan.</p>
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
                <input v-model="form.tanggal" type="date" required
                  class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all font-medium text-gray-700">
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Observer Name <span class="text-red-500">*</span></label>
                <div class="relative">
                  <select v-model="form.id_karyawan" required
                    class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 appearance-none font-medium text-gray-700">
                    <option value="" disabled>Select Observer</option>
                    <option v-for="karyawan in listKaryawan" :key="karyawan.id" :value="karyawan.id">
                      {{ karyawan.nama }}
                    </option>
                  </select>
                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" /></svg>
                  </div>
                </div>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-6">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Afdeling <span class="text-red-500">*</span></label>
                <div class="relative">
                  <select v-model="selectedAfdeling" @change="resetBlok" required
                    class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 appearance-none font-medium text-gray-700">
                    <option value="" disabled>Select Afdeling</option>
                    <option v-for="afd in uniqueAfdelings" :key="afd" :value="afd">{{ afd }}</option>
                  </select>
                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" /></svg>
                  </div>
                </div>
              </div>
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Block <span class="text-red-500">*</span></label>
                <div class="relative">
                  <select v-model="selectedBlok" :disabled="!selectedAfdeling" required
                    class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 appearance-none font-medium text-gray-700 disabled:bg-gray-200 disabled:text-gray-400 disabled:cursor-not-allowed"
                    :class="selectedAfdeling ? 'bg-gray-50' : ''">
                    <option value="" disabled>Select Block</option>
                    <option v-for="blok in filteredBloks" :key="blok" :value="blok">{{ blok }}</option>
                  </select>
                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
                    <svg class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" /></svg>
                  </div>
                </div>
                <transition enter-active-class="transition ease-out duration-200" enter-from-class="opacity-0 -translate-y-2" enter-to-class="opacity-100 translate-y-0">
                  <div v-if="form.id_lokasi" class="mt-2 flex items-center text-sm text-green-600 font-bold bg-green-50 px-3 py-1 rounded-lg w-fit">
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    Lokasi Terdeteksi (ID: {{ form.id_lokasi }})
                  </div>
                </transition>
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
                <button type="button" @click="getGeoLocation" class="flex items-center gap-2 text-xs text-sm bg-white text-blue-700 px-4 py-2 rounded-xl border border-blue-200 font-bold shadow-sm hover:shadow-md hover:bg-blue-50 transition active:scale-95">
                    📍 Ambil Lokasi Saat Ini
                </button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label class="block text-xs font-bold text-blue-800 uppercase tracking-wide mb-1">Latitude</label>
                <input v-model="form.lat_aktual" type="number" step="any"
                  class="w-full px-5 py-3 bg-white border border-blue-200 rounded-xl text-gray-700 font-mono focus:ring-2 focus:ring-blue-400 focus:border-blue-400" placeholder="-7.xxxxx">
              </div>
              <div>
                <label class="block text-xs font-bold text-blue-800 uppercase tracking-wide mb-1">Longitude</label>
                <input v-model="form.long_aktual" type="number" step="any"
                  class="w-full px-5 py-3 bg-white border border-blue-200 rounded-xl text-gray-700 font-mono focus:ring-2 focus:ring-blue-400 focus:border-blue-400" placeholder="110.xxxxx">
              </div>
            </div>
          </div>

          <div>
             <div class="flex items-center gap-3 mb-6 border-b border-gray-100 pb-4">
              <div class="bg-indigo-100 p-2 rounded-lg text-indigo-600">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" /></svg>
              </div>
              <h3 class="text-xl font-bold text-gray-800">Detail Lapangan</h3>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
              <div>
                 <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Tipe Objek</label>
                 <select v-model="form.jenis_infrastruktur" class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-medium">
                    <option value="">Pilih Infrastuktur</option>
                   <option value="Jembatan">Jembatan</option>
                   <option value="Pipa (PVC)">Pipa (PVC)</option>
                   <option value="Gorong-Gorong Baja (NF)">Gorong-Gorong Baja (NF)</option>
                 </select>            
              </div>
              <div>
                 <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Kondisi Aliran</label>
                 <select v-model="form.kondisi_aliran" required
                    class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-medium">
                    <option value="" disabled>Kondisi Aliran</option>
                    <option v-for="kondisi in listKondisi" :key="kondisi.id" :value="kondisi.label_kondisi">
                      {{ kondisi.label_kondisi }}
                    </option>
                  </select>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
               <div>
                 <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Penyebab</label>
                   <select v-model="form.penyebab" required
                    class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-medium">
                    <option value="" disabled>Penyebab Masalah</option>
                    <option v-for="penyebab in listPenyebab" :key="penyebab.id" :value="penyebab.label_kondisi">
                      {{ penyebab.label_kondisi }}
                    </option>
                  </select>
              </div>
               <div>
                 <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Tindakan</label>
                 <select v-model="form.tindakan" class="w-full px-4 py-3 bg-gray-50 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-medium">
                   <option value="">Pilih Tindakan</option>
                   <option value="Bersih">Bersih</option>
                   <option value="Eksekusi">Eksekusi</option>
                   <option value="Diteruskan ke Mandor">Diteruskan ke Mandor</option>
                 </select>            
              </div>
            </div>
          </div>

          <div class="bg-gray-50 p-6 rounded-2xl border border-gray-200">
            <div class="grid grid-cols-1 gap-6">
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Foto Lapangan</label>
                <div 
                  class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-xl bg-white hover:bg-gray-50 hover:border-blue-400 transition cursor-pointer relative"
                  @click="$refs.fileInput.click()"
                >
                  <div class="space-y-1 text-center" v-if="!previewUrl">
                    <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                      <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    <div class="flex text-sm text-gray-600 justify-center">
                      <span class="relative bg-white rounded-md font-bold text-blue-600 hover:text-blue-500">
                        Upload a file
                      </span>
                      <p class="pl-1">or drag and drop</p>
                    </div>
                    <p class="text-xs text-gray-500">PNG, JPG, GIF up to 5MB</p>
                  </div>
                  
                  <div v-else class="relative w-full flex justify-center">
                     <img :src="previewUrl" class="h-64 w-auto rounded-lg shadow-md border border-gray-200 object-cover" />
                     <button type="button" @click.stop="clearImage" class="absolute top-2 right-2 bg-red-600 text-white p-1.5 rounded-full hover:bg-red-700 shadow-lg transition">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                     </button>
                  </div>

                  <input ref="fileInput" type="file" @change="handleFileUpload" accept="image/*" class="hidden" />
                </div>
              </div>

              <div>
                 <label class="block text-sm font-bold text-gray-700 mb-2 uppercase tracking-wide">Keterangan Tambahan</label>
                 <textarea v-model="form.keterangan" rows="3" class="w-full px-4 py-3 bg-white border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 font-medium placeholder-gray-400" placeholder="Catatan tambahan..."></textarea>
              </div>
            </div>
          </div>

          <div class="flex gap-4 pt-4 border-t border-gray-200">
            <button type="submit" :disabled="isLoading"
              class="flex-1 flex justify-center items-center gap-3 bg-blue-600 text-white py-4 rounded-xl font-bold text-lg shadow-lg hover:bg-blue-700 hover:shadow-xl hover:-translate-y-0.5 transition transform disabled:opacity-70 disabled:cursor-not-allowed">
              <svg v-if="isLoading" class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              <span v-if="!isLoading">Save Observation</span>
              <span v-else>Processing...</span>
            </button>
            <button type="button" @click="switchTab('overview')" :disabled="isLoading"
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
import { reactive, ref, onMounted, computed, watch } from 'vue'
import Swal from 'sweetalert2'
import { useApi } from '@/composables/useApi' 

// State UI
const selectedAfdeling = ref('')
const selectedBlok = ref('')
const previewUrl = ref(null)
const photoFile = ref(null)
const fileInput = ref(null)
const isLoading = ref(false)

// Data Master
const listKaryawan = ref([])
const listLokasi = ref([]) 
const listPenyebab = ref([])
const listKondisi = ref([])

// Form Data (LENGKAP Sesuai Asli)
const form = reactive({
  tanggal: '',        
  id_lokasi: '',      
  id_karyawan: '',    
  lat_aktual: '',    
  long_aktual: '',    
  jenis_infrastruktur: '',     
  kondisi_aliran: '', 
  penyebab: '',       
  tindakan: '',       
  keterangan: ''      
})

// --- COMPUTED ---
const uniqueAfdelings = computed(() => {
  if (!listLokasi.value.length) return []
  const afdelings = listLokasi.value.map(item => item.afdeling)
  return [...new Set(afdelings)].sort()
})

const filteredBloks = computed(() => {
  if (!selectedAfdeling.value) return []
  return listLokasi.value
    .filter(item => item.afdeling === selectedAfdeling.value)
    .map(item => item.blok)
    .sort()
})

// --- WATCHERS ---
watch([selectedAfdeling, selectedBlok], ([newAfd, newBlok]) => {
    if (newAfd && newBlok) {
        const lokasiFound = listLokasi.value.find(l => l.afdeling === newAfd && l.blok === newBlok)
        form.id_lokasi = lokasiFound ? lokasiFound.id : ''
    } else {
        form.id_lokasi = ''
    }
})

// --- METHODS ---
const resetBlok = () => {
  selectedBlok.value = ''
  form.id_lokasi = ''
}

const switchTab = (tab) => {
    console.log("Switching to", tab)
    // Logika navigasi tab Anda
}

const getGeoLocation = () => {
    if (navigator.geolocation) {
        // Efek loading visual sebentar
        Swal.fire({
            title: 'Mencari Lokasi...',
            text: 'Mohon tunggu',
            allowOutsideClick: false,
            didOpen: () => { Swal.showLoading() }
        })

        navigator.geolocation.getCurrentPosition((position) => {
            form.lat_aktual = position.coords.latitude
            form.long_aktual = position.coords.longitude
            Swal.close() // Tutup loading
            
            // Notif kecil sukses
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000
            })
            Toast.fire({ icon: 'success', title: 'Lokasi berhasil diambil' })

        }, (error) => {
            Swal.fire({ icon: 'error', title: 'Gagal', text: error.message })
        })
    } else {
        Swal.fire({ icon: 'error', title: 'Error', text: "Browser tidak support geolocation" })
    }
}

const handleFileUpload = (event) => {
    const file = event.target.files[0]
    if (file) {
        if (file.size > 5 * 1024 * 1024) {
             Swal.fire('Error', 'Ukuran file terlalu besar! Maksimal 5MB.', 'error')
            return
        }
        photoFile.value = file
        previewUrl.value = URL.createObjectURL(file)
    }
}

const clearImage = () => {
    photoFile.value = null
    previewUrl.value = null
    if(fileInput.value) fileInput.value.value = ''
}

const resetForm = () => {
     // Reset semua field kecuali tanggal
    Object.keys(form).forEach(key => {
        if(key !== 'tanggal') form[key] = ''
    })
    form.tanggal = new Date().toISOString().substr(0, 10)
    selectedAfdeling.value = ''
    selectedBlok.value = ''
    clearImage()
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

const saveData = async () => {
    // Validasi Frontend
    if (!form.id_lokasi) {
        Swal.fire('Validasi Error', 'Mohon pilih Afdeling dan Blok yang valid.', 'warning')
        return
    }

    isLoading.value = true // Aktifkan loading spinner

    const formData = new FormData()
    for (const key in form) {
        const value = form[key] !== null && form[key] !== undefined ? form[key] : ''
        formData.append(key, value)
    }

    if (photoFile.value) {
        formData.append('foto_path', photoFile.value)
    }

    try {        
        // --- API CALL ASLI ---
        // Saya pertahankan logika ini sesuai kode awal Anda
        const response = await useApi('monitoring-mingguan', {
            method: 'POST',
            body: formData
        })

        // --- TOASTER SUKSES (SweetAlert2) ---
        Swal.fire({
            title: 'Berhasil Disimpan!',
            text: 'Data monitoring lapangan telah masuk ke sistem.',
            icon: 'success',
            confirmButtonText: 'Input Lagi',
            confirmButtonColor: '#2563EB', // Blue-600
            showCancelButton: true,
            cancelButtonText: 'Selesai',
            cancelButtonColor: '#9CA3AF'
        }).then((result) => {
            if (result.isConfirmed) {
                resetForm() // Reset form jika user mau input lagi
            } else {
               switchTab('overview') // Pindah halaman jika selesai
            }
        })
        
    } catch (error) {
        console.error("Gagal simpan", error)
        Swal.fire('Gagal!', 'Terjadi kesalahan saat menyimpan data. Silakan coba lagi.', 'error')
    } finally {
        isLoading.value = false // Matikan loading
    }
}

// --- LIFECYCLE ---
onMounted(async () => {
  const today = new Date().toISOString().substr(0, 10)
  form.tanggal = today
  
  // --- LOAD DATA MASTER (ASLI) ---
  try {
    // Memanggil API secara paralel agar lebih cepat
    const [dataKaryawan, dataLokasi, dataPenyebab, dataKondisi] = await Promise.all([
        useApi('list/karyawan'),
        useApi('list/lokasi'),
        useApi('list/skoring/Penyebab Masalah'),
        useApi('list/skoring/Kondisi Aliran')
    ])

    listKaryawan.value = dataKaryawan
    listLokasi.value = dataLokasi
    listPenyebab.value = dataPenyebab
    listKondisi.value = dataKondisi

  } catch (error) {
    console.error("Gagal ambil data master", error)
    Swal.fire('Error Connection', 'Gagal memuat data master (Karyawan/Lokasi). Cek koneksi internet.', 'error')
  }
})
</script>